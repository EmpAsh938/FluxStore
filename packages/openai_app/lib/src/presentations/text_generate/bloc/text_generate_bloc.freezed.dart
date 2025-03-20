// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'text_generate_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$TextGenerateEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(PromptUseCase useCase) useCaseChanged,
    required TResult Function(PromptUseCase promptUseCase) generateContent,
    required TResult Function() changeToEditMode,
    required TResult Function() changeToViewMode,
    required TResult Function(String text) textChanged,
    required TResult Function() completeAnimatedText,
    required TResult Function(SelectPrompt selectPrompt) selectPrompt,
    required TResult Function(String prompt) generateContentWithPrompt,
    required TResult Function(String identifier) updateIdentifier,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(PromptUseCase useCase)? useCaseChanged,
    TResult? Function(PromptUseCase promptUseCase)? generateContent,
    TResult? Function()? changeToEditMode,
    TResult? Function()? changeToViewMode,
    TResult? Function(String text)? textChanged,
    TResult? Function()? completeAnimatedText,
    TResult? Function(SelectPrompt selectPrompt)? selectPrompt,
    TResult? Function(String prompt)? generateContentWithPrompt,
    TResult? Function(String identifier)? updateIdentifier,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(PromptUseCase useCase)? useCaseChanged,
    TResult Function(PromptUseCase promptUseCase)? generateContent,
    TResult Function()? changeToEditMode,
    TResult Function()? changeToViewMode,
    TResult Function(String text)? textChanged,
    TResult Function()? completeAnimatedText,
    TResult Function(SelectPrompt selectPrompt)? selectPrompt,
    TResult Function(String prompt)? generateContentWithPrompt,
    TResult Function(String identifier)? updateIdentifier,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_UseCaseChanged value) useCaseChanged,
    required TResult Function(_GenerateContent value) generateContent,
    required TResult Function(_ChangeToEditMode value) changeToEditMode,
    required TResult Function(_ChangeToViewMode value) changeToViewMode,
    required TResult Function(_TextChanged value) textChanged,
    required TResult Function(_CompleteAnimatedText value) completeAnimatedText,
    required TResult Function(_SelectPrompt value) selectPrompt,
    required TResult Function(_GenerateContentWithPrompt value)
        generateContentWithPrompt,
    required TResult Function(_UpdateIdentifier value) updateIdentifier,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_UseCaseChanged value)? useCaseChanged,
    TResult? Function(_GenerateContent value)? generateContent,
    TResult? Function(_ChangeToEditMode value)? changeToEditMode,
    TResult? Function(_ChangeToViewMode value)? changeToViewMode,
    TResult? Function(_TextChanged value)? textChanged,
    TResult? Function(_CompleteAnimatedText value)? completeAnimatedText,
    TResult? Function(_SelectPrompt value)? selectPrompt,
    TResult? Function(_GenerateContentWithPrompt value)?
        generateContentWithPrompt,
    TResult? Function(_UpdateIdentifier value)? updateIdentifier,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_UseCaseChanged value)? useCaseChanged,
    TResult Function(_GenerateContent value)? generateContent,
    TResult Function(_ChangeToEditMode value)? changeToEditMode,
    TResult Function(_ChangeToViewMode value)? changeToViewMode,
    TResult Function(_TextChanged value)? textChanged,
    TResult Function(_CompleteAnimatedText value)? completeAnimatedText,
    TResult Function(_SelectPrompt value)? selectPrompt,
    TResult Function(_GenerateContentWithPrompt value)?
        generateContentWithPrompt,
    TResult Function(_UpdateIdentifier value)? updateIdentifier,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TextGenerateEventCopyWith<$Res> {
  factory $TextGenerateEventCopyWith(
          TextGenerateEvent value, $Res Function(TextGenerateEvent) then) =
      _$TextGenerateEventCopyWithImpl<$Res, TextGenerateEvent>;
}

/// @nodoc
class _$TextGenerateEventCopyWithImpl<$Res, $Val extends TextGenerateEvent>
    implements $TextGenerateEventCopyWith<$Res> {
  _$TextGenerateEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$StartedImplCopyWith<$Res> {
  factory _$$StartedImplCopyWith(
          _$StartedImpl value, $Res Function(_$StartedImpl) then) =
      __$$StartedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$StartedImplCopyWithImpl<$Res>
    extends _$TextGenerateEventCopyWithImpl<$Res, _$StartedImpl>
    implements _$$StartedImplCopyWith<$Res> {
  __$$StartedImplCopyWithImpl(
      _$StartedImpl _value, $Res Function(_$StartedImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$StartedImpl implements _Started {
  const _$StartedImpl();

  @override
  String toString() {
    return 'TextGenerateEvent.started()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$StartedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(PromptUseCase useCase) useCaseChanged,
    required TResult Function(PromptUseCase promptUseCase) generateContent,
    required TResult Function() changeToEditMode,
    required TResult Function() changeToViewMode,
    required TResult Function(String text) textChanged,
    required TResult Function() completeAnimatedText,
    required TResult Function(SelectPrompt selectPrompt) selectPrompt,
    required TResult Function(String prompt) generateContentWithPrompt,
    required TResult Function(String identifier) updateIdentifier,
  }) {
    return started();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(PromptUseCase useCase)? useCaseChanged,
    TResult? Function(PromptUseCase promptUseCase)? generateContent,
    TResult? Function()? changeToEditMode,
    TResult? Function()? changeToViewMode,
    TResult? Function(String text)? textChanged,
    TResult? Function()? completeAnimatedText,
    TResult? Function(SelectPrompt selectPrompt)? selectPrompt,
    TResult? Function(String prompt)? generateContentWithPrompt,
    TResult? Function(String identifier)? updateIdentifier,
  }) {
    return started?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(PromptUseCase useCase)? useCaseChanged,
    TResult Function(PromptUseCase promptUseCase)? generateContent,
    TResult Function()? changeToEditMode,
    TResult Function()? changeToViewMode,
    TResult Function(String text)? textChanged,
    TResult Function()? completeAnimatedText,
    TResult Function(SelectPrompt selectPrompt)? selectPrompt,
    TResult Function(String prompt)? generateContentWithPrompt,
    TResult Function(String identifier)? updateIdentifier,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_UseCaseChanged value) useCaseChanged,
    required TResult Function(_GenerateContent value) generateContent,
    required TResult Function(_ChangeToEditMode value) changeToEditMode,
    required TResult Function(_ChangeToViewMode value) changeToViewMode,
    required TResult Function(_TextChanged value) textChanged,
    required TResult Function(_CompleteAnimatedText value) completeAnimatedText,
    required TResult Function(_SelectPrompt value) selectPrompt,
    required TResult Function(_GenerateContentWithPrompt value)
        generateContentWithPrompt,
    required TResult Function(_UpdateIdentifier value) updateIdentifier,
  }) {
    return started(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_UseCaseChanged value)? useCaseChanged,
    TResult? Function(_GenerateContent value)? generateContent,
    TResult? Function(_ChangeToEditMode value)? changeToEditMode,
    TResult? Function(_ChangeToViewMode value)? changeToViewMode,
    TResult? Function(_TextChanged value)? textChanged,
    TResult? Function(_CompleteAnimatedText value)? completeAnimatedText,
    TResult? Function(_SelectPrompt value)? selectPrompt,
    TResult? Function(_GenerateContentWithPrompt value)?
        generateContentWithPrompt,
    TResult? Function(_UpdateIdentifier value)? updateIdentifier,
  }) {
    return started?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_UseCaseChanged value)? useCaseChanged,
    TResult Function(_GenerateContent value)? generateContent,
    TResult Function(_ChangeToEditMode value)? changeToEditMode,
    TResult Function(_ChangeToViewMode value)? changeToViewMode,
    TResult Function(_TextChanged value)? textChanged,
    TResult Function(_CompleteAnimatedText value)? completeAnimatedText,
    TResult Function(_SelectPrompt value)? selectPrompt,
    TResult Function(_GenerateContentWithPrompt value)?
        generateContentWithPrompt,
    TResult Function(_UpdateIdentifier value)? updateIdentifier,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started(this);
    }
    return orElse();
  }
}

abstract class _Started implements TextGenerateEvent {
  const factory _Started() = _$StartedImpl;
}

/// @nodoc
abstract class _$$UseCaseChangedImplCopyWith<$Res> {
  factory _$$UseCaseChangedImplCopyWith(_$UseCaseChangedImpl value,
          $Res Function(_$UseCaseChangedImpl) then) =
      __$$UseCaseChangedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({PromptUseCase useCase});

  $PromptUseCaseCopyWith<$Res> get useCase;
}

/// @nodoc
class __$$UseCaseChangedImplCopyWithImpl<$Res>
    extends _$TextGenerateEventCopyWithImpl<$Res, _$UseCaseChangedImpl>
    implements _$$UseCaseChangedImplCopyWith<$Res> {
  __$$UseCaseChangedImplCopyWithImpl(
      _$UseCaseChangedImpl _value, $Res Function(_$UseCaseChangedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? useCase = null,
  }) {
    return _then(_$UseCaseChangedImpl(
      useCase: null == useCase
          ? _value.useCase
          : useCase // ignore: cast_nullable_to_non_nullable
              as PromptUseCase,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $PromptUseCaseCopyWith<$Res> get useCase {
    return $PromptUseCaseCopyWith<$Res>(_value.useCase, (value) {
      return _then(_value.copyWith(useCase: value));
    });
  }
}

/// @nodoc

class _$UseCaseChangedImpl implements _UseCaseChanged {
  const _$UseCaseChangedImpl({required this.useCase});

  @override
  final PromptUseCase useCase;

  @override
  String toString() {
    return 'TextGenerateEvent.useCaseChanged(useCase: $useCase)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UseCaseChangedImpl &&
            (identical(other.useCase, useCase) || other.useCase == useCase));
  }

  @override
  int get hashCode => Object.hash(runtimeType, useCase);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UseCaseChangedImplCopyWith<_$UseCaseChangedImpl> get copyWith =>
      __$$UseCaseChangedImplCopyWithImpl<_$UseCaseChangedImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(PromptUseCase useCase) useCaseChanged,
    required TResult Function(PromptUseCase promptUseCase) generateContent,
    required TResult Function() changeToEditMode,
    required TResult Function() changeToViewMode,
    required TResult Function(String text) textChanged,
    required TResult Function() completeAnimatedText,
    required TResult Function(SelectPrompt selectPrompt) selectPrompt,
    required TResult Function(String prompt) generateContentWithPrompt,
    required TResult Function(String identifier) updateIdentifier,
  }) {
    return useCaseChanged(useCase);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(PromptUseCase useCase)? useCaseChanged,
    TResult? Function(PromptUseCase promptUseCase)? generateContent,
    TResult? Function()? changeToEditMode,
    TResult? Function()? changeToViewMode,
    TResult? Function(String text)? textChanged,
    TResult? Function()? completeAnimatedText,
    TResult? Function(SelectPrompt selectPrompt)? selectPrompt,
    TResult? Function(String prompt)? generateContentWithPrompt,
    TResult? Function(String identifier)? updateIdentifier,
  }) {
    return useCaseChanged?.call(useCase);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(PromptUseCase useCase)? useCaseChanged,
    TResult Function(PromptUseCase promptUseCase)? generateContent,
    TResult Function()? changeToEditMode,
    TResult Function()? changeToViewMode,
    TResult Function(String text)? textChanged,
    TResult Function()? completeAnimatedText,
    TResult Function(SelectPrompt selectPrompt)? selectPrompt,
    TResult Function(String prompt)? generateContentWithPrompt,
    TResult Function(String identifier)? updateIdentifier,
    required TResult orElse(),
  }) {
    if (useCaseChanged != null) {
      return useCaseChanged(useCase);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_UseCaseChanged value) useCaseChanged,
    required TResult Function(_GenerateContent value) generateContent,
    required TResult Function(_ChangeToEditMode value) changeToEditMode,
    required TResult Function(_ChangeToViewMode value) changeToViewMode,
    required TResult Function(_TextChanged value) textChanged,
    required TResult Function(_CompleteAnimatedText value) completeAnimatedText,
    required TResult Function(_SelectPrompt value) selectPrompt,
    required TResult Function(_GenerateContentWithPrompt value)
        generateContentWithPrompt,
    required TResult Function(_UpdateIdentifier value) updateIdentifier,
  }) {
    return useCaseChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_UseCaseChanged value)? useCaseChanged,
    TResult? Function(_GenerateContent value)? generateContent,
    TResult? Function(_ChangeToEditMode value)? changeToEditMode,
    TResult? Function(_ChangeToViewMode value)? changeToViewMode,
    TResult? Function(_TextChanged value)? textChanged,
    TResult? Function(_CompleteAnimatedText value)? completeAnimatedText,
    TResult? Function(_SelectPrompt value)? selectPrompt,
    TResult? Function(_GenerateContentWithPrompt value)?
        generateContentWithPrompt,
    TResult? Function(_UpdateIdentifier value)? updateIdentifier,
  }) {
    return useCaseChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_UseCaseChanged value)? useCaseChanged,
    TResult Function(_GenerateContent value)? generateContent,
    TResult Function(_ChangeToEditMode value)? changeToEditMode,
    TResult Function(_ChangeToViewMode value)? changeToViewMode,
    TResult Function(_TextChanged value)? textChanged,
    TResult Function(_CompleteAnimatedText value)? completeAnimatedText,
    TResult Function(_SelectPrompt value)? selectPrompt,
    TResult Function(_GenerateContentWithPrompt value)?
        generateContentWithPrompt,
    TResult Function(_UpdateIdentifier value)? updateIdentifier,
    required TResult orElse(),
  }) {
    if (useCaseChanged != null) {
      return useCaseChanged(this);
    }
    return orElse();
  }
}

abstract class _UseCaseChanged implements TextGenerateEvent {
  const factory _UseCaseChanged({required final PromptUseCase useCase}) =
      _$UseCaseChangedImpl;

  PromptUseCase get useCase;
  @JsonKey(ignore: true)
  _$$UseCaseChangedImplCopyWith<_$UseCaseChangedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$GenerateContentImplCopyWith<$Res> {
  factory _$$GenerateContentImplCopyWith(_$GenerateContentImpl value,
          $Res Function(_$GenerateContentImpl) then) =
      __$$GenerateContentImplCopyWithImpl<$Res>;
  @useResult
  $Res call({PromptUseCase promptUseCase});

  $PromptUseCaseCopyWith<$Res> get promptUseCase;
}

/// @nodoc
class __$$GenerateContentImplCopyWithImpl<$Res>
    extends _$TextGenerateEventCopyWithImpl<$Res, _$GenerateContentImpl>
    implements _$$GenerateContentImplCopyWith<$Res> {
  __$$GenerateContentImplCopyWithImpl(
      _$GenerateContentImpl _value, $Res Function(_$GenerateContentImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? promptUseCase = null,
  }) {
    return _then(_$GenerateContentImpl(
      null == promptUseCase
          ? _value.promptUseCase
          : promptUseCase // ignore: cast_nullable_to_non_nullable
              as PromptUseCase,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $PromptUseCaseCopyWith<$Res> get promptUseCase {
    return $PromptUseCaseCopyWith<$Res>(_value.promptUseCase, (value) {
      return _then(_value.copyWith(promptUseCase: value));
    });
  }
}

/// @nodoc

class _$GenerateContentImpl implements _GenerateContent {
  const _$GenerateContentImpl(this.promptUseCase);

  @override
  final PromptUseCase promptUseCase;

  @override
  String toString() {
    return 'TextGenerateEvent.generateContent(promptUseCase: $promptUseCase)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GenerateContentImpl &&
            (identical(other.promptUseCase, promptUseCase) ||
                other.promptUseCase == promptUseCase));
  }

  @override
  int get hashCode => Object.hash(runtimeType, promptUseCase);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GenerateContentImplCopyWith<_$GenerateContentImpl> get copyWith =>
      __$$GenerateContentImplCopyWithImpl<_$GenerateContentImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(PromptUseCase useCase) useCaseChanged,
    required TResult Function(PromptUseCase promptUseCase) generateContent,
    required TResult Function() changeToEditMode,
    required TResult Function() changeToViewMode,
    required TResult Function(String text) textChanged,
    required TResult Function() completeAnimatedText,
    required TResult Function(SelectPrompt selectPrompt) selectPrompt,
    required TResult Function(String prompt) generateContentWithPrompt,
    required TResult Function(String identifier) updateIdentifier,
  }) {
    return generateContent(promptUseCase);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(PromptUseCase useCase)? useCaseChanged,
    TResult? Function(PromptUseCase promptUseCase)? generateContent,
    TResult? Function()? changeToEditMode,
    TResult? Function()? changeToViewMode,
    TResult? Function(String text)? textChanged,
    TResult? Function()? completeAnimatedText,
    TResult? Function(SelectPrompt selectPrompt)? selectPrompt,
    TResult? Function(String prompt)? generateContentWithPrompt,
    TResult? Function(String identifier)? updateIdentifier,
  }) {
    return generateContent?.call(promptUseCase);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(PromptUseCase useCase)? useCaseChanged,
    TResult Function(PromptUseCase promptUseCase)? generateContent,
    TResult Function()? changeToEditMode,
    TResult Function()? changeToViewMode,
    TResult Function(String text)? textChanged,
    TResult Function()? completeAnimatedText,
    TResult Function(SelectPrompt selectPrompt)? selectPrompt,
    TResult Function(String prompt)? generateContentWithPrompt,
    TResult Function(String identifier)? updateIdentifier,
    required TResult orElse(),
  }) {
    if (generateContent != null) {
      return generateContent(promptUseCase);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_UseCaseChanged value) useCaseChanged,
    required TResult Function(_GenerateContent value) generateContent,
    required TResult Function(_ChangeToEditMode value) changeToEditMode,
    required TResult Function(_ChangeToViewMode value) changeToViewMode,
    required TResult Function(_TextChanged value) textChanged,
    required TResult Function(_CompleteAnimatedText value) completeAnimatedText,
    required TResult Function(_SelectPrompt value) selectPrompt,
    required TResult Function(_GenerateContentWithPrompt value)
        generateContentWithPrompt,
    required TResult Function(_UpdateIdentifier value) updateIdentifier,
  }) {
    return generateContent(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_UseCaseChanged value)? useCaseChanged,
    TResult? Function(_GenerateContent value)? generateContent,
    TResult? Function(_ChangeToEditMode value)? changeToEditMode,
    TResult? Function(_ChangeToViewMode value)? changeToViewMode,
    TResult? Function(_TextChanged value)? textChanged,
    TResult? Function(_CompleteAnimatedText value)? completeAnimatedText,
    TResult? Function(_SelectPrompt value)? selectPrompt,
    TResult? Function(_GenerateContentWithPrompt value)?
        generateContentWithPrompt,
    TResult? Function(_UpdateIdentifier value)? updateIdentifier,
  }) {
    return generateContent?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_UseCaseChanged value)? useCaseChanged,
    TResult Function(_GenerateContent value)? generateContent,
    TResult Function(_ChangeToEditMode value)? changeToEditMode,
    TResult Function(_ChangeToViewMode value)? changeToViewMode,
    TResult Function(_TextChanged value)? textChanged,
    TResult Function(_CompleteAnimatedText value)? completeAnimatedText,
    TResult Function(_SelectPrompt value)? selectPrompt,
    TResult Function(_GenerateContentWithPrompt value)?
        generateContentWithPrompt,
    TResult Function(_UpdateIdentifier value)? updateIdentifier,
    required TResult orElse(),
  }) {
    if (generateContent != null) {
      return generateContent(this);
    }
    return orElse();
  }
}

abstract class _GenerateContent implements TextGenerateEvent {
  const factory _GenerateContent(final PromptUseCase promptUseCase) =
      _$GenerateContentImpl;

  PromptUseCase get promptUseCase;
  @JsonKey(ignore: true)
  _$$GenerateContentImplCopyWith<_$GenerateContentImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ChangeToEditModeImplCopyWith<$Res> {
  factory _$$ChangeToEditModeImplCopyWith(_$ChangeToEditModeImpl value,
          $Res Function(_$ChangeToEditModeImpl) then) =
      __$$ChangeToEditModeImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ChangeToEditModeImplCopyWithImpl<$Res>
    extends _$TextGenerateEventCopyWithImpl<$Res, _$ChangeToEditModeImpl>
    implements _$$ChangeToEditModeImplCopyWith<$Res> {
  __$$ChangeToEditModeImplCopyWithImpl(_$ChangeToEditModeImpl _value,
      $Res Function(_$ChangeToEditModeImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$ChangeToEditModeImpl implements _ChangeToEditMode {
  const _$ChangeToEditModeImpl();

  @override
  String toString() {
    return 'TextGenerateEvent.changeToEditMode()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ChangeToEditModeImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(PromptUseCase useCase) useCaseChanged,
    required TResult Function(PromptUseCase promptUseCase) generateContent,
    required TResult Function() changeToEditMode,
    required TResult Function() changeToViewMode,
    required TResult Function(String text) textChanged,
    required TResult Function() completeAnimatedText,
    required TResult Function(SelectPrompt selectPrompt) selectPrompt,
    required TResult Function(String prompt) generateContentWithPrompt,
    required TResult Function(String identifier) updateIdentifier,
  }) {
    return changeToEditMode();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(PromptUseCase useCase)? useCaseChanged,
    TResult? Function(PromptUseCase promptUseCase)? generateContent,
    TResult? Function()? changeToEditMode,
    TResult? Function()? changeToViewMode,
    TResult? Function(String text)? textChanged,
    TResult? Function()? completeAnimatedText,
    TResult? Function(SelectPrompt selectPrompt)? selectPrompt,
    TResult? Function(String prompt)? generateContentWithPrompt,
    TResult? Function(String identifier)? updateIdentifier,
  }) {
    return changeToEditMode?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(PromptUseCase useCase)? useCaseChanged,
    TResult Function(PromptUseCase promptUseCase)? generateContent,
    TResult Function()? changeToEditMode,
    TResult Function()? changeToViewMode,
    TResult Function(String text)? textChanged,
    TResult Function()? completeAnimatedText,
    TResult Function(SelectPrompt selectPrompt)? selectPrompt,
    TResult Function(String prompt)? generateContentWithPrompt,
    TResult Function(String identifier)? updateIdentifier,
    required TResult orElse(),
  }) {
    if (changeToEditMode != null) {
      return changeToEditMode();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_UseCaseChanged value) useCaseChanged,
    required TResult Function(_GenerateContent value) generateContent,
    required TResult Function(_ChangeToEditMode value) changeToEditMode,
    required TResult Function(_ChangeToViewMode value) changeToViewMode,
    required TResult Function(_TextChanged value) textChanged,
    required TResult Function(_CompleteAnimatedText value) completeAnimatedText,
    required TResult Function(_SelectPrompt value) selectPrompt,
    required TResult Function(_GenerateContentWithPrompt value)
        generateContentWithPrompt,
    required TResult Function(_UpdateIdentifier value) updateIdentifier,
  }) {
    return changeToEditMode(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_UseCaseChanged value)? useCaseChanged,
    TResult? Function(_GenerateContent value)? generateContent,
    TResult? Function(_ChangeToEditMode value)? changeToEditMode,
    TResult? Function(_ChangeToViewMode value)? changeToViewMode,
    TResult? Function(_TextChanged value)? textChanged,
    TResult? Function(_CompleteAnimatedText value)? completeAnimatedText,
    TResult? Function(_SelectPrompt value)? selectPrompt,
    TResult? Function(_GenerateContentWithPrompt value)?
        generateContentWithPrompt,
    TResult? Function(_UpdateIdentifier value)? updateIdentifier,
  }) {
    return changeToEditMode?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_UseCaseChanged value)? useCaseChanged,
    TResult Function(_GenerateContent value)? generateContent,
    TResult Function(_ChangeToEditMode value)? changeToEditMode,
    TResult Function(_ChangeToViewMode value)? changeToViewMode,
    TResult Function(_TextChanged value)? textChanged,
    TResult Function(_CompleteAnimatedText value)? completeAnimatedText,
    TResult Function(_SelectPrompt value)? selectPrompt,
    TResult Function(_GenerateContentWithPrompt value)?
        generateContentWithPrompt,
    TResult Function(_UpdateIdentifier value)? updateIdentifier,
    required TResult orElse(),
  }) {
    if (changeToEditMode != null) {
      return changeToEditMode(this);
    }
    return orElse();
  }
}

abstract class _ChangeToEditMode implements TextGenerateEvent {
  const factory _ChangeToEditMode() = _$ChangeToEditModeImpl;
}

/// @nodoc
abstract class _$$ChangeToViewModeImplCopyWith<$Res> {
  factory _$$ChangeToViewModeImplCopyWith(_$ChangeToViewModeImpl value,
          $Res Function(_$ChangeToViewModeImpl) then) =
      __$$ChangeToViewModeImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ChangeToViewModeImplCopyWithImpl<$Res>
    extends _$TextGenerateEventCopyWithImpl<$Res, _$ChangeToViewModeImpl>
    implements _$$ChangeToViewModeImplCopyWith<$Res> {
  __$$ChangeToViewModeImplCopyWithImpl(_$ChangeToViewModeImpl _value,
      $Res Function(_$ChangeToViewModeImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$ChangeToViewModeImpl implements _ChangeToViewMode {
  const _$ChangeToViewModeImpl();

  @override
  String toString() {
    return 'TextGenerateEvent.changeToViewMode()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ChangeToViewModeImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(PromptUseCase useCase) useCaseChanged,
    required TResult Function(PromptUseCase promptUseCase) generateContent,
    required TResult Function() changeToEditMode,
    required TResult Function() changeToViewMode,
    required TResult Function(String text) textChanged,
    required TResult Function() completeAnimatedText,
    required TResult Function(SelectPrompt selectPrompt) selectPrompt,
    required TResult Function(String prompt) generateContentWithPrompt,
    required TResult Function(String identifier) updateIdentifier,
  }) {
    return changeToViewMode();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(PromptUseCase useCase)? useCaseChanged,
    TResult? Function(PromptUseCase promptUseCase)? generateContent,
    TResult? Function()? changeToEditMode,
    TResult? Function()? changeToViewMode,
    TResult? Function(String text)? textChanged,
    TResult? Function()? completeAnimatedText,
    TResult? Function(SelectPrompt selectPrompt)? selectPrompt,
    TResult? Function(String prompt)? generateContentWithPrompt,
    TResult? Function(String identifier)? updateIdentifier,
  }) {
    return changeToViewMode?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(PromptUseCase useCase)? useCaseChanged,
    TResult Function(PromptUseCase promptUseCase)? generateContent,
    TResult Function()? changeToEditMode,
    TResult Function()? changeToViewMode,
    TResult Function(String text)? textChanged,
    TResult Function()? completeAnimatedText,
    TResult Function(SelectPrompt selectPrompt)? selectPrompt,
    TResult Function(String prompt)? generateContentWithPrompt,
    TResult Function(String identifier)? updateIdentifier,
    required TResult orElse(),
  }) {
    if (changeToViewMode != null) {
      return changeToViewMode();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_UseCaseChanged value) useCaseChanged,
    required TResult Function(_GenerateContent value) generateContent,
    required TResult Function(_ChangeToEditMode value) changeToEditMode,
    required TResult Function(_ChangeToViewMode value) changeToViewMode,
    required TResult Function(_TextChanged value) textChanged,
    required TResult Function(_CompleteAnimatedText value) completeAnimatedText,
    required TResult Function(_SelectPrompt value) selectPrompt,
    required TResult Function(_GenerateContentWithPrompt value)
        generateContentWithPrompt,
    required TResult Function(_UpdateIdentifier value) updateIdentifier,
  }) {
    return changeToViewMode(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_UseCaseChanged value)? useCaseChanged,
    TResult? Function(_GenerateContent value)? generateContent,
    TResult? Function(_ChangeToEditMode value)? changeToEditMode,
    TResult? Function(_ChangeToViewMode value)? changeToViewMode,
    TResult? Function(_TextChanged value)? textChanged,
    TResult? Function(_CompleteAnimatedText value)? completeAnimatedText,
    TResult? Function(_SelectPrompt value)? selectPrompt,
    TResult? Function(_GenerateContentWithPrompt value)?
        generateContentWithPrompt,
    TResult? Function(_UpdateIdentifier value)? updateIdentifier,
  }) {
    return changeToViewMode?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_UseCaseChanged value)? useCaseChanged,
    TResult Function(_GenerateContent value)? generateContent,
    TResult Function(_ChangeToEditMode value)? changeToEditMode,
    TResult Function(_ChangeToViewMode value)? changeToViewMode,
    TResult Function(_TextChanged value)? textChanged,
    TResult Function(_CompleteAnimatedText value)? completeAnimatedText,
    TResult Function(_SelectPrompt value)? selectPrompt,
    TResult Function(_GenerateContentWithPrompt value)?
        generateContentWithPrompt,
    TResult Function(_UpdateIdentifier value)? updateIdentifier,
    required TResult orElse(),
  }) {
    if (changeToViewMode != null) {
      return changeToViewMode(this);
    }
    return orElse();
  }
}

abstract class _ChangeToViewMode implements TextGenerateEvent {
  const factory _ChangeToViewMode() = _$ChangeToViewModeImpl;
}

/// @nodoc
abstract class _$$TextChangedImplCopyWith<$Res> {
  factory _$$TextChangedImplCopyWith(
          _$TextChangedImpl value, $Res Function(_$TextChangedImpl) then) =
      __$$TextChangedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String text});
}

/// @nodoc
class __$$TextChangedImplCopyWithImpl<$Res>
    extends _$TextGenerateEventCopyWithImpl<$Res, _$TextChangedImpl>
    implements _$$TextChangedImplCopyWith<$Res> {
  __$$TextChangedImplCopyWithImpl(
      _$TextChangedImpl _value, $Res Function(_$TextChangedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? text = null,
  }) {
    return _then(_$TextChangedImpl(
      null == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$TextChangedImpl implements _TextChanged {
  const _$TextChangedImpl(this.text);

  @override
  final String text;

  @override
  String toString() {
    return 'TextGenerateEvent.textChanged(text: $text)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TextChangedImpl &&
            (identical(other.text, text) || other.text == text));
  }

  @override
  int get hashCode => Object.hash(runtimeType, text);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TextChangedImplCopyWith<_$TextChangedImpl> get copyWith =>
      __$$TextChangedImplCopyWithImpl<_$TextChangedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(PromptUseCase useCase) useCaseChanged,
    required TResult Function(PromptUseCase promptUseCase) generateContent,
    required TResult Function() changeToEditMode,
    required TResult Function() changeToViewMode,
    required TResult Function(String text) textChanged,
    required TResult Function() completeAnimatedText,
    required TResult Function(SelectPrompt selectPrompt) selectPrompt,
    required TResult Function(String prompt) generateContentWithPrompt,
    required TResult Function(String identifier) updateIdentifier,
  }) {
    return textChanged(text);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(PromptUseCase useCase)? useCaseChanged,
    TResult? Function(PromptUseCase promptUseCase)? generateContent,
    TResult? Function()? changeToEditMode,
    TResult? Function()? changeToViewMode,
    TResult? Function(String text)? textChanged,
    TResult? Function()? completeAnimatedText,
    TResult? Function(SelectPrompt selectPrompt)? selectPrompt,
    TResult? Function(String prompt)? generateContentWithPrompt,
    TResult? Function(String identifier)? updateIdentifier,
  }) {
    return textChanged?.call(text);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(PromptUseCase useCase)? useCaseChanged,
    TResult Function(PromptUseCase promptUseCase)? generateContent,
    TResult Function()? changeToEditMode,
    TResult Function()? changeToViewMode,
    TResult Function(String text)? textChanged,
    TResult Function()? completeAnimatedText,
    TResult Function(SelectPrompt selectPrompt)? selectPrompt,
    TResult Function(String prompt)? generateContentWithPrompt,
    TResult Function(String identifier)? updateIdentifier,
    required TResult orElse(),
  }) {
    if (textChanged != null) {
      return textChanged(text);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_UseCaseChanged value) useCaseChanged,
    required TResult Function(_GenerateContent value) generateContent,
    required TResult Function(_ChangeToEditMode value) changeToEditMode,
    required TResult Function(_ChangeToViewMode value) changeToViewMode,
    required TResult Function(_TextChanged value) textChanged,
    required TResult Function(_CompleteAnimatedText value) completeAnimatedText,
    required TResult Function(_SelectPrompt value) selectPrompt,
    required TResult Function(_GenerateContentWithPrompt value)
        generateContentWithPrompt,
    required TResult Function(_UpdateIdentifier value) updateIdentifier,
  }) {
    return textChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_UseCaseChanged value)? useCaseChanged,
    TResult? Function(_GenerateContent value)? generateContent,
    TResult? Function(_ChangeToEditMode value)? changeToEditMode,
    TResult? Function(_ChangeToViewMode value)? changeToViewMode,
    TResult? Function(_TextChanged value)? textChanged,
    TResult? Function(_CompleteAnimatedText value)? completeAnimatedText,
    TResult? Function(_SelectPrompt value)? selectPrompt,
    TResult? Function(_GenerateContentWithPrompt value)?
        generateContentWithPrompt,
    TResult? Function(_UpdateIdentifier value)? updateIdentifier,
  }) {
    return textChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_UseCaseChanged value)? useCaseChanged,
    TResult Function(_GenerateContent value)? generateContent,
    TResult Function(_ChangeToEditMode value)? changeToEditMode,
    TResult Function(_ChangeToViewMode value)? changeToViewMode,
    TResult Function(_TextChanged value)? textChanged,
    TResult Function(_CompleteAnimatedText value)? completeAnimatedText,
    TResult Function(_SelectPrompt value)? selectPrompt,
    TResult Function(_GenerateContentWithPrompt value)?
        generateContentWithPrompt,
    TResult Function(_UpdateIdentifier value)? updateIdentifier,
    required TResult orElse(),
  }) {
    if (textChanged != null) {
      return textChanged(this);
    }
    return orElse();
  }
}

abstract class _TextChanged implements TextGenerateEvent {
  const factory _TextChanged(final String text) = _$TextChangedImpl;

  String get text;
  @JsonKey(ignore: true)
  _$$TextChangedImplCopyWith<_$TextChangedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CompleteAnimatedTextImplCopyWith<$Res> {
  factory _$$CompleteAnimatedTextImplCopyWith(_$CompleteAnimatedTextImpl value,
          $Res Function(_$CompleteAnimatedTextImpl) then) =
      __$$CompleteAnimatedTextImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$CompleteAnimatedTextImplCopyWithImpl<$Res>
    extends _$TextGenerateEventCopyWithImpl<$Res, _$CompleteAnimatedTextImpl>
    implements _$$CompleteAnimatedTextImplCopyWith<$Res> {
  __$$CompleteAnimatedTextImplCopyWithImpl(_$CompleteAnimatedTextImpl _value,
      $Res Function(_$CompleteAnimatedTextImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$CompleteAnimatedTextImpl implements _CompleteAnimatedText {
  const _$CompleteAnimatedTextImpl();

  @override
  String toString() {
    return 'TextGenerateEvent.completeAnimatedText()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CompleteAnimatedTextImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(PromptUseCase useCase) useCaseChanged,
    required TResult Function(PromptUseCase promptUseCase) generateContent,
    required TResult Function() changeToEditMode,
    required TResult Function() changeToViewMode,
    required TResult Function(String text) textChanged,
    required TResult Function() completeAnimatedText,
    required TResult Function(SelectPrompt selectPrompt) selectPrompt,
    required TResult Function(String prompt) generateContentWithPrompt,
    required TResult Function(String identifier) updateIdentifier,
  }) {
    return completeAnimatedText();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(PromptUseCase useCase)? useCaseChanged,
    TResult? Function(PromptUseCase promptUseCase)? generateContent,
    TResult? Function()? changeToEditMode,
    TResult? Function()? changeToViewMode,
    TResult? Function(String text)? textChanged,
    TResult? Function()? completeAnimatedText,
    TResult? Function(SelectPrompt selectPrompt)? selectPrompt,
    TResult? Function(String prompt)? generateContentWithPrompt,
    TResult? Function(String identifier)? updateIdentifier,
  }) {
    return completeAnimatedText?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(PromptUseCase useCase)? useCaseChanged,
    TResult Function(PromptUseCase promptUseCase)? generateContent,
    TResult Function()? changeToEditMode,
    TResult Function()? changeToViewMode,
    TResult Function(String text)? textChanged,
    TResult Function()? completeAnimatedText,
    TResult Function(SelectPrompt selectPrompt)? selectPrompt,
    TResult Function(String prompt)? generateContentWithPrompt,
    TResult Function(String identifier)? updateIdentifier,
    required TResult orElse(),
  }) {
    if (completeAnimatedText != null) {
      return completeAnimatedText();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_UseCaseChanged value) useCaseChanged,
    required TResult Function(_GenerateContent value) generateContent,
    required TResult Function(_ChangeToEditMode value) changeToEditMode,
    required TResult Function(_ChangeToViewMode value) changeToViewMode,
    required TResult Function(_TextChanged value) textChanged,
    required TResult Function(_CompleteAnimatedText value) completeAnimatedText,
    required TResult Function(_SelectPrompt value) selectPrompt,
    required TResult Function(_GenerateContentWithPrompt value)
        generateContentWithPrompt,
    required TResult Function(_UpdateIdentifier value) updateIdentifier,
  }) {
    return completeAnimatedText(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_UseCaseChanged value)? useCaseChanged,
    TResult? Function(_GenerateContent value)? generateContent,
    TResult? Function(_ChangeToEditMode value)? changeToEditMode,
    TResult? Function(_ChangeToViewMode value)? changeToViewMode,
    TResult? Function(_TextChanged value)? textChanged,
    TResult? Function(_CompleteAnimatedText value)? completeAnimatedText,
    TResult? Function(_SelectPrompt value)? selectPrompt,
    TResult? Function(_GenerateContentWithPrompt value)?
        generateContentWithPrompt,
    TResult? Function(_UpdateIdentifier value)? updateIdentifier,
  }) {
    return completeAnimatedText?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_UseCaseChanged value)? useCaseChanged,
    TResult Function(_GenerateContent value)? generateContent,
    TResult Function(_ChangeToEditMode value)? changeToEditMode,
    TResult Function(_ChangeToViewMode value)? changeToViewMode,
    TResult Function(_TextChanged value)? textChanged,
    TResult Function(_CompleteAnimatedText value)? completeAnimatedText,
    TResult Function(_SelectPrompt value)? selectPrompt,
    TResult Function(_GenerateContentWithPrompt value)?
        generateContentWithPrompt,
    TResult Function(_UpdateIdentifier value)? updateIdentifier,
    required TResult orElse(),
  }) {
    if (completeAnimatedText != null) {
      return completeAnimatedText(this);
    }
    return orElse();
  }
}

abstract class _CompleteAnimatedText implements TextGenerateEvent {
  const factory _CompleteAnimatedText() = _$CompleteAnimatedTextImpl;
}

/// @nodoc
abstract class _$$SelectPromptImplCopyWith<$Res> {
  factory _$$SelectPromptImplCopyWith(
          _$SelectPromptImpl value, $Res Function(_$SelectPromptImpl) then) =
      __$$SelectPromptImplCopyWithImpl<$Res>;
  @useResult
  $Res call({SelectPrompt selectPrompt});
}

/// @nodoc
class __$$SelectPromptImplCopyWithImpl<$Res>
    extends _$TextGenerateEventCopyWithImpl<$Res, _$SelectPromptImpl>
    implements _$$SelectPromptImplCopyWith<$Res> {
  __$$SelectPromptImplCopyWithImpl(
      _$SelectPromptImpl _value, $Res Function(_$SelectPromptImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? selectPrompt = null,
  }) {
    return _then(_$SelectPromptImpl(
      selectPrompt: null == selectPrompt
          ? _value.selectPrompt
          : selectPrompt // ignore: cast_nullable_to_non_nullable
              as SelectPrompt,
    ));
  }
}

/// @nodoc

class _$SelectPromptImpl implements _SelectPrompt {
  const _$SelectPromptImpl({required this.selectPrompt});

  @override
  final SelectPrompt selectPrompt;

  @override
  String toString() {
    return 'TextGenerateEvent.selectPrompt(selectPrompt: $selectPrompt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SelectPromptImpl &&
            (identical(other.selectPrompt, selectPrompt) ||
                other.selectPrompt == selectPrompt));
  }

  @override
  int get hashCode => Object.hash(runtimeType, selectPrompt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SelectPromptImplCopyWith<_$SelectPromptImpl> get copyWith =>
      __$$SelectPromptImplCopyWithImpl<_$SelectPromptImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(PromptUseCase useCase) useCaseChanged,
    required TResult Function(PromptUseCase promptUseCase) generateContent,
    required TResult Function() changeToEditMode,
    required TResult Function() changeToViewMode,
    required TResult Function(String text) textChanged,
    required TResult Function() completeAnimatedText,
    required TResult Function(SelectPrompt selectPrompt) selectPrompt,
    required TResult Function(String prompt) generateContentWithPrompt,
    required TResult Function(String identifier) updateIdentifier,
  }) {
    return selectPrompt(this.selectPrompt);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(PromptUseCase useCase)? useCaseChanged,
    TResult? Function(PromptUseCase promptUseCase)? generateContent,
    TResult? Function()? changeToEditMode,
    TResult? Function()? changeToViewMode,
    TResult? Function(String text)? textChanged,
    TResult? Function()? completeAnimatedText,
    TResult? Function(SelectPrompt selectPrompt)? selectPrompt,
    TResult? Function(String prompt)? generateContentWithPrompt,
    TResult? Function(String identifier)? updateIdentifier,
  }) {
    return selectPrompt?.call(this.selectPrompt);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(PromptUseCase useCase)? useCaseChanged,
    TResult Function(PromptUseCase promptUseCase)? generateContent,
    TResult Function()? changeToEditMode,
    TResult Function()? changeToViewMode,
    TResult Function(String text)? textChanged,
    TResult Function()? completeAnimatedText,
    TResult Function(SelectPrompt selectPrompt)? selectPrompt,
    TResult Function(String prompt)? generateContentWithPrompt,
    TResult Function(String identifier)? updateIdentifier,
    required TResult orElse(),
  }) {
    if (selectPrompt != null) {
      return selectPrompt(this.selectPrompt);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_UseCaseChanged value) useCaseChanged,
    required TResult Function(_GenerateContent value) generateContent,
    required TResult Function(_ChangeToEditMode value) changeToEditMode,
    required TResult Function(_ChangeToViewMode value) changeToViewMode,
    required TResult Function(_TextChanged value) textChanged,
    required TResult Function(_CompleteAnimatedText value) completeAnimatedText,
    required TResult Function(_SelectPrompt value) selectPrompt,
    required TResult Function(_GenerateContentWithPrompt value)
        generateContentWithPrompt,
    required TResult Function(_UpdateIdentifier value) updateIdentifier,
  }) {
    return selectPrompt(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_UseCaseChanged value)? useCaseChanged,
    TResult? Function(_GenerateContent value)? generateContent,
    TResult? Function(_ChangeToEditMode value)? changeToEditMode,
    TResult? Function(_ChangeToViewMode value)? changeToViewMode,
    TResult? Function(_TextChanged value)? textChanged,
    TResult? Function(_CompleteAnimatedText value)? completeAnimatedText,
    TResult? Function(_SelectPrompt value)? selectPrompt,
    TResult? Function(_GenerateContentWithPrompt value)?
        generateContentWithPrompt,
    TResult? Function(_UpdateIdentifier value)? updateIdentifier,
  }) {
    return selectPrompt?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_UseCaseChanged value)? useCaseChanged,
    TResult Function(_GenerateContent value)? generateContent,
    TResult Function(_ChangeToEditMode value)? changeToEditMode,
    TResult Function(_ChangeToViewMode value)? changeToViewMode,
    TResult Function(_TextChanged value)? textChanged,
    TResult Function(_CompleteAnimatedText value)? completeAnimatedText,
    TResult Function(_SelectPrompt value)? selectPrompt,
    TResult Function(_GenerateContentWithPrompt value)?
        generateContentWithPrompt,
    TResult Function(_UpdateIdentifier value)? updateIdentifier,
    required TResult orElse(),
  }) {
    if (selectPrompt != null) {
      return selectPrompt(this);
    }
    return orElse();
  }
}

abstract class _SelectPrompt implements TextGenerateEvent {
  const factory _SelectPrompt({required final SelectPrompt selectPrompt}) =
      _$SelectPromptImpl;

  SelectPrompt get selectPrompt;
  @JsonKey(ignore: true)
  _$$SelectPromptImplCopyWith<_$SelectPromptImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$GenerateContentWithPromptImplCopyWith<$Res> {
  factory _$$GenerateContentWithPromptImplCopyWith(
          _$GenerateContentWithPromptImpl value,
          $Res Function(_$GenerateContentWithPromptImpl) then) =
      __$$GenerateContentWithPromptImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String prompt});
}

/// @nodoc
class __$$GenerateContentWithPromptImplCopyWithImpl<$Res>
    extends _$TextGenerateEventCopyWithImpl<$Res,
        _$GenerateContentWithPromptImpl>
    implements _$$GenerateContentWithPromptImplCopyWith<$Res> {
  __$$GenerateContentWithPromptImplCopyWithImpl(
      _$GenerateContentWithPromptImpl _value,
      $Res Function(_$GenerateContentWithPromptImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? prompt = null,
  }) {
    return _then(_$GenerateContentWithPromptImpl(
      prompt: null == prompt
          ? _value.prompt
          : prompt // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$GenerateContentWithPromptImpl implements _GenerateContentWithPrompt {
  const _$GenerateContentWithPromptImpl({required this.prompt});

  @override
  final String prompt;

  @override
  String toString() {
    return 'TextGenerateEvent.generateContentWithPrompt(prompt: $prompt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GenerateContentWithPromptImpl &&
            (identical(other.prompt, prompt) || other.prompt == prompt));
  }

  @override
  int get hashCode => Object.hash(runtimeType, prompt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GenerateContentWithPromptImplCopyWith<_$GenerateContentWithPromptImpl>
      get copyWith => __$$GenerateContentWithPromptImplCopyWithImpl<
          _$GenerateContentWithPromptImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(PromptUseCase useCase) useCaseChanged,
    required TResult Function(PromptUseCase promptUseCase) generateContent,
    required TResult Function() changeToEditMode,
    required TResult Function() changeToViewMode,
    required TResult Function(String text) textChanged,
    required TResult Function() completeAnimatedText,
    required TResult Function(SelectPrompt selectPrompt) selectPrompt,
    required TResult Function(String prompt) generateContentWithPrompt,
    required TResult Function(String identifier) updateIdentifier,
  }) {
    return generateContentWithPrompt(prompt);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(PromptUseCase useCase)? useCaseChanged,
    TResult? Function(PromptUseCase promptUseCase)? generateContent,
    TResult? Function()? changeToEditMode,
    TResult? Function()? changeToViewMode,
    TResult? Function(String text)? textChanged,
    TResult? Function()? completeAnimatedText,
    TResult? Function(SelectPrompt selectPrompt)? selectPrompt,
    TResult? Function(String prompt)? generateContentWithPrompt,
    TResult? Function(String identifier)? updateIdentifier,
  }) {
    return generateContentWithPrompt?.call(prompt);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(PromptUseCase useCase)? useCaseChanged,
    TResult Function(PromptUseCase promptUseCase)? generateContent,
    TResult Function()? changeToEditMode,
    TResult Function()? changeToViewMode,
    TResult Function(String text)? textChanged,
    TResult Function()? completeAnimatedText,
    TResult Function(SelectPrompt selectPrompt)? selectPrompt,
    TResult Function(String prompt)? generateContentWithPrompt,
    TResult Function(String identifier)? updateIdentifier,
    required TResult orElse(),
  }) {
    if (generateContentWithPrompt != null) {
      return generateContentWithPrompt(prompt);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_UseCaseChanged value) useCaseChanged,
    required TResult Function(_GenerateContent value) generateContent,
    required TResult Function(_ChangeToEditMode value) changeToEditMode,
    required TResult Function(_ChangeToViewMode value) changeToViewMode,
    required TResult Function(_TextChanged value) textChanged,
    required TResult Function(_CompleteAnimatedText value) completeAnimatedText,
    required TResult Function(_SelectPrompt value) selectPrompt,
    required TResult Function(_GenerateContentWithPrompt value)
        generateContentWithPrompt,
    required TResult Function(_UpdateIdentifier value) updateIdentifier,
  }) {
    return generateContentWithPrompt(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_UseCaseChanged value)? useCaseChanged,
    TResult? Function(_GenerateContent value)? generateContent,
    TResult? Function(_ChangeToEditMode value)? changeToEditMode,
    TResult? Function(_ChangeToViewMode value)? changeToViewMode,
    TResult? Function(_TextChanged value)? textChanged,
    TResult? Function(_CompleteAnimatedText value)? completeAnimatedText,
    TResult? Function(_SelectPrompt value)? selectPrompt,
    TResult? Function(_GenerateContentWithPrompt value)?
        generateContentWithPrompt,
    TResult? Function(_UpdateIdentifier value)? updateIdentifier,
  }) {
    return generateContentWithPrompt?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_UseCaseChanged value)? useCaseChanged,
    TResult Function(_GenerateContent value)? generateContent,
    TResult Function(_ChangeToEditMode value)? changeToEditMode,
    TResult Function(_ChangeToViewMode value)? changeToViewMode,
    TResult Function(_TextChanged value)? textChanged,
    TResult Function(_CompleteAnimatedText value)? completeAnimatedText,
    TResult Function(_SelectPrompt value)? selectPrompt,
    TResult Function(_GenerateContentWithPrompt value)?
        generateContentWithPrompt,
    TResult Function(_UpdateIdentifier value)? updateIdentifier,
    required TResult orElse(),
  }) {
    if (generateContentWithPrompt != null) {
      return generateContentWithPrompt(this);
    }
    return orElse();
  }
}

abstract class _GenerateContentWithPrompt implements TextGenerateEvent {
  const factory _GenerateContentWithPrompt({required final String prompt}) =
      _$GenerateContentWithPromptImpl;

  String get prompt;
  @JsonKey(ignore: true)
  _$$GenerateContentWithPromptImplCopyWith<_$GenerateContentWithPromptImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UpdateIdentifierImplCopyWith<$Res> {
  factory _$$UpdateIdentifierImplCopyWith(_$UpdateIdentifierImpl value,
          $Res Function(_$UpdateIdentifierImpl) then) =
      __$$UpdateIdentifierImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String identifier});
}

/// @nodoc
class __$$UpdateIdentifierImplCopyWithImpl<$Res>
    extends _$TextGenerateEventCopyWithImpl<$Res, _$UpdateIdentifierImpl>
    implements _$$UpdateIdentifierImplCopyWith<$Res> {
  __$$UpdateIdentifierImplCopyWithImpl(_$UpdateIdentifierImpl _value,
      $Res Function(_$UpdateIdentifierImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? identifier = null,
  }) {
    return _then(_$UpdateIdentifierImpl(
      null == identifier
          ? _value.identifier
          : identifier // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$UpdateIdentifierImpl implements _UpdateIdentifier {
  const _$UpdateIdentifierImpl(this.identifier);

  @override
  final String identifier;

  @override
  String toString() {
    return 'TextGenerateEvent.updateIdentifier(identifier: $identifier)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateIdentifierImpl &&
            (identical(other.identifier, identifier) ||
                other.identifier == identifier));
  }

  @override
  int get hashCode => Object.hash(runtimeType, identifier);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateIdentifierImplCopyWith<_$UpdateIdentifierImpl> get copyWith =>
      __$$UpdateIdentifierImplCopyWithImpl<_$UpdateIdentifierImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(PromptUseCase useCase) useCaseChanged,
    required TResult Function(PromptUseCase promptUseCase) generateContent,
    required TResult Function() changeToEditMode,
    required TResult Function() changeToViewMode,
    required TResult Function(String text) textChanged,
    required TResult Function() completeAnimatedText,
    required TResult Function(SelectPrompt selectPrompt) selectPrompt,
    required TResult Function(String prompt) generateContentWithPrompt,
    required TResult Function(String identifier) updateIdentifier,
  }) {
    return updateIdentifier(identifier);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(PromptUseCase useCase)? useCaseChanged,
    TResult? Function(PromptUseCase promptUseCase)? generateContent,
    TResult? Function()? changeToEditMode,
    TResult? Function()? changeToViewMode,
    TResult? Function(String text)? textChanged,
    TResult? Function()? completeAnimatedText,
    TResult? Function(SelectPrompt selectPrompt)? selectPrompt,
    TResult? Function(String prompt)? generateContentWithPrompt,
    TResult? Function(String identifier)? updateIdentifier,
  }) {
    return updateIdentifier?.call(identifier);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(PromptUseCase useCase)? useCaseChanged,
    TResult Function(PromptUseCase promptUseCase)? generateContent,
    TResult Function()? changeToEditMode,
    TResult Function()? changeToViewMode,
    TResult Function(String text)? textChanged,
    TResult Function()? completeAnimatedText,
    TResult Function(SelectPrompt selectPrompt)? selectPrompt,
    TResult Function(String prompt)? generateContentWithPrompt,
    TResult Function(String identifier)? updateIdentifier,
    required TResult orElse(),
  }) {
    if (updateIdentifier != null) {
      return updateIdentifier(identifier);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_UseCaseChanged value) useCaseChanged,
    required TResult Function(_GenerateContent value) generateContent,
    required TResult Function(_ChangeToEditMode value) changeToEditMode,
    required TResult Function(_ChangeToViewMode value) changeToViewMode,
    required TResult Function(_TextChanged value) textChanged,
    required TResult Function(_CompleteAnimatedText value) completeAnimatedText,
    required TResult Function(_SelectPrompt value) selectPrompt,
    required TResult Function(_GenerateContentWithPrompt value)
        generateContentWithPrompt,
    required TResult Function(_UpdateIdentifier value) updateIdentifier,
  }) {
    return updateIdentifier(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_UseCaseChanged value)? useCaseChanged,
    TResult? Function(_GenerateContent value)? generateContent,
    TResult? Function(_ChangeToEditMode value)? changeToEditMode,
    TResult? Function(_ChangeToViewMode value)? changeToViewMode,
    TResult? Function(_TextChanged value)? textChanged,
    TResult? Function(_CompleteAnimatedText value)? completeAnimatedText,
    TResult? Function(_SelectPrompt value)? selectPrompt,
    TResult? Function(_GenerateContentWithPrompt value)?
        generateContentWithPrompt,
    TResult? Function(_UpdateIdentifier value)? updateIdentifier,
  }) {
    return updateIdentifier?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_UseCaseChanged value)? useCaseChanged,
    TResult Function(_GenerateContent value)? generateContent,
    TResult Function(_ChangeToEditMode value)? changeToEditMode,
    TResult Function(_ChangeToViewMode value)? changeToViewMode,
    TResult Function(_TextChanged value)? textChanged,
    TResult Function(_CompleteAnimatedText value)? completeAnimatedText,
    TResult Function(_SelectPrompt value)? selectPrompt,
    TResult Function(_GenerateContentWithPrompt value)?
        generateContentWithPrompt,
    TResult Function(_UpdateIdentifier value)? updateIdentifier,
    required TResult orElse(),
  }) {
    if (updateIdentifier != null) {
      return updateIdentifier(this);
    }
    return orElse();
  }
}

abstract class _UpdateIdentifier implements TextGenerateEvent {
  const factory _UpdateIdentifier(final String identifier) =
      _$UpdateIdentifierImpl;

  String get identifier;
  @JsonKey(ignore: true)
  _$$UpdateIdentifierImplCopyWith<_$UpdateIdentifierImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$TextGenerateState {
  TextGenerateModel get data => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(TextGenerateModel data) initial,
    required TResult Function(TextGenerateModel data) loading,
    required TResult Function(TextGenerateModel data) success,
    required TResult Function(TextGenerateModel data, String message) failure,
    required TResult Function(TextGenerateModel data) editMode,
    required TResult Function(TextGenerateModel data) viewMode,
    required TResult Function(
            TextGenerateModel data, String message, String? identifier)
        expiredSubscription,
    required TResult Function(TextGenerateModel data, Prompt prompt)
        selectPromptSuccess,
    required TResult Function(
            TextGenerateModel data, bool isExpiredSubscription)
        updateIdentifierSuccess,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(TextGenerateModel data)? initial,
    TResult? Function(TextGenerateModel data)? loading,
    TResult? Function(TextGenerateModel data)? success,
    TResult? Function(TextGenerateModel data, String message)? failure,
    TResult? Function(TextGenerateModel data)? editMode,
    TResult? Function(TextGenerateModel data)? viewMode,
    TResult? Function(
            TextGenerateModel data, String message, String? identifier)?
        expiredSubscription,
    TResult? Function(TextGenerateModel data, Prompt prompt)?
        selectPromptSuccess,
    TResult? Function(TextGenerateModel data, bool isExpiredSubscription)?
        updateIdentifierSuccess,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(TextGenerateModel data)? initial,
    TResult Function(TextGenerateModel data)? loading,
    TResult Function(TextGenerateModel data)? success,
    TResult Function(TextGenerateModel data, String message)? failure,
    TResult Function(TextGenerateModel data)? editMode,
    TResult Function(TextGenerateModel data)? viewMode,
    TResult Function(
            TextGenerateModel data, String message, String? identifier)?
        expiredSubscription,
    TResult Function(TextGenerateModel data, Prompt prompt)?
        selectPromptSuccess,
    TResult Function(TextGenerateModel data, bool isExpiredSubscription)?
        updateIdentifierSuccess,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Success value) success,
    required TResult Function(_Failure value) failure,
    required TResult Function(_EditMode value) editMode,
    required TResult Function(_ViewMode value) viewMode,
    required TResult Function(_ExpiredSubscription value) expiredSubscription,
    required TResult Function(_SelectPromptSuccess value) selectPromptSuccess,
    required TResult Function(_UpdateIdentifierSuccess value)
        updateIdentifierSuccess,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Success value)? success,
    TResult? Function(_Failure value)? failure,
    TResult? Function(_EditMode value)? editMode,
    TResult? Function(_ViewMode value)? viewMode,
    TResult? Function(_ExpiredSubscription value)? expiredSubscription,
    TResult? Function(_SelectPromptSuccess value)? selectPromptSuccess,
    TResult? Function(_UpdateIdentifierSuccess value)? updateIdentifierSuccess,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Success value)? success,
    TResult Function(_Failure value)? failure,
    TResult Function(_EditMode value)? editMode,
    TResult Function(_ViewMode value)? viewMode,
    TResult Function(_ExpiredSubscription value)? expiredSubscription,
    TResult Function(_SelectPromptSuccess value)? selectPromptSuccess,
    TResult Function(_UpdateIdentifierSuccess value)? updateIdentifierSuccess,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TextGenerateStateCopyWith<TextGenerateState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TextGenerateStateCopyWith<$Res> {
  factory $TextGenerateStateCopyWith(
          TextGenerateState value, $Res Function(TextGenerateState) then) =
      _$TextGenerateStateCopyWithImpl<$Res, TextGenerateState>;
  @useResult
  $Res call({TextGenerateModel data});

  $TextGenerateModelCopyWith<$Res> get data;
}

/// @nodoc
class _$TextGenerateStateCopyWithImpl<$Res, $Val extends TextGenerateState>
    implements $TextGenerateStateCopyWith<$Res> {
  _$TextGenerateStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
  }) {
    return _then(_value.copyWith(
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as TextGenerateModel,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $TextGenerateModelCopyWith<$Res> get data {
    return $TextGenerateModelCopyWith<$Res>(_value.data, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res>
    implements $TextGenerateStateCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({TextGenerateModel data});

  @override
  $TextGenerateModelCopyWith<$Res> get data;
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$TextGenerateStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
  }) {
    return _then(_$InitialImpl(
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as TextGenerateModel,
    ));
  }
}

/// @nodoc

class _$InitialImpl extends _Initial {
  const _$InitialImpl({required this.data}) : super._();

  @override
  final TextGenerateModel data;

  @override
  String toString() {
    return 'TextGenerateState.initial(data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InitialImpl &&
            (identical(other.data, data) || other.data == data));
  }

  @override
  int get hashCode => Object.hash(runtimeType, data);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      __$$InitialImplCopyWithImpl<_$InitialImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(TextGenerateModel data) initial,
    required TResult Function(TextGenerateModel data) loading,
    required TResult Function(TextGenerateModel data) success,
    required TResult Function(TextGenerateModel data, String message) failure,
    required TResult Function(TextGenerateModel data) editMode,
    required TResult Function(TextGenerateModel data) viewMode,
    required TResult Function(
            TextGenerateModel data, String message, String? identifier)
        expiredSubscription,
    required TResult Function(TextGenerateModel data, Prompt prompt)
        selectPromptSuccess,
    required TResult Function(
            TextGenerateModel data, bool isExpiredSubscription)
        updateIdentifierSuccess,
  }) {
    return initial(data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(TextGenerateModel data)? initial,
    TResult? Function(TextGenerateModel data)? loading,
    TResult? Function(TextGenerateModel data)? success,
    TResult? Function(TextGenerateModel data, String message)? failure,
    TResult? Function(TextGenerateModel data)? editMode,
    TResult? Function(TextGenerateModel data)? viewMode,
    TResult? Function(
            TextGenerateModel data, String message, String? identifier)?
        expiredSubscription,
    TResult? Function(TextGenerateModel data, Prompt prompt)?
        selectPromptSuccess,
    TResult? Function(TextGenerateModel data, bool isExpiredSubscription)?
        updateIdentifierSuccess,
  }) {
    return initial?.call(data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(TextGenerateModel data)? initial,
    TResult Function(TextGenerateModel data)? loading,
    TResult Function(TextGenerateModel data)? success,
    TResult Function(TextGenerateModel data, String message)? failure,
    TResult Function(TextGenerateModel data)? editMode,
    TResult Function(TextGenerateModel data)? viewMode,
    TResult Function(
            TextGenerateModel data, String message, String? identifier)?
        expiredSubscription,
    TResult Function(TextGenerateModel data, Prompt prompt)?
        selectPromptSuccess,
    TResult Function(TextGenerateModel data, bool isExpiredSubscription)?
        updateIdentifierSuccess,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(data);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Success value) success,
    required TResult Function(_Failure value) failure,
    required TResult Function(_EditMode value) editMode,
    required TResult Function(_ViewMode value) viewMode,
    required TResult Function(_ExpiredSubscription value) expiredSubscription,
    required TResult Function(_SelectPromptSuccess value) selectPromptSuccess,
    required TResult Function(_UpdateIdentifierSuccess value)
        updateIdentifierSuccess,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Success value)? success,
    TResult? Function(_Failure value)? failure,
    TResult? Function(_EditMode value)? editMode,
    TResult? Function(_ViewMode value)? viewMode,
    TResult? Function(_ExpiredSubscription value)? expiredSubscription,
    TResult? Function(_SelectPromptSuccess value)? selectPromptSuccess,
    TResult? Function(_UpdateIdentifierSuccess value)? updateIdentifierSuccess,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Success value)? success,
    TResult Function(_Failure value)? failure,
    TResult Function(_EditMode value)? editMode,
    TResult Function(_ViewMode value)? viewMode,
    TResult Function(_ExpiredSubscription value)? expiredSubscription,
    TResult Function(_SelectPromptSuccess value)? selectPromptSuccess,
    TResult Function(_UpdateIdentifierSuccess value)? updateIdentifierSuccess,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial extends TextGenerateState {
  const factory _Initial({required final TextGenerateModel data}) =
      _$InitialImpl;
  const _Initial._() : super._();

  @override
  TextGenerateModel get data;
  @override
  @JsonKey(ignore: true)
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LoadingImplCopyWith<$Res>
    implements $TextGenerateStateCopyWith<$Res> {
  factory _$$LoadingImplCopyWith(
          _$LoadingImpl value, $Res Function(_$LoadingImpl) then) =
      __$$LoadingImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({TextGenerateModel data});

  @override
  $TextGenerateModelCopyWith<$Res> get data;
}

/// @nodoc
class __$$LoadingImplCopyWithImpl<$Res>
    extends _$TextGenerateStateCopyWithImpl<$Res, _$LoadingImpl>
    implements _$$LoadingImplCopyWith<$Res> {
  __$$LoadingImplCopyWithImpl(
      _$LoadingImpl _value, $Res Function(_$LoadingImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
  }) {
    return _then(_$LoadingImpl(
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as TextGenerateModel,
    ));
  }
}

/// @nodoc

class _$LoadingImpl extends _Loading {
  const _$LoadingImpl({required this.data}) : super._();

  @override
  final TextGenerateModel data;

  @override
  String toString() {
    return 'TextGenerateState.loading(data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadingImpl &&
            (identical(other.data, data) || other.data == data));
  }

  @override
  int get hashCode => Object.hash(runtimeType, data);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadingImplCopyWith<_$LoadingImpl> get copyWith =>
      __$$LoadingImplCopyWithImpl<_$LoadingImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(TextGenerateModel data) initial,
    required TResult Function(TextGenerateModel data) loading,
    required TResult Function(TextGenerateModel data) success,
    required TResult Function(TextGenerateModel data, String message) failure,
    required TResult Function(TextGenerateModel data) editMode,
    required TResult Function(TextGenerateModel data) viewMode,
    required TResult Function(
            TextGenerateModel data, String message, String? identifier)
        expiredSubscription,
    required TResult Function(TextGenerateModel data, Prompt prompt)
        selectPromptSuccess,
    required TResult Function(
            TextGenerateModel data, bool isExpiredSubscription)
        updateIdentifierSuccess,
  }) {
    return loading(data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(TextGenerateModel data)? initial,
    TResult? Function(TextGenerateModel data)? loading,
    TResult? Function(TextGenerateModel data)? success,
    TResult? Function(TextGenerateModel data, String message)? failure,
    TResult? Function(TextGenerateModel data)? editMode,
    TResult? Function(TextGenerateModel data)? viewMode,
    TResult? Function(
            TextGenerateModel data, String message, String? identifier)?
        expiredSubscription,
    TResult? Function(TextGenerateModel data, Prompt prompt)?
        selectPromptSuccess,
    TResult? Function(TextGenerateModel data, bool isExpiredSubscription)?
        updateIdentifierSuccess,
  }) {
    return loading?.call(data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(TextGenerateModel data)? initial,
    TResult Function(TextGenerateModel data)? loading,
    TResult Function(TextGenerateModel data)? success,
    TResult Function(TextGenerateModel data, String message)? failure,
    TResult Function(TextGenerateModel data)? editMode,
    TResult Function(TextGenerateModel data)? viewMode,
    TResult Function(
            TextGenerateModel data, String message, String? identifier)?
        expiredSubscription,
    TResult Function(TextGenerateModel data, Prompt prompt)?
        selectPromptSuccess,
    TResult Function(TextGenerateModel data, bool isExpiredSubscription)?
        updateIdentifierSuccess,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(data);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Success value) success,
    required TResult Function(_Failure value) failure,
    required TResult Function(_EditMode value) editMode,
    required TResult Function(_ViewMode value) viewMode,
    required TResult Function(_ExpiredSubscription value) expiredSubscription,
    required TResult Function(_SelectPromptSuccess value) selectPromptSuccess,
    required TResult Function(_UpdateIdentifierSuccess value)
        updateIdentifierSuccess,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Success value)? success,
    TResult? Function(_Failure value)? failure,
    TResult? Function(_EditMode value)? editMode,
    TResult? Function(_ViewMode value)? viewMode,
    TResult? Function(_ExpiredSubscription value)? expiredSubscription,
    TResult? Function(_SelectPromptSuccess value)? selectPromptSuccess,
    TResult? Function(_UpdateIdentifierSuccess value)? updateIdentifierSuccess,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Success value)? success,
    TResult Function(_Failure value)? failure,
    TResult Function(_EditMode value)? editMode,
    TResult Function(_ViewMode value)? viewMode,
    TResult Function(_ExpiredSubscription value)? expiredSubscription,
    TResult Function(_SelectPromptSuccess value)? selectPromptSuccess,
    TResult Function(_UpdateIdentifierSuccess value)? updateIdentifierSuccess,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _Loading extends TextGenerateState {
  const factory _Loading({required final TextGenerateModel data}) =
      _$LoadingImpl;
  const _Loading._() : super._();

  @override
  TextGenerateModel get data;
  @override
  @JsonKey(ignore: true)
  _$$LoadingImplCopyWith<_$LoadingImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SuccessImplCopyWith<$Res>
    implements $TextGenerateStateCopyWith<$Res> {
  factory _$$SuccessImplCopyWith(
          _$SuccessImpl value, $Res Function(_$SuccessImpl) then) =
      __$$SuccessImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({TextGenerateModel data});

  @override
  $TextGenerateModelCopyWith<$Res> get data;
}

/// @nodoc
class __$$SuccessImplCopyWithImpl<$Res>
    extends _$TextGenerateStateCopyWithImpl<$Res, _$SuccessImpl>
    implements _$$SuccessImplCopyWith<$Res> {
  __$$SuccessImplCopyWithImpl(
      _$SuccessImpl _value, $Res Function(_$SuccessImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
  }) {
    return _then(_$SuccessImpl(
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as TextGenerateModel,
    ));
  }
}

/// @nodoc

class _$SuccessImpl extends _Success {
  const _$SuccessImpl({required this.data}) : super._();

  @override
  final TextGenerateModel data;

  @override
  String toString() {
    return 'TextGenerateState.success(data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SuccessImpl &&
            (identical(other.data, data) || other.data == data));
  }

  @override
  int get hashCode => Object.hash(runtimeType, data);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SuccessImplCopyWith<_$SuccessImpl> get copyWith =>
      __$$SuccessImplCopyWithImpl<_$SuccessImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(TextGenerateModel data) initial,
    required TResult Function(TextGenerateModel data) loading,
    required TResult Function(TextGenerateModel data) success,
    required TResult Function(TextGenerateModel data, String message) failure,
    required TResult Function(TextGenerateModel data) editMode,
    required TResult Function(TextGenerateModel data) viewMode,
    required TResult Function(
            TextGenerateModel data, String message, String? identifier)
        expiredSubscription,
    required TResult Function(TextGenerateModel data, Prompt prompt)
        selectPromptSuccess,
    required TResult Function(
            TextGenerateModel data, bool isExpiredSubscription)
        updateIdentifierSuccess,
  }) {
    return success(data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(TextGenerateModel data)? initial,
    TResult? Function(TextGenerateModel data)? loading,
    TResult? Function(TextGenerateModel data)? success,
    TResult? Function(TextGenerateModel data, String message)? failure,
    TResult? Function(TextGenerateModel data)? editMode,
    TResult? Function(TextGenerateModel data)? viewMode,
    TResult? Function(
            TextGenerateModel data, String message, String? identifier)?
        expiredSubscription,
    TResult? Function(TextGenerateModel data, Prompt prompt)?
        selectPromptSuccess,
    TResult? Function(TextGenerateModel data, bool isExpiredSubscription)?
        updateIdentifierSuccess,
  }) {
    return success?.call(data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(TextGenerateModel data)? initial,
    TResult Function(TextGenerateModel data)? loading,
    TResult Function(TextGenerateModel data)? success,
    TResult Function(TextGenerateModel data, String message)? failure,
    TResult Function(TextGenerateModel data)? editMode,
    TResult Function(TextGenerateModel data)? viewMode,
    TResult Function(
            TextGenerateModel data, String message, String? identifier)?
        expiredSubscription,
    TResult Function(TextGenerateModel data, Prompt prompt)?
        selectPromptSuccess,
    TResult Function(TextGenerateModel data, bool isExpiredSubscription)?
        updateIdentifierSuccess,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(data);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Success value) success,
    required TResult Function(_Failure value) failure,
    required TResult Function(_EditMode value) editMode,
    required TResult Function(_ViewMode value) viewMode,
    required TResult Function(_ExpiredSubscription value) expiredSubscription,
    required TResult Function(_SelectPromptSuccess value) selectPromptSuccess,
    required TResult Function(_UpdateIdentifierSuccess value)
        updateIdentifierSuccess,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Success value)? success,
    TResult? Function(_Failure value)? failure,
    TResult? Function(_EditMode value)? editMode,
    TResult? Function(_ViewMode value)? viewMode,
    TResult? Function(_ExpiredSubscription value)? expiredSubscription,
    TResult? Function(_SelectPromptSuccess value)? selectPromptSuccess,
    TResult? Function(_UpdateIdentifierSuccess value)? updateIdentifierSuccess,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Success value)? success,
    TResult Function(_Failure value)? failure,
    TResult Function(_EditMode value)? editMode,
    TResult Function(_ViewMode value)? viewMode,
    TResult Function(_ExpiredSubscription value)? expiredSubscription,
    TResult Function(_SelectPromptSuccess value)? selectPromptSuccess,
    TResult Function(_UpdateIdentifierSuccess value)? updateIdentifierSuccess,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class _Success extends TextGenerateState {
  const factory _Success({required final TextGenerateModel data}) =
      _$SuccessImpl;
  const _Success._() : super._();

  @override
  TextGenerateModel get data;
  @override
  @JsonKey(ignore: true)
  _$$SuccessImplCopyWith<_$SuccessImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$FailureImplCopyWith<$Res>
    implements $TextGenerateStateCopyWith<$Res> {
  factory _$$FailureImplCopyWith(
          _$FailureImpl value, $Res Function(_$FailureImpl) then) =
      __$$FailureImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({TextGenerateModel data, String message});

  @override
  $TextGenerateModelCopyWith<$Res> get data;
}

/// @nodoc
class __$$FailureImplCopyWithImpl<$Res>
    extends _$TextGenerateStateCopyWithImpl<$Res, _$FailureImpl>
    implements _$$FailureImplCopyWith<$Res> {
  __$$FailureImplCopyWithImpl(
      _$FailureImpl _value, $Res Function(_$FailureImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
    Object? message = null,
  }) {
    return _then(_$FailureImpl(
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as TextGenerateModel,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$FailureImpl extends _Failure {
  const _$FailureImpl({required this.data, required this.message}) : super._();

  @override
  final TextGenerateModel data;
  @override
  final String message;

  @override
  String toString() {
    return 'TextGenerateState.failure(data: $data, message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FailureImpl &&
            (identical(other.data, data) || other.data == data) &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, data, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FailureImplCopyWith<_$FailureImpl> get copyWith =>
      __$$FailureImplCopyWithImpl<_$FailureImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(TextGenerateModel data) initial,
    required TResult Function(TextGenerateModel data) loading,
    required TResult Function(TextGenerateModel data) success,
    required TResult Function(TextGenerateModel data, String message) failure,
    required TResult Function(TextGenerateModel data) editMode,
    required TResult Function(TextGenerateModel data) viewMode,
    required TResult Function(
            TextGenerateModel data, String message, String? identifier)
        expiredSubscription,
    required TResult Function(TextGenerateModel data, Prompt prompt)
        selectPromptSuccess,
    required TResult Function(
            TextGenerateModel data, bool isExpiredSubscription)
        updateIdentifierSuccess,
  }) {
    return failure(data, message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(TextGenerateModel data)? initial,
    TResult? Function(TextGenerateModel data)? loading,
    TResult? Function(TextGenerateModel data)? success,
    TResult? Function(TextGenerateModel data, String message)? failure,
    TResult? Function(TextGenerateModel data)? editMode,
    TResult? Function(TextGenerateModel data)? viewMode,
    TResult? Function(
            TextGenerateModel data, String message, String? identifier)?
        expiredSubscription,
    TResult? Function(TextGenerateModel data, Prompt prompt)?
        selectPromptSuccess,
    TResult? Function(TextGenerateModel data, bool isExpiredSubscription)?
        updateIdentifierSuccess,
  }) {
    return failure?.call(data, message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(TextGenerateModel data)? initial,
    TResult Function(TextGenerateModel data)? loading,
    TResult Function(TextGenerateModel data)? success,
    TResult Function(TextGenerateModel data, String message)? failure,
    TResult Function(TextGenerateModel data)? editMode,
    TResult Function(TextGenerateModel data)? viewMode,
    TResult Function(
            TextGenerateModel data, String message, String? identifier)?
        expiredSubscription,
    TResult Function(TextGenerateModel data, Prompt prompt)?
        selectPromptSuccess,
    TResult Function(TextGenerateModel data, bool isExpiredSubscription)?
        updateIdentifierSuccess,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure(data, message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Success value) success,
    required TResult Function(_Failure value) failure,
    required TResult Function(_EditMode value) editMode,
    required TResult Function(_ViewMode value) viewMode,
    required TResult Function(_ExpiredSubscription value) expiredSubscription,
    required TResult Function(_SelectPromptSuccess value) selectPromptSuccess,
    required TResult Function(_UpdateIdentifierSuccess value)
        updateIdentifierSuccess,
  }) {
    return failure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Success value)? success,
    TResult? Function(_Failure value)? failure,
    TResult? Function(_EditMode value)? editMode,
    TResult? Function(_ViewMode value)? viewMode,
    TResult? Function(_ExpiredSubscription value)? expiredSubscription,
    TResult? Function(_SelectPromptSuccess value)? selectPromptSuccess,
    TResult? Function(_UpdateIdentifierSuccess value)? updateIdentifierSuccess,
  }) {
    return failure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Success value)? success,
    TResult Function(_Failure value)? failure,
    TResult Function(_EditMode value)? editMode,
    TResult Function(_ViewMode value)? viewMode,
    TResult Function(_ExpiredSubscription value)? expiredSubscription,
    TResult Function(_SelectPromptSuccess value)? selectPromptSuccess,
    TResult Function(_UpdateIdentifierSuccess value)? updateIdentifierSuccess,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure(this);
    }
    return orElse();
  }
}

abstract class _Failure extends TextGenerateState {
  const factory _Failure(
      {required final TextGenerateModel data,
      required final String message}) = _$FailureImpl;
  const _Failure._() : super._();

  @override
  TextGenerateModel get data;
  String get message;
  @override
  @JsonKey(ignore: true)
  _$$FailureImplCopyWith<_$FailureImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$EditModeImplCopyWith<$Res>
    implements $TextGenerateStateCopyWith<$Res> {
  factory _$$EditModeImplCopyWith(
          _$EditModeImpl value, $Res Function(_$EditModeImpl) then) =
      __$$EditModeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({TextGenerateModel data});

  @override
  $TextGenerateModelCopyWith<$Res> get data;
}

/// @nodoc
class __$$EditModeImplCopyWithImpl<$Res>
    extends _$TextGenerateStateCopyWithImpl<$Res, _$EditModeImpl>
    implements _$$EditModeImplCopyWith<$Res> {
  __$$EditModeImplCopyWithImpl(
      _$EditModeImpl _value, $Res Function(_$EditModeImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
  }) {
    return _then(_$EditModeImpl(
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as TextGenerateModel,
    ));
  }
}

/// @nodoc

class _$EditModeImpl extends _EditMode {
  const _$EditModeImpl({required this.data}) : super._();

  @override
  final TextGenerateModel data;

  @override
  String toString() {
    return 'TextGenerateState.editMode(data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EditModeImpl &&
            (identical(other.data, data) || other.data == data));
  }

  @override
  int get hashCode => Object.hash(runtimeType, data);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$EditModeImplCopyWith<_$EditModeImpl> get copyWith =>
      __$$EditModeImplCopyWithImpl<_$EditModeImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(TextGenerateModel data) initial,
    required TResult Function(TextGenerateModel data) loading,
    required TResult Function(TextGenerateModel data) success,
    required TResult Function(TextGenerateModel data, String message) failure,
    required TResult Function(TextGenerateModel data) editMode,
    required TResult Function(TextGenerateModel data) viewMode,
    required TResult Function(
            TextGenerateModel data, String message, String? identifier)
        expiredSubscription,
    required TResult Function(TextGenerateModel data, Prompt prompt)
        selectPromptSuccess,
    required TResult Function(
            TextGenerateModel data, bool isExpiredSubscription)
        updateIdentifierSuccess,
  }) {
    return editMode(data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(TextGenerateModel data)? initial,
    TResult? Function(TextGenerateModel data)? loading,
    TResult? Function(TextGenerateModel data)? success,
    TResult? Function(TextGenerateModel data, String message)? failure,
    TResult? Function(TextGenerateModel data)? editMode,
    TResult? Function(TextGenerateModel data)? viewMode,
    TResult? Function(
            TextGenerateModel data, String message, String? identifier)?
        expiredSubscription,
    TResult? Function(TextGenerateModel data, Prompt prompt)?
        selectPromptSuccess,
    TResult? Function(TextGenerateModel data, bool isExpiredSubscription)?
        updateIdentifierSuccess,
  }) {
    return editMode?.call(data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(TextGenerateModel data)? initial,
    TResult Function(TextGenerateModel data)? loading,
    TResult Function(TextGenerateModel data)? success,
    TResult Function(TextGenerateModel data, String message)? failure,
    TResult Function(TextGenerateModel data)? editMode,
    TResult Function(TextGenerateModel data)? viewMode,
    TResult Function(
            TextGenerateModel data, String message, String? identifier)?
        expiredSubscription,
    TResult Function(TextGenerateModel data, Prompt prompt)?
        selectPromptSuccess,
    TResult Function(TextGenerateModel data, bool isExpiredSubscription)?
        updateIdentifierSuccess,
    required TResult orElse(),
  }) {
    if (editMode != null) {
      return editMode(data);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Success value) success,
    required TResult Function(_Failure value) failure,
    required TResult Function(_EditMode value) editMode,
    required TResult Function(_ViewMode value) viewMode,
    required TResult Function(_ExpiredSubscription value) expiredSubscription,
    required TResult Function(_SelectPromptSuccess value) selectPromptSuccess,
    required TResult Function(_UpdateIdentifierSuccess value)
        updateIdentifierSuccess,
  }) {
    return editMode(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Success value)? success,
    TResult? Function(_Failure value)? failure,
    TResult? Function(_EditMode value)? editMode,
    TResult? Function(_ViewMode value)? viewMode,
    TResult? Function(_ExpiredSubscription value)? expiredSubscription,
    TResult? Function(_SelectPromptSuccess value)? selectPromptSuccess,
    TResult? Function(_UpdateIdentifierSuccess value)? updateIdentifierSuccess,
  }) {
    return editMode?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Success value)? success,
    TResult Function(_Failure value)? failure,
    TResult Function(_EditMode value)? editMode,
    TResult Function(_ViewMode value)? viewMode,
    TResult Function(_ExpiredSubscription value)? expiredSubscription,
    TResult Function(_SelectPromptSuccess value)? selectPromptSuccess,
    TResult Function(_UpdateIdentifierSuccess value)? updateIdentifierSuccess,
    required TResult orElse(),
  }) {
    if (editMode != null) {
      return editMode(this);
    }
    return orElse();
  }
}

abstract class _EditMode extends TextGenerateState {
  const factory _EditMode({required final TextGenerateModel data}) =
      _$EditModeImpl;
  const _EditMode._() : super._();

  @override
  TextGenerateModel get data;
  @override
  @JsonKey(ignore: true)
  _$$EditModeImplCopyWith<_$EditModeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ViewModeImplCopyWith<$Res>
    implements $TextGenerateStateCopyWith<$Res> {
  factory _$$ViewModeImplCopyWith(
          _$ViewModeImpl value, $Res Function(_$ViewModeImpl) then) =
      __$$ViewModeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({TextGenerateModel data});

  @override
  $TextGenerateModelCopyWith<$Res> get data;
}

/// @nodoc
class __$$ViewModeImplCopyWithImpl<$Res>
    extends _$TextGenerateStateCopyWithImpl<$Res, _$ViewModeImpl>
    implements _$$ViewModeImplCopyWith<$Res> {
  __$$ViewModeImplCopyWithImpl(
      _$ViewModeImpl _value, $Res Function(_$ViewModeImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
  }) {
    return _then(_$ViewModeImpl(
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as TextGenerateModel,
    ));
  }
}

/// @nodoc

class _$ViewModeImpl extends _ViewMode {
  const _$ViewModeImpl({required this.data}) : super._();

  @override
  final TextGenerateModel data;

  @override
  String toString() {
    return 'TextGenerateState.viewMode(data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ViewModeImpl &&
            (identical(other.data, data) || other.data == data));
  }

  @override
  int get hashCode => Object.hash(runtimeType, data);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ViewModeImplCopyWith<_$ViewModeImpl> get copyWith =>
      __$$ViewModeImplCopyWithImpl<_$ViewModeImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(TextGenerateModel data) initial,
    required TResult Function(TextGenerateModel data) loading,
    required TResult Function(TextGenerateModel data) success,
    required TResult Function(TextGenerateModel data, String message) failure,
    required TResult Function(TextGenerateModel data) editMode,
    required TResult Function(TextGenerateModel data) viewMode,
    required TResult Function(
            TextGenerateModel data, String message, String? identifier)
        expiredSubscription,
    required TResult Function(TextGenerateModel data, Prompt prompt)
        selectPromptSuccess,
    required TResult Function(
            TextGenerateModel data, bool isExpiredSubscription)
        updateIdentifierSuccess,
  }) {
    return viewMode(data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(TextGenerateModel data)? initial,
    TResult? Function(TextGenerateModel data)? loading,
    TResult? Function(TextGenerateModel data)? success,
    TResult? Function(TextGenerateModel data, String message)? failure,
    TResult? Function(TextGenerateModel data)? editMode,
    TResult? Function(TextGenerateModel data)? viewMode,
    TResult? Function(
            TextGenerateModel data, String message, String? identifier)?
        expiredSubscription,
    TResult? Function(TextGenerateModel data, Prompt prompt)?
        selectPromptSuccess,
    TResult? Function(TextGenerateModel data, bool isExpiredSubscription)?
        updateIdentifierSuccess,
  }) {
    return viewMode?.call(data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(TextGenerateModel data)? initial,
    TResult Function(TextGenerateModel data)? loading,
    TResult Function(TextGenerateModel data)? success,
    TResult Function(TextGenerateModel data, String message)? failure,
    TResult Function(TextGenerateModel data)? editMode,
    TResult Function(TextGenerateModel data)? viewMode,
    TResult Function(
            TextGenerateModel data, String message, String? identifier)?
        expiredSubscription,
    TResult Function(TextGenerateModel data, Prompt prompt)?
        selectPromptSuccess,
    TResult Function(TextGenerateModel data, bool isExpiredSubscription)?
        updateIdentifierSuccess,
    required TResult orElse(),
  }) {
    if (viewMode != null) {
      return viewMode(data);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Success value) success,
    required TResult Function(_Failure value) failure,
    required TResult Function(_EditMode value) editMode,
    required TResult Function(_ViewMode value) viewMode,
    required TResult Function(_ExpiredSubscription value) expiredSubscription,
    required TResult Function(_SelectPromptSuccess value) selectPromptSuccess,
    required TResult Function(_UpdateIdentifierSuccess value)
        updateIdentifierSuccess,
  }) {
    return viewMode(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Success value)? success,
    TResult? Function(_Failure value)? failure,
    TResult? Function(_EditMode value)? editMode,
    TResult? Function(_ViewMode value)? viewMode,
    TResult? Function(_ExpiredSubscription value)? expiredSubscription,
    TResult? Function(_SelectPromptSuccess value)? selectPromptSuccess,
    TResult? Function(_UpdateIdentifierSuccess value)? updateIdentifierSuccess,
  }) {
    return viewMode?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Success value)? success,
    TResult Function(_Failure value)? failure,
    TResult Function(_EditMode value)? editMode,
    TResult Function(_ViewMode value)? viewMode,
    TResult Function(_ExpiredSubscription value)? expiredSubscription,
    TResult Function(_SelectPromptSuccess value)? selectPromptSuccess,
    TResult Function(_UpdateIdentifierSuccess value)? updateIdentifierSuccess,
    required TResult orElse(),
  }) {
    if (viewMode != null) {
      return viewMode(this);
    }
    return orElse();
  }
}

abstract class _ViewMode extends TextGenerateState {
  const factory _ViewMode({required final TextGenerateModel data}) =
      _$ViewModeImpl;
  const _ViewMode._() : super._();

  @override
  TextGenerateModel get data;
  @override
  @JsonKey(ignore: true)
  _$$ViewModeImplCopyWith<_$ViewModeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ExpiredSubscriptionImplCopyWith<$Res>
    implements $TextGenerateStateCopyWith<$Res> {
  factory _$$ExpiredSubscriptionImplCopyWith(_$ExpiredSubscriptionImpl value,
          $Res Function(_$ExpiredSubscriptionImpl) then) =
      __$$ExpiredSubscriptionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({TextGenerateModel data, String message, String? identifier});

  @override
  $TextGenerateModelCopyWith<$Res> get data;
}

/// @nodoc
class __$$ExpiredSubscriptionImplCopyWithImpl<$Res>
    extends _$TextGenerateStateCopyWithImpl<$Res, _$ExpiredSubscriptionImpl>
    implements _$$ExpiredSubscriptionImplCopyWith<$Res> {
  __$$ExpiredSubscriptionImplCopyWithImpl(_$ExpiredSubscriptionImpl _value,
      $Res Function(_$ExpiredSubscriptionImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
    Object? message = null,
    Object? identifier = freezed,
  }) {
    return _then(_$ExpiredSubscriptionImpl(
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as TextGenerateModel,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      identifier: freezed == identifier
          ? _value.identifier
          : identifier // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$ExpiredSubscriptionImpl extends _ExpiredSubscription {
  const _$ExpiredSubscriptionImpl(
      {required this.data, required this.message, required this.identifier})
      : super._();

  @override
  final TextGenerateModel data;
  @override
  final String message;
  @override
  final String? identifier;

  @override
  String toString() {
    return 'TextGenerateState.expiredSubscription(data: $data, message: $message, identifier: $identifier)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ExpiredSubscriptionImpl &&
            (identical(other.data, data) || other.data == data) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.identifier, identifier) ||
                other.identifier == identifier));
  }

  @override
  int get hashCode => Object.hash(runtimeType, data, message, identifier);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ExpiredSubscriptionImplCopyWith<_$ExpiredSubscriptionImpl> get copyWith =>
      __$$ExpiredSubscriptionImplCopyWithImpl<_$ExpiredSubscriptionImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(TextGenerateModel data) initial,
    required TResult Function(TextGenerateModel data) loading,
    required TResult Function(TextGenerateModel data) success,
    required TResult Function(TextGenerateModel data, String message) failure,
    required TResult Function(TextGenerateModel data) editMode,
    required TResult Function(TextGenerateModel data) viewMode,
    required TResult Function(
            TextGenerateModel data, String message, String? identifier)
        expiredSubscription,
    required TResult Function(TextGenerateModel data, Prompt prompt)
        selectPromptSuccess,
    required TResult Function(
            TextGenerateModel data, bool isExpiredSubscription)
        updateIdentifierSuccess,
  }) {
    return expiredSubscription(data, message, identifier);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(TextGenerateModel data)? initial,
    TResult? Function(TextGenerateModel data)? loading,
    TResult? Function(TextGenerateModel data)? success,
    TResult? Function(TextGenerateModel data, String message)? failure,
    TResult? Function(TextGenerateModel data)? editMode,
    TResult? Function(TextGenerateModel data)? viewMode,
    TResult? Function(
            TextGenerateModel data, String message, String? identifier)?
        expiredSubscription,
    TResult? Function(TextGenerateModel data, Prompt prompt)?
        selectPromptSuccess,
    TResult? Function(TextGenerateModel data, bool isExpiredSubscription)?
        updateIdentifierSuccess,
  }) {
    return expiredSubscription?.call(data, message, identifier);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(TextGenerateModel data)? initial,
    TResult Function(TextGenerateModel data)? loading,
    TResult Function(TextGenerateModel data)? success,
    TResult Function(TextGenerateModel data, String message)? failure,
    TResult Function(TextGenerateModel data)? editMode,
    TResult Function(TextGenerateModel data)? viewMode,
    TResult Function(
            TextGenerateModel data, String message, String? identifier)?
        expiredSubscription,
    TResult Function(TextGenerateModel data, Prompt prompt)?
        selectPromptSuccess,
    TResult Function(TextGenerateModel data, bool isExpiredSubscription)?
        updateIdentifierSuccess,
    required TResult orElse(),
  }) {
    if (expiredSubscription != null) {
      return expiredSubscription(data, message, identifier);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Success value) success,
    required TResult Function(_Failure value) failure,
    required TResult Function(_EditMode value) editMode,
    required TResult Function(_ViewMode value) viewMode,
    required TResult Function(_ExpiredSubscription value) expiredSubscription,
    required TResult Function(_SelectPromptSuccess value) selectPromptSuccess,
    required TResult Function(_UpdateIdentifierSuccess value)
        updateIdentifierSuccess,
  }) {
    return expiredSubscription(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Success value)? success,
    TResult? Function(_Failure value)? failure,
    TResult? Function(_EditMode value)? editMode,
    TResult? Function(_ViewMode value)? viewMode,
    TResult? Function(_ExpiredSubscription value)? expiredSubscription,
    TResult? Function(_SelectPromptSuccess value)? selectPromptSuccess,
    TResult? Function(_UpdateIdentifierSuccess value)? updateIdentifierSuccess,
  }) {
    return expiredSubscription?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Success value)? success,
    TResult Function(_Failure value)? failure,
    TResult Function(_EditMode value)? editMode,
    TResult Function(_ViewMode value)? viewMode,
    TResult Function(_ExpiredSubscription value)? expiredSubscription,
    TResult Function(_SelectPromptSuccess value)? selectPromptSuccess,
    TResult Function(_UpdateIdentifierSuccess value)? updateIdentifierSuccess,
    required TResult orElse(),
  }) {
    if (expiredSubscription != null) {
      return expiredSubscription(this);
    }
    return orElse();
  }
}

abstract class _ExpiredSubscription extends TextGenerateState {
  const factory _ExpiredSubscription(
      {required final TextGenerateModel data,
      required final String message,
      required final String? identifier}) = _$ExpiredSubscriptionImpl;
  const _ExpiredSubscription._() : super._();

  @override
  TextGenerateModel get data;
  String get message;
  String? get identifier;
  @override
  @JsonKey(ignore: true)
  _$$ExpiredSubscriptionImplCopyWith<_$ExpiredSubscriptionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SelectPromptSuccessImplCopyWith<$Res>
    implements $TextGenerateStateCopyWith<$Res> {
  factory _$$SelectPromptSuccessImplCopyWith(_$SelectPromptSuccessImpl value,
          $Res Function(_$SelectPromptSuccessImpl) then) =
      __$$SelectPromptSuccessImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({TextGenerateModel data, Prompt prompt});

  @override
  $TextGenerateModelCopyWith<$Res> get data;
  $PromptCopyWith<$Res> get prompt;
}

/// @nodoc
class __$$SelectPromptSuccessImplCopyWithImpl<$Res>
    extends _$TextGenerateStateCopyWithImpl<$Res, _$SelectPromptSuccessImpl>
    implements _$$SelectPromptSuccessImplCopyWith<$Res> {
  __$$SelectPromptSuccessImplCopyWithImpl(_$SelectPromptSuccessImpl _value,
      $Res Function(_$SelectPromptSuccessImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
    Object? prompt = null,
  }) {
    return _then(_$SelectPromptSuccessImpl(
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as TextGenerateModel,
      prompt: null == prompt
          ? _value.prompt
          : prompt // ignore: cast_nullable_to_non_nullable
              as Prompt,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $PromptCopyWith<$Res> get prompt {
    return $PromptCopyWith<$Res>(_value.prompt, (value) {
      return _then(_value.copyWith(prompt: value));
    });
  }
}

/// @nodoc

class _$SelectPromptSuccessImpl extends _SelectPromptSuccess {
  const _$SelectPromptSuccessImpl({required this.data, required this.prompt})
      : super._();

  @override
  final TextGenerateModel data;
  @override
  final Prompt prompt;

  @override
  String toString() {
    return 'TextGenerateState.selectPromptSuccess(data: $data, prompt: $prompt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SelectPromptSuccessImpl &&
            (identical(other.data, data) || other.data == data) &&
            (identical(other.prompt, prompt) || other.prompt == prompt));
  }

  @override
  int get hashCode => Object.hash(runtimeType, data, prompt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SelectPromptSuccessImplCopyWith<_$SelectPromptSuccessImpl> get copyWith =>
      __$$SelectPromptSuccessImplCopyWithImpl<_$SelectPromptSuccessImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(TextGenerateModel data) initial,
    required TResult Function(TextGenerateModel data) loading,
    required TResult Function(TextGenerateModel data) success,
    required TResult Function(TextGenerateModel data, String message) failure,
    required TResult Function(TextGenerateModel data) editMode,
    required TResult Function(TextGenerateModel data) viewMode,
    required TResult Function(
            TextGenerateModel data, String message, String? identifier)
        expiredSubscription,
    required TResult Function(TextGenerateModel data, Prompt prompt)
        selectPromptSuccess,
    required TResult Function(
            TextGenerateModel data, bool isExpiredSubscription)
        updateIdentifierSuccess,
  }) {
    return selectPromptSuccess(data, prompt);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(TextGenerateModel data)? initial,
    TResult? Function(TextGenerateModel data)? loading,
    TResult? Function(TextGenerateModel data)? success,
    TResult? Function(TextGenerateModel data, String message)? failure,
    TResult? Function(TextGenerateModel data)? editMode,
    TResult? Function(TextGenerateModel data)? viewMode,
    TResult? Function(
            TextGenerateModel data, String message, String? identifier)?
        expiredSubscription,
    TResult? Function(TextGenerateModel data, Prompt prompt)?
        selectPromptSuccess,
    TResult? Function(TextGenerateModel data, bool isExpiredSubscription)?
        updateIdentifierSuccess,
  }) {
    return selectPromptSuccess?.call(data, prompt);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(TextGenerateModel data)? initial,
    TResult Function(TextGenerateModel data)? loading,
    TResult Function(TextGenerateModel data)? success,
    TResult Function(TextGenerateModel data, String message)? failure,
    TResult Function(TextGenerateModel data)? editMode,
    TResult Function(TextGenerateModel data)? viewMode,
    TResult Function(
            TextGenerateModel data, String message, String? identifier)?
        expiredSubscription,
    TResult Function(TextGenerateModel data, Prompt prompt)?
        selectPromptSuccess,
    TResult Function(TextGenerateModel data, bool isExpiredSubscription)?
        updateIdentifierSuccess,
    required TResult orElse(),
  }) {
    if (selectPromptSuccess != null) {
      return selectPromptSuccess(data, prompt);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Success value) success,
    required TResult Function(_Failure value) failure,
    required TResult Function(_EditMode value) editMode,
    required TResult Function(_ViewMode value) viewMode,
    required TResult Function(_ExpiredSubscription value) expiredSubscription,
    required TResult Function(_SelectPromptSuccess value) selectPromptSuccess,
    required TResult Function(_UpdateIdentifierSuccess value)
        updateIdentifierSuccess,
  }) {
    return selectPromptSuccess(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Success value)? success,
    TResult? Function(_Failure value)? failure,
    TResult? Function(_EditMode value)? editMode,
    TResult? Function(_ViewMode value)? viewMode,
    TResult? Function(_ExpiredSubscription value)? expiredSubscription,
    TResult? Function(_SelectPromptSuccess value)? selectPromptSuccess,
    TResult? Function(_UpdateIdentifierSuccess value)? updateIdentifierSuccess,
  }) {
    return selectPromptSuccess?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Success value)? success,
    TResult Function(_Failure value)? failure,
    TResult Function(_EditMode value)? editMode,
    TResult Function(_ViewMode value)? viewMode,
    TResult Function(_ExpiredSubscription value)? expiredSubscription,
    TResult Function(_SelectPromptSuccess value)? selectPromptSuccess,
    TResult Function(_UpdateIdentifierSuccess value)? updateIdentifierSuccess,
    required TResult orElse(),
  }) {
    if (selectPromptSuccess != null) {
      return selectPromptSuccess(this);
    }
    return orElse();
  }
}

abstract class _SelectPromptSuccess extends TextGenerateState {
  const factory _SelectPromptSuccess(
      {required final TextGenerateModel data,
      required final Prompt prompt}) = _$SelectPromptSuccessImpl;
  const _SelectPromptSuccess._() : super._();

  @override
  TextGenerateModel get data;
  Prompt get prompt;
  @override
  @JsonKey(ignore: true)
  _$$SelectPromptSuccessImplCopyWith<_$SelectPromptSuccessImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UpdateIdentifierSuccessImplCopyWith<$Res>
    implements $TextGenerateStateCopyWith<$Res> {
  factory _$$UpdateIdentifierSuccessImplCopyWith(
          _$UpdateIdentifierSuccessImpl value,
          $Res Function(_$UpdateIdentifierSuccessImpl) then) =
      __$$UpdateIdentifierSuccessImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({TextGenerateModel data, bool isExpiredSubscription});

  @override
  $TextGenerateModelCopyWith<$Res> get data;
}

/// @nodoc
class __$$UpdateIdentifierSuccessImplCopyWithImpl<$Res>
    extends _$TextGenerateStateCopyWithImpl<$Res, _$UpdateIdentifierSuccessImpl>
    implements _$$UpdateIdentifierSuccessImplCopyWith<$Res> {
  __$$UpdateIdentifierSuccessImplCopyWithImpl(
      _$UpdateIdentifierSuccessImpl _value,
      $Res Function(_$UpdateIdentifierSuccessImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
    Object? isExpiredSubscription = null,
  }) {
    return _then(_$UpdateIdentifierSuccessImpl(
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as TextGenerateModel,
      isExpiredSubscription: null == isExpiredSubscription
          ? _value.isExpiredSubscription
          : isExpiredSubscription // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$UpdateIdentifierSuccessImpl extends _UpdateIdentifierSuccess {
  const _$UpdateIdentifierSuccessImpl(
      {required this.data, required this.isExpiredSubscription})
      : super._();

  @override
  final TextGenerateModel data;
  @override
  final bool isExpiredSubscription;

  @override
  String toString() {
    return 'TextGenerateState.updateIdentifierSuccess(data: $data, isExpiredSubscription: $isExpiredSubscription)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateIdentifierSuccessImpl &&
            (identical(other.data, data) || other.data == data) &&
            (identical(other.isExpiredSubscription, isExpiredSubscription) ||
                other.isExpiredSubscription == isExpiredSubscription));
  }

  @override
  int get hashCode => Object.hash(runtimeType, data, isExpiredSubscription);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateIdentifierSuccessImplCopyWith<_$UpdateIdentifierSuccessImpl>
      get copyWith => __$$UpdateIdentifierSuccessImplCopyWithImpl<
          _$UpdateIdentifierSuccessImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(TextGenerateModel data) initial,
    required TResult Function(TextGenerateModel data) loading,
    required TResult Function(TextGenerateModel data) success,
    required TResult Function(TextGenerateModel data, String message) failure,
    required TResult Function(TextGenerateModel data) editMode,
    required TResult Function(TextGenerateModel data) viewMode,
    required TResult Function(
            TextGenerateModel data, String message, String? identifier)
        expiredSubscription,
    required TResult Function(TextGenerateModel data, Prompt prompt)
        selectPromptSuccess,
    required TResult Function(
            TextGenerateModel data, bool isExpiredSubscription)
        updateIdentifierSuccess,
  }) {
    return updateIdentifierSuccess(data, isExpiredSubscription);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(TextGenerateModel data)? initial,
    TResult? Function(TextGenerateModel data)? loading,
    TResult? Function(TextGenerateModel data)? success,
    TResult? Function(TextGenerateModel data, String message)? failure,
    TResult? Function(TextGenerateModel data)? editMode,
    TResult? Function(TextGenerateModel data)? viewMode,
    TResult? Function(
            TextGenerateModel data, String message, String? identifier)?
        expiredSubscription,
    TResult? Function(TextGenerateModel data, Prompt prompt)?
        selectPromptSuccess,
    TResult? Function(TextGenerateModel data, bool isExpiredSubscription)?
        updateIdentifierSuccess,
  }) {
    return updateIdentifierSuccess?.call(data, isExpiredSubscription);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(TextGenerateModel data)? initial,
    TResult Function(TextGenerateModel data)? loading,
    TResult Function(TextGenerateModel data)? success,
    TResult Function(TextGenerateModel data, String message)? failure,
    TResult Function(TextGenerateModel data)? editMode,
    TResult Function(TextGenerateModel data)? viewMode,
    TResult Function(
            TextGenerateModel data, String message, String? identifier)?
        expiredSubscription,
    TResult Function(TextGenerateModel data, Prompt prompt)?
        selectPromptSuccess,
    TResult Function(TextGenerateModel data, bool isExpiredSubscription)?
        updateIdentifierSuccess,
    required TResult orElse(),
  }) {
    if (updateIdentifierSuccess != null) {
      return updateIdentifierSuccess(data, isExpiredSubscription);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Success value) success,
    required TResult Function(_Failure value) failure,
    required TResult Function(_EditMode value) editMode,
    required TResult Function(_ViewMode value) viewMode,
    required TResult Function(_ExpiredSubscription value) expiredSubscription,
    required TResult Function(_SelectPromptSuccess value) selectPromptSuccess,
    required TResult Function(_UpdateIdentifierSuccess value)
        updateIdentifierSuccess,
  }) {
    return updateIdentifierSuccess(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Success value)? success,
    TResult? Function(_Failure value)? failure,
    TResult? Function(_EditMode value)? editMode,
    TResult? Function(_ViewMode value)? viewMode,
    TResult? Function(_ExpiredSubscription value)? expiredSubscription,
    TResult? Function(_SelectPromptSuccess value)? selectPromptSuccess,
    TResult? Function(_UpdateIdentifierSuccess value)? updateIdentifierSuccess,
  }) {
    return updateIdentifierSuccess?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Success value)? success,
    TResult Function(_Failure value)? failure,
    TResult Function(_EditMode value)? editMode,
    TResult Function(_ViewMode value)? viewMode,
    TResult Function(_ExpiredSubscription value)? expiredSubscription,
    TResult Function(_SelectPromptSuccess value)? selectPromptSuccess,
    TResult Function(_UpdateIdentifierSuccess value)? updateIdentifierSuccess,
    required TResult orElse(),
  }) {
    if (updateIdentifierSuccess != null) {
      return updateIdentifierSuccess(this);
    }
    return orElse();
  }
}

abstract class _UpdateIdentifierSuccess extends TextGenerateState {
  const factory _UpdateIdentifierSuccess(
          {required final TextGenerateModel data,
          required final bool isExpiredSubscription}) =
      _$UpdateIdentifierSuccessImpl;
  const _UpdateIdentifierSuccess._() : super._();

  @override
  TextGenerateModel get data;
  bool get isExpiredSubscription;
  @override
  @JsonKey(ignore: true)
  _$$UpdateIdentifierSuccessImplCopyWith<_$UpdateIdentifierSuccessImpl>
      get copyWith => throw _privateConstructorUsedError;
}
