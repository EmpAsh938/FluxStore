import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/entities/text_generate/prompt_use_case.dart';

part 'text_generate_model.freezed.dart';

@freezed
class TextGenerateModel with _$TextGenerateModel {
  const factory TextGenerateModel({
    String? identifier,
    required PromptUseCase selectedUseCase,
    required List<PromptUseCase> useCases,
    @Default('') String content,
    @Default(false) bool isCompleteAnimatedText,
  }) = _TextGenerateModel;

  const TextGenerateModel._();

  bool get allowCopy => content.isNotEmpty;
}
