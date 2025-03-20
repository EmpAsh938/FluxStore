import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../../generated/l10n.dart';
import '../../../core/components/exceptions/expired_subscription_exception.dart';
import '../../../domain/entities/prompt/prompt.dart';
import '../../../domain/entities/text_generate/prompt_use_case.dart';
import '../../../domain/usecase/feature_permission_usecase.dart';
import '../../../domain/usecase/text_generate_usecase.dart';
import 'text_generate_model.dart';

part 'text_generate_bloc.freezed.dart';
part 'text_generate_event.dart';
part 'text_generate_state.dart';

@injectable
class TextGenerateBloc extends Bloc<TextGenerateEvent, TextGenerateState> {
  final TextGenerateUsecase _textGenerateUsecase;
  final FeaturePermissionUseCase _featurePermissionUseCase;

  TextGenerateBloc(
    @factoryParam String? identifier,
    this._textGenerateUsecase,
    this._featurePermissionUseCase,
  ) : super(
          TextGenerateState.initial(
            data: TextGenerateModel(
              identifier: identifier,
              selectedUseCase: PromptUseCase.empty(),
              useCases: <PromptUseCase>[],
            ),
          ),
        ) {
    on<_Started>(_onStarted);
    on<_UseCaseChanged>(_onUseCaseChanged);
    on<_GenerateContent>(_onGenerateContent);
    on<_ChangeToEditMode>(_onChangeToEditMode);
    on<_ChangeToViewMode>(_onChangeToViewMode);
    on<_TextChanged>(_onTextChanged);
    on<_CompleteAnimatedText>(_onCompleteAnimatedText);
    on<_SelectPrompt>(_onSelectPrompt);
    on<_GenerateContentWithPrompt>(_onGenerateContentWithPrompt);
    on<_UpdateIdentifier>(_onUpdateIdentifier);
  }

  TextGenerateModel get data => state.data;

  FutureOr<void> _onStarted(
    _Started event,
    Emitter<TextGenerateState> emit,
  ) async {
    emit(TextGenerateState.loading(data: state.data));

    try {
      final useCases = await _textGenerateUsecase.getUseCases();

      if (useCases?.isEmpty ?? true) {
        throw ('No use cases found');
      }

      emit(
        TextGenerateState.initial(
          data: state.data.copyWith(
            useCases: useCases!,
            selectedUseCase: useCases.first,
          ),
        ),
      );
    } catch (e) {
      emit(
        TextGenerateState.failure(
          data: state.data,
          message: e.toString(),
        ),
      );
    }
  }

  FutureOr<void> _onUseCaseChanged(
    _UseCaseChanged event,
    Emitter<TextGenerateState> emit,
  ) {
    emit(
      TextGenerateState.initial(
        data: state.data.copyWith(selectedUseCase: event.useCase),
      ),
    );
  }

  FutureOr<void> _onGenerateContent(
    _GenerateContent event,
    Emitter<TextGenerateState> emit,
  ) async {
    emit(TextGenerateState.loading(data: state.data));

    try {
      if (!await _featurePermissionUseCase.isPro(data.identifier)) {
        throw ExpiredSubscriptionException();
      }

      final selectedUseCase = event.promptUseCase;

      final result = await _textGenerateUsecase
          .generateTextFromPromptUsecase(selectedUseCase);

      if (result == null) {
        throw (S.current.failedToGenerate_openai);
      }

      emit(
        TextGenerateState.success(
          data: state.data.copyWith(
            content: result,
            isCompleteAnimatedText: false,
          ),
        ),
      );
    } on ExpiredSubscriptionException catch (e) {
      emit(
        TextGenerateState.expiredSubscription(
          data: state.data,
          message: e.message,
          identifier: data.identifier,
        ),
      );
    } catch (e) {
      emit(
        TextGenerateState.failure(
          data: state.data,
          message: S.current.failedToGenerate_openai,
        ),
      );
    }
  }

  FutureOr<void> _onChangeToEditMode(
    _ChangeToEditMode event,
    Emitter<TextGenerateState> emit,
  ) {
    emit(
      TextGenerateState.editMode(data: state.data.copyWith()),
    );
  }

  FutureOr<void> _onChangeToViewMode(
    _ChangeToViewMode event,
    Emitter<TextGenerateState> emit,
  ) {
    emit(
      TextGenerateState.viewMode(data: state.data.copyWith()),
    );
  }

  FutureOr<void> _onTextChanged(
    _TextChanged event,
    Emitter<TextGenerateState> emit,
  ) {
    emit(
      TextGenerateState.initial(
        data: state.data.copyWith(
          content: event.text,
        ),
      ),
    );
  }

  FutureOr<void> _onCompleteAnimatedText(
    _CompleteAnimatedText event,
    Emitter<TextGenerateState> emit,
  ) {
    emit(
      state.copyWith(
        data: state.data.copyWith(
          isCompleteAnimatedText: true,
        ),
      ),
    );
  }

  FutureOr<void> _onSelectPrompt(
    _SelectPrompt event,
    Emitter<TextGenerateState> emit,
  ) async {
    emit(TextGenerateState.loading(data: state.data));

    final selectedPrompt = await event.selectPrompt();

    if (selectedPrompt == null) {
      emit(TextGenerateState.initial(data: state.data));

      return;
    }

    emit(
      TextGenerateState.selectPromptSuccess(
        data: state.data,
        prompt: selectedPrompt,
      ),
    );
  }

  FutureOr<void> _onGenerateContentWithPrompt(
    _GenerateContentWithPrompt event,
    Emitter<TextGenerateState> emit,
  ) async {
    emit(TextGenerateState.loading(data: state.data));

    try {
      if (!await _featurePermissionUseCase.isPro(data.identifier)) {
        throw ExpiredSubscriptionException();
      }

      final prompt = event.prompt;

      if (prompt.isEmpty) {
        emit(
          TextGenerateState.failure(
            data: state.data,
            message: S.current.pleaseInputFillAllFields_openai,
          ),
        );

        return;
      }

      final result =
          await _textGenerateUsecase.generateTextFromPromptText(prompt);

      if (result == null) {
        throw (S.current.failedToGenerate_openai);
      }

      emit(
        TextGenerateState.success(
          data: state.data.copyWith(
            content: result,
            isCompleteAnimatedText: false,
          ),
        ),
      );
    } on ExpiredSubscriptionException catch (e) {
      emit(
        TextGenerateState.expiredSubscription(
          data: state.data,
          message: e.message,
          identifier: data.identifier,
        ),
      );
    } catch (e) {
      emit(
        TextGenerateState.failure(
          data: state.data,
          message: S.current.failedToGenerate_openai,
        ),
      );
    }
  }

  FutureOr<void> _onUpdateIdentifier(
    _UpdateIdentifier event,
    Emitter<TextGenerateState> emit,
  ) async {
    final isActive = await _featurePermissionUseCase.isPro(event.identifier);

    emit(TextGenerateState.updateIdentifierSuccess(
      data: data.copyWith(identifier: event.identifier),
      isExpiredSubscription: !isActive,
    ));
  }
}
