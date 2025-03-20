part of 'text_generate_bloc.dart';

typedef SelectPrompt = Future<Prompt?> Function();

@freezed
class TextGenerateEvent with _$TextGenerateEvent {
  const factory TextGenerateEvent.started() = _Started;

  const factory TextGenerateEvent.useCaseChanged({
    required PromptUseCase useCase,
  }) = _UseCaseChanged;

  const factory TextGenerateEvent.generateContent(PromptUseCase promptUseCase) =
      _GenerateContent;

  const factory TextGenerateEvent.changeToEditMode() = _ChangeToEditMode;

  const factory TextGenerateEvent.changeToViewMode() = _ChangeToViewMode;

  const factory TextGenerateEvent.textChanged(String text) = _TextChanged;

  const factory TextGenerateEvent.completeAnimatedText() =
      _CompleteAnimatedText;

  const factory TextGenerateEvent.selectPrompt({
    required SelectPrompt selectPrompt,
  }) = _SelectPrompt;

  const factory TextGenerateEvent.generateContentWithPrompt({
    required String prompt,
  }) = _GenerateContentWithPrompt;

  const factory TextGenerateEvent.updateIdentifier(String identifier) =
      _UpdateIdentifier;
}
