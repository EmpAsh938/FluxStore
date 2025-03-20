// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'text_generate_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$TextGenerateModel {
  String? get identifier => throw _privateConstructorUsedError;
  PromptUseCase get selectedUseCase => throw _privateConstructorUsedError;
  List<PromptUseCase> get useCases => throw _privateConstructorUsedError;
  String get content => throw _privateConstructorUsedError;
  bool get isCompleteAnimatedText => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TextGenerateModelCopyWith<TextGenerateModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TextGenerateModelCopyWith<$Res> {
  factory $TextGenerateModelCopyWith(
          TextGenerateModel value, $Res Function(TextGenerateModel) then) =
      _$TextGenerateModelCopyWithImpl<$Res, TextGenerateModel>;
  @useResult
  $Res call(
      {String? identifier,
      PromptUseCase selectedUseCase,
      List<PromptUseCase> useCases,
      String content,
      bool isCompleteAnimatedText});

  $PromptUseCaseCopyWith<$Res> get selectedUseCase;
}

/// @nodoc
class _$TextGenerateModelCopyWithImpl<$Res, $Val extends TextGenerateModel>
    implements $TextGenerateModelCopyWith<$Res> {
  _$TextGenerateModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? identifier = freezed,
    Object? selectedUseCase = null,
    Object? useCases = null,
    Object? content = null,
    Object? isCompleteAnimatedText = null,
  }) {
    return _then(_value.copyWith(
      identifier: freezed == identifier
          ? _value.identifier
          : identifier // ignore: cast_nullable_to_non_nullable
              as String?,
      selectedUseCase: null == selectedUseCase
          ? _value.selectedUseCase
          : selectedUseCase // ignore: cast_nullable_to_non_nullable
              as PromptUseCase,
      useCases: null == useCases
          ? _value.useCases
          : useCases // ignore: cast_nullable_to_non_nullable
              as List<PromptUseCase>,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      isCompleteAnimatedText: null == isCompleteAnimatedText
          ? _value.isCompleteAnimatedText
          : isCompleteAnimatedText // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $PromptUseCaseCopyWith<$Res> get selectedUseCase {
    return $PromptUseCaseCopyWith<$Res>(_value.selectedUseCase, (value) {
      return _then(_value.copyWith(selectedUseCase: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$TextGenerateModelImplCopyWith<$Res>
    implements $TextGenerateModelCopyWith<$Res> {
  factory _$$TextGenerateModelImplCopyWith(_$TextGenerateModelImpl value,
          $Res Function(_$TextGenerateModelImpl) then) =
      __$$TextGenerateModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? identifier,
      PromptUseCase selectedUseCase,
      List<PromptUseCase> useCases,
      String content,
      bool isCompleteAnimatedText});

  @override
  $PromptUseCaseCopyWith<$Res> get selectedUseCase;
}

/// @nodoc
class __$$TextGenerateModelImplCopyWithImpl<$Res>
    extends _$TextGenerateModelCopyWithImpl<$Res, _$TextGenerateModelImpl>
    implements _$$TextGenerateModelImplCopyWith<$Res> {
  __$$TextGenerateModelImplCopyWithImpl(_$TextGenerateModelImpl _value,
      $Res Function(_$TextGenerateModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? identifier = freezed,
    Object? selectedUseCase = null,
    Object? useCases = null,
    Object? content = null,
    Object? isCompleteAnimatedText = null,
  }) {
    return _then(_$TextGenerateModelImpl(
      identifier: freezed == identifier
          ? _value.identifier
          : identifier // ignore: cast_nullable_to_non_nullable
              as String?,
      selectedUseCase: null == selectedUseCase
          ? _value.selectedUseCase
          : selectedUseCase // ignore: cast_nullable_to_non_nullable
              as PromptUseCase,
      useCases: null == useCases
          ? _value._useCases
          : useCases // ignore: cast_nullable_to_non_nullable
              as List<PromptUseCase>,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      isCompleteAnimatedText: null == isCompleteAnimatedText
          ? _value.isCompleteAnimatedText
          : isCompleteAnimatedText // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$TextGenerateModelImpl extends _TextGenerateModel
    with DiagnosticableTreeMixin {
  const _$TextGenerateModelImpl(
      {this.identifier,
      required this.selectedUseCase,
      required final List<PromptUseCase> useCases,
      this.content = '',
      this.isCompleteAnimatedText = false})
      : _useCases = useCases,
        super._();

  @override
  final String? identifier;
  @override
  final PromptUseCase selectedUseCase;
  final List<PromptUseCase> _useCases;
  @override
  List<PromptUseCase> get useCases {
    if (_useCases is EqualUnmodifiableListView) return _useCases;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_useCases);
  }

  @override
  @JsonKey()
  final String content;
  @override
  @JsonKey()
  final bool isCompleteAnimatedText;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'TextGenerateModel(identifier: $identifier, selectedUseCase: $selectedUseCase, useCases: $useCases, content: $content, isCompleteAnimatedText: $isCompleteAnimatedText)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'TextGenerateModel'))
      ..add(DiagnosticsProperty('identifier', identifier))
      ..add(DiagnosticsProperty('selectedUseCase', selectedUseCase))
      ..add(DiagnosticsProperty('useCases', useCases))
      ..add(DiagnosticsProperty('content', content))
      ..add(DiagnosticsProperty(
          'isCompleteAnimatedText', isCompleteAnimatedText));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TextGenerateModelImpl &&
            (identical(other.identifier, identifier) ||
                other.identifier == identifier) &&
            (identical(other.selectedUseCase, selectedUseCase) ||
                other.selectedUseCase == selectedUseCase) &&
            const DeepCollectionEquality().equals(other._useCases, _useCases) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.isCompleteAnimatedText, isCompleteAnimatedText) ||
                other.isCompleteAnimatedText == isCompleteAnimatedText));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      identifier,
      selectedUseCase,
      const DeepCollectionEquality().hash(_useCases),
      content,
      isCompleteAnimatedText);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TextGenerateModelImplCopyWith<_$TextGenerateModelImpl> get copyWith =>
      __$$TextGenerateModelImplCopyWithImpl<_$TextGenerateModelImpl>(
          this, _$identity);
}

abstract class _TextGenerateModel extends TextGenerateModel {
  const factory _TextGenerateModel(
      {final String? identifier,
      required final PromptUseCase selectedUseCase,
      required final List<PromptUseCase> useCases,
      final String content,
      final bool isCompleteAnimatedText}) = _$TextGenerateModelImpl;
  const _TextGenerateModel._() : super._();

  @override
  String? get identifier;
  @override
  PromptUseCase get selectedUseCase;
  @override
  List<PromptUseCase> get useCases;
  @override
  String get content;
  @override
  bool get isCompleteAnimatedText;
  @override
  @JsonKey(ignore: true)
  _$$TextGenerateModelImplCopyWith<_$TextGenerateModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
