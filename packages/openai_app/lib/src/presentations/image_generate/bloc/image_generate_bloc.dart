import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../../generated/l10n.dart';
import '../../../core/components/exceptions/expired_subscription_exception.dart';
import '../../../domain/entities/image_generate/image_size.dart';
import '../../../domain/entities/image_generate/image_view_type.dart';
import '../../../domain/entities/payloads/image_generate_option_payload.dart';
import '../../../domain/usecase/feature_permission_usecase.dart';
import '../../../domain/usecase/image_generate_usecase.dart';
import '../../../domain/usecase/limit_image_generate_usecase.dart';
import 'image_generate_model.dart';

part 'image_generate_bloc.freezed.dart';
part 'image_generate_event.dart';
part 'image_generate_state.dart';

@injectable
class ImageGenerateBloc extends Bloc<ImageGenerateEvent, ImageGenerateState> {
  final ImageGenerateUseCase _imageGenerateUseCase;
  final LimitImageGenerateUsecase _limitSendImageGenerateUsecase;
  final FeaturePermissionUseCase _featurePermissionUseCase;

  ImageGenerateModel get data => state.data;

  ImageGenerateBloc(
    @factoryParam String? identifier,
    this._imageGenerateUseCase,
    this._limitSendImageGenerateUsecase,
    this._featurePermissionUseCase,
  ) : super(ImageGenerateState.initial(
          data: ImageGenerateModel(
            identifier: identifier,
          ),
        )) {
    on<_Started>(_onStarted);
    on<_TextChanged>(_onTextChanged);
    on<_ImageSizeChanged>(_onImageSizeChanged);
    on<_ImageViewChanged>(_onImageViewChanged);
    on<_GenerateImage>(_onGenerateImage);
    on<_UpdateIdentifier>(_onUpdateIdentifier);
  }

  FutureOr<void> _onStarted(
    _Started event,
    Emitter<ImageGenerateState> emit,
  ) async {
    final isPro = await _featurePermissionUseCase.isPro(data.identifier);
    final numberImageGen = _limitSendImageGenerateUsecase.getRemain();
    emit(ImageGenerateState.initial(
      data: data.copyWith(
        remainingImageGen: isPro ? 0 : numberImageGen,
      ),
    ));
  }

  FutureOr<void> _onTextChanged(
    _TextChanged event,
    Emitter<ImageGenerateState> emit,
  ) {
    emit(
      state.copyWith(
        data: state.data.copyWith(allowSubmit: event.text.trim().isNotEmpty),
      ),
    );
  }

  FutureOr<void> _onImageSizeChanged(
    _ImageSizeChanged event,
    Emitter<ImageGenerateState> emit,
  ) {
    emit(
      state.copyWith(
        data: state.data.copyWith(imageSize: event.imageSize),
      ),
    );
  }

  FutureOr<void> _onGenerateImage(
    _GenerateImage event,
    Emitter<ImageGenerateState> emit,
  ) async {
    emit(ImageGenerateState.loading(
      data: data.copyWith(allowSubmit: false),
    ));

    // Call API here
    try {
      final isPro = await _featurePermissionUseCase.isPro(data.identifier);
      if (!isPro) {
        if (_limitSendImageGenerateUsecase.isLimit()) {
          throw ExpiredSubscriptionException();
        }
      }

      final result = await _imageGenerateUseCase.generateImage(
        prompt: event.prompt,
        payload: event.optionPayload,
      );

      if (result == null) {
        emit(ImageGenerateState.error(
          data: data.copyWith(allowSubmit: true),
          errorMessage: S.current.somethingWhenWrong_openai,
        ));

        return;
      }

      if (isPro) {
        emit(ImageGenerateState.success(
          data: data.copyWith(
            allowSubmit: true,
            remainingImageGen: 0,
          ),
          images: result,
        ));

        return;
      }

      await _limitSendImageGenerateUsecase.increaseNumberImageGen();

      emit(ImageGenerateState.success(
        data: data.copyWith(
          allowSubmit: true,
          remainingImageGen: _limitSendImageGenerateUsecase.getRemain(),
        ),
        images: result,
      ));
    } on ExpiredSubscriptionException catch (e) {
      emit(ImageGenerateState.expiredSubscription(
        data: data.copyWith(allowSubmit: true),
        message: e.message,
        identifier: data.identifier,
      ));

      return;
    } catch (e) {
      emit(ImageGenerateState.error(
        data: data.copyWith(allowSubmit: true),
        errorMessage: S.current.failedToGenerate_openai,
      ));

      return;
    }
  }

  FutureOr<void> _onImageViewChanged(
    _ImageViewChanged event,
    Emitter<ImageGenerateState> emit,
  ) {
    emit(
      state.copyWith(
        data: data.copyWith(viewType: event.viewType),
      ),
    );
  }

  Future<FutureOr<void>> _onUpdateIdentifier(
    _UpdateIdentifier event,
    Emitter<ImageGenerateState> emit,
  ) async {
    final isActive = await _featurePermissionUseCase.isPro(event.identifier);

    emit(ImageGenerateState.updateIdentifierSuccess(
      data: data.copyWith(identifier: event.identifier),
      isExpiredSubscription: !isActive,
    ));
  }
}
