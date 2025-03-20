part of 'text_generate_bloc.dart';

@freezed
class TextGenerateState with _$TextGenerateState {
  const TextGenerateState._();

  const factory TextGenerateState.initial({
    required TextGenerateModel data,
  }) = _Initial;

  const factory TextGenerateState.loading({
    required TextGenerateModel data,
  }) = _Loading;

  const factory TextGenerateState.success({
    required TextGenerateModel data,
  }) = _Success;

  const factory TextGenerateState.failure({
    required TextGenerateModel data,
    required String message,
  }) = _Failure;

  const factory TextGenerateState.editMode({
    required TextGenerateModel data,
  }) = _EditMode;

  const factory TextGenerateState.viewMode({
    required TextGenerateModel data,
  }) = _ViewMode;

  const factory TextGenerateState.expiredSubscription({
    required TextGenerateModel data,
    required String message,
    required String? identifier,
  }) = _ExpiredSubscription;

  const factory TextGenerateState.selectPromptSuccess({
    required TextGenerateModel data,
    required Prompt prompt,
  }) = _SelectPromptSuccess;

  const factory TextGenerateState.updateIdentifierSuccess({
    required TextGenerateModel data,
    required bool isExpiredSubscription,
  }) = _UpdateIdentifierSuccess;

  bool get allowCopy => data.content.isNotEmpty && data.isCompleteAnimatedText;

  bool get allowClear => allowCopy;

  bool get allowEdit => data.content.isNotEmpty && data.isCompleteAnimatedText;
}
