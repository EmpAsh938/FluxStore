part of 'image_generate_bloc.dart';

@freezed
class ImageGenerateState with _$ImageGenerateState {
  const factory ImageGenerateState.initial({
    @Default(ImageGenerateModel()) ImageGenerateModel data,
  }) = _Initial;

  const factory ImageGenerateState.loading({
    required ImageGenerateModel data,
  }) = _Loading;

  const factory ImageGenerateState.success({
    required ImageGenerateModel data,
    required List<String> images,
  }) = _Success;

  const factory ImageGenerateState.error({
    required ImageGenerateModel data,
    required String errorMessage,
  }) = _Error;

  const factory ImageGenerateState.expiredSubscription({
    required ImageGenerateModel data,
    required String message,
    required String? identifier,
  }) = _ExpiredSubscription;

  const factory ImageGenerateState.updateIdentifierSuccess({
    required ImageGenerateModel data,
    required bool isExpiredSubscription,
  }) = _UpdateIdentifierSuccess;
}
