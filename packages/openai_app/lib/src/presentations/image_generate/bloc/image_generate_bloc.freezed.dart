// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'image_generate_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ImageGenerateEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(String text) textChanged,
    required TResult Function(ImageSize imageSize) imageSizeChanged,
    required TResult Function(
            String prompt, ImageGenerateOptionPayload optionPayload)
        generateImage,
    required TResult Function(ImageViewType viewType) imageViewChanged,
    required TResult Function(String identifier) updateIdentifier,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(String text)? textChanged,
    TResult? Function(ImageSize imageSize)? imageSizeChanged,
    TResult? Function(String prompt, ImageGenerateOptionPayload optionPayload)?
        generateImage,
    TResult? Function(ImageViewType viewType)? imageViewChanged,
    TResult? Function(String identifier)? updateIdentifier,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(String text)? textChanged,
    TResult Function(ImageSize imageSize)? imageSizeChanged,
    TResult Function(String prompt, ImageGenerateOptionPayload optionPayload)?
        generateImage,
    TResult Function(ImageViewType viewType)? imageViewChanged,
    TResult Function(String identifier)? updateIdentifier,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_TextChanged value) textChanged,
    required TResult Function(_ImageSizeChanged value) imageSizeChanged,
    required TResult Function(_GenerateImage value) generateImage,
    required TResult Function(_ImageViewChanged value) imageViewChanged,
    required TResult Function(_UpdateIdentifier value) updateIdentifier,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_TextChanged value)? textChanged,
    TResult? Function(_ImageSizeChanged value)? imageSizeChanged,
    TResult? Function(_GenerateImage value)? generateImage,
    TResult? Function(_ImageViewChanged value)? imageViewChanged,
    TResult? Function(_UpdateIdentifier value)? updateIdentifier,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_TextChanged value)? textChanged,
    TResult Function(_ImageSizeChanged value)? imageSizeChanged,
    TResult Function(_GenerateImage value)? generateImage,
    TResult Function(_ImageViewChanged value)? imageViewChanged,
    TResult Function(_UpdateIdentifier value)? updateIdentifier,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ImageGenerateEventCopyWith<$Res> {
  factory $ImageGenerateEventCopyWith(
          ImageGenerateEvent value, $Res Function(ImageGenerateEvent) then) =
      _$ImageGenerateEventCopyWithImpl<$Res, ImageGenerateEvent>;
}

/// @nodoc
class _$ImageGenerateEventCopyWithImpl<$Res, $Val extends ImageGenerateEvent>
    implements $ImageGenerateEventCopyWith<$Res> {
  _$ImageGenerateEventCopyWithImpl(this._value, this._then);

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
    extends _$ImageGenerateEventCopyWithImpl<$Res, _$StartedImpl>
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
    return 'ImageGenerateEvent.started()';
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
    required TResult Function(String text) textChanged,
    required TResult Function(ImageSize imageSize) imageSizeChanged,
    required TResult Function(
            String prompt, ImageGenerateOptionPayload optionPayload)
        generateImage,
    required TResult Function(ImageViewType viewType) imageViewChanged,
    required TResult Function(String identifier) updateIdentifier,
  }) {
    return started();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(String text)? textChanged,
    TResult? Function(ImageSize imageSize)? imageSizeChanged,
    TResult? Function(String prompt, ImageGenerateOptionPayload optionPayload)?
        generateImage,
    TResult? Function(ImageViewType viewType)? imageViewChanged,
    TResult? Function(String identifier)? updateIdentifier,
  }) {
    return started?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(String text)? textChanged,
    TResult Function(ImageSize imageSize)? imageSizeChanged,
    TResult Function(String prompt, ImageGenerateOptionPayload optionPayload)?
        generateImage,
    TResult Function(ImageViewType viewType)? imageViewChanged,
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
    required TResult Function(_TextChanged value) textChanged,
    required TResult Function(_ImageSizeChanged value) imageSizeChanged,
    required TResult Function(_GenerateImage value) generateImage,
    required TResult Function(_ImageViewChanged value) imageViewChanged,
    required TResult Function(_UpdateIdentifier value) updateIdentifier,
  }) {
    return started(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_TextChanged value)? textChanged,
    TResult? Function(_ImageSizeChanged value)? imageSizeChanged,
    TResult? Function(_GenerateImage value)? generateImage,
    TResult? Function(_ImageViewChanged value)? imageViewChanged,
    TResult? Function(_UpdateIdentifier value)? updateIdentifier,
  }) {
    return started?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_TextChanged value)? textChanged,
    TResult Function(_ImageSizeChanged value)? imageSizeChanged,
    TResult Function(_GenerateImage value)? generateImage,
    TResult Function(_ImageViewChanged value)? imageViewChanged,
    TResult Function(_UpdateIdentifier value)? updateIdentifier,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started(this);
    }
    return orElse();
  }
}

abstract class _Started implements ImageGenerateEvent {
  const factory _Started() = _$StartedImpl;
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
    extends _$ImageGenerateEventCopyWithImpl<$Res, _$TextChangedImpl>
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
      text: null == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$TextChangedImpl implements _TextChanged {
  const _$TextChangedImpl({required this.text});

  @override
  final String text;

  @override
  String toString() {
    return 'ImageGenerateEvent.textChanged(text: $text)';
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
    required TResult Function(String text) textChanged,
    required TResult Function(ImageSize imageSize) imageSizeChanged,
    required TResult Function(
            String prompt, ImageGenerateOptionPayload optionPayload)
        generateImage,
    required TResult Function(ImageViewType viewType) imageViewChanged,
    required TResult Function(String identifier) updateIdentifier,
  }) {
    return textChanged(text);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(String text)? textChanged,
    TResult? Function(ImageSize imageSize)? imageSizeChanged,
    TResult? Function(String prompt, ImageGenerateOptionPayload optionPayload)?
        generateImage,
    TResult? Function(ImageViewType viewType)? imageViewChanged,
    TResult? Function(String identifier)? updateIdentifier,
  }) {
    return textChanged?.call(text);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(String text)? textChanged,
    TResult Function(ImageSize imageSize)? imageSizeChanged,
    TResult Function(String prompt, ImageGenerateOptionPayload optionPayload)?
        generateImage,
    TResult Function(ImageViewType viewType)? imageViewChanged,
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
    required TResult Function(_TextChanged value) textChanged,
    required TResult Function(_ImageSizeChanged value) imageSizeChanged,
    required TResult Function(_GenerateImage value) generateImage,
    required TResult Function(_ImageViewChanged value) imageViewChanged,
    required TResult Function(_UpdateIdentifier value) updateIdentifier,
  }) {
    return textChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_TextChanged value)? textChanged,
    TResult? Function(_ImageSizeChanged value)? imageSizeChanged,
    TResult? Function(_GenerateImage value)? generateImage,
    TResult? Function(_ImageViewChanged value)? imageViewChanged,
    TResult? Function(_UpdateIdentifier value)? updateIdentifier,
  }) {
    return textChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_TextChanged value)? textChanged,
    TResult Function(_ImageSizeChanged value)? imageSizeChanged,
    TResult Function(_GenerateImage value)? generateImage,
    TResult Function(_ImageViewChanged value)? imageViewChanged,
    TResult Function(_UpdateIdentifier value)? updateIdentifier,
    required TResult orElse(),
  }) {
    if (textChanged != null) {
      return textChanged(this);
    }
    return orElse();
  }
}

abstract class _TextChanged implements ImageGenerateEvent {
  const factory _TextChanged({required final String text}) = _$TextChangedImpl;

  String get text;
  @JsonKey(ignore: true)
  _$$TextChangedImplCopyWith<_$TextChangedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ImageSizeChangedImplCopyWith<$Res> {
  factory _$$ImageSizeChangedImplCopyWith(_$ImageSizeChangedImpl value,
          $Res Function(_$ImageSizeChangedImpl) then) =
      __$$ImageSizeChangedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({ImageSize imageSize});
}

/// @nodoc
class __$$ImageSizeChangedImplCopyWithImpl<$Res>
    extends _$ImageGenerateEventCopyWithImpl<$Res, _$ImageSizeChangedImpl>
    implements _$$ImageSizeChangedImplCopyWith<$Res> {
  __$$ImageSizeChangedImplCopyWithImpl(_$ImageSizeChangedImpl _value,
      $Res Function(_$ImageSizeChangedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? imageSize = null,
  }) {
    return _then(_$ImageSizeChangedImpl(
      imageSize: null == imageSize
          ? _value.imageSize
          : imageSize // ignore: cast_nullable_to_non_nullable
              as ImageSize,
    ));
  }
}

/// @nodoc

class _$ImageSizeChangedImpl implements _ImageSizeChanged {
  const _$ImageSizeChangedImpl({required this.imageSize});

  @override
  final ImageSize imageSize;

  @override
  String toString() {
    return 'ImageGenerateEvent.imageSizeChanged(imageSize: $imageSize)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ImageSizeChangedImpl &&
            (identical(other.imageSize, imageSize) ||
                other.imageSize == imageSize));
  }

  @override
  int get hashCode => Object.hash(runtimeType, imageSize);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ImageSizeChangedImplCopyWith<_$ImageSizeChangedImpl> get copyWith =>
      __$$ImageSizeChangedImplCopyWithImpl<_$ImageSizeChangedImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(String text) textChanged,
    required TResult Function(ImageSize imageSize) imageSizeChanged,
    required TResult Function(
            String prompt, ImageGenerateOptionPayload optionPayload)
        generateImage,
    required TResult Function(ImageViewType viewType) imageViewChanged,
    required TResult Function(String identifier) updateIdentifier,
  }) {
    return imageSizeChanged(imageSize);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(String text)? textChanged,
    TResult? Function(ImageSize imageSize)? imageSizeChanged,
    TResult? Function(String prompt, ImageGenerateOptionPayload optionPayload)?
        generateImage,
    TResult? Function(ImageViewType viewType)? imageViewChanged,
    TResult? Function(String identifier)? updateIdentifier,
  }) {
    return imageSizeChanged?.call(imageSize);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(String text)? textChanged,
    TResult Function(ImageSize imageSize)? imageSizeChanged,
    TResult Function(String prompt, ImageGenerateOptionPayload optionPayload)?
        generateImage,
    TResult Function(ImageViewType viewType)? imageViewChanged,
    TResult Function(String identifier)? updateIdentifier,
    required TResult orElse(),
  }) {
    if (imageSizeChanged != null) {
      return imageSizeChanged(imageSize);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_TextChanged value) textChanged,
    required TResult Function(_ImageSizeChanged value) imageSizeChanged,
    required TResult Function(_GenerateImage value) generateImage,
    required TResult Function(_ImageViewChanged value) imageViewChanged,
    required TResult Function(_UpdateIdentifier value) updateIdentifier,
  }) {
    return imageSizeChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_TextChanged value)? textChanged,
    TResult? Function(_ImageSizeChanged value)? imageSizeChanged,
    TResult? Function(_GenerateImage value)? generateImage,
    TResult? Function(_ImageViewChanged value)? imageViewChanged,
    TResult? Function(_UpdateIdentifier value)? updateIdentifier,
  }) {
    return imageSizeChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_TextChanged value)? textChanged,
    TResult Function(_ImageSizeChanged value)? imageSizeChanged,
    TResult Function(_GenerateImage value)? generateImage,
    TResult Function(_ImageViewChanged value)? imageViewChanged,
    TResult Function(_UpdateIdentifier value)? updateIdentifier,
    required TResult orElse(),
  }) {
    if (imageSizeChanged != null) {
      return imageSizeChanged(this);
    }
    return orElse();
  }
}

abstract class _ImageSizeChanged implements ImageGenerateEvent {
  const factory _ImageSizeChanged({required final ImageSize imageSize}) =
      _$ImageSizeChangedImpl;

  ImageSize get imageSize;
  @JsonKey(ignore: true)
  _$$ImageSizeChangedImplCopyWith<_$ImageSizeChangedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$GenerateImageImplCopyWith<$Res> {
  factory _$$GenerateImageImplCopyWith(
          _$GenerateImageImpl value, $Res Function(_$GenerateImageImpl) then) =
      __$$GenerateImageImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String prompt, ImageGenerateOptionPayload optionPayload});

  $ImageGenerateOptionPayloadCopyWith<$Res> get optionPayload;
}

/// @nodoc
class __$$GenerateImageImplCopyWithImpl<$Res>
    extends _$ImageGenerateEventCopyWithImpl<$Res, _$GenerateImageImpl>
    implements _$$GenerateImageImplCopyWith<$Res> {
  __$$GenerateImageImplCopyWithImpl(
      _$GenerateImageImpl _value, $Res Function(_$GenerateImageImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? prompt = null,
    Object? optionPayload = null,
  }) {
    return _then(_$GenerateImageImpl(
      prompt: null == prompt
          ? _value.prompt
          : prompt // ignore: cast_nullable_to_non_nullable
              as String,
      optionPayload: null == optionPayload
          ? _value.optionPayload
          : optionPayload // ignore: cast_nullable_to_non_nullable
              as ImageGenerateOptionPayload,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $ImageGenerateOptionPayloadCopyWith<$Res> get optionPayload {
    return $ImageGenerateOptionPayloadCopyWith<$Res>(_value.optionPayload,
        (value) {
      return _then(_value.copyWith(optionPayload: value));
    });
  }
}

/// @nodoc

class _$GenerateImageImpl implements _GenerateImage {
  const _$GenerateImageImpl(
      {required this.prompt, required this.optionPayload});

  @override
  final String prompt;
  @override
  final ImageGenerateOptionPayload optionPayload;

  @override
  String toString() {
    return 'ImageGenerateEvent.generateImage(prompt: $prompt, optionPayload: $optionPayload)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GenerateImageImpl &&
            (identical(other.prompt, prompt) || other.prompt == prompt) &&
            (identical(other.optionPayload, optionPayload) ||
                other.optionPayload == optionPayload));
  }

  @override
  int get hashCode => Object.hash(runtimeType, prompt, optionPayload);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GenerateImageImplCopyWith<_$GenerateImageImpl> get copyWith =>
      __$$GenerateImageImplCopyWithImpl<_$GenerateImageImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(String text) textChanged,
    required TResult Function(ImageSize imageSize) imageSizeChanged,
    required TResult Function(
            String prompt, ImageGenerateOptionPayload optionPayload)
        generateImage,
    required TResult Function(ImageViewType viewType) imageViewChanged,
    required TResult Function(String identifier) updateIdentifier,
  }) {
    return generateImage(prompt, optionPayload);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(String text)? textChanged,
    TResult? Function(ImageSize imageSize)? imageSizeChanged,
    TResult? Function(String prompt, ImageGenerateOptionPayload optionPayload)?
        generateImage,
    TResult? Function(ImageViewType viewType)? imageViewChanged,
    TResult? Function(String identifier)? updateIdentifier,
  }) {
    return generateImage?.call(prompt, optionPayload);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(String text)? textChanged,
    TResult Function(ImageSize imageSize)? imageSizeChanged,
    TResult Function(String prompt, ImageGenerateOptionPayload optionPayload)?
        generateImage,
    TResult Function(ImageViewType viewType)? imageViewChanged,
    TResult Function(String identifier)? updateIdentifier,
    required TResult orElse(),
  }) {
    if (generateImage != null) {
      return generateImage(prompt, optionPayload);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_TextChanged value) textChanged,
    required TResult Function(_ImageSizeChanged value) imageSizeChanged,
    required TResult Function(_GenerateImage value) generateImage,
    required TResult Function(_ImageViewChanged value) imageViewChanged,
    required TResult Function(_UpdateIdentifier value) updateIdentifier,
  }) {
    return generateImage(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_TextChanged value)? textChanged,
    TResult? Function(_ImageSizeChanged value)? imageSizeChanged,
    TResult? Function(_GenerateImage value)? generateImage,
    TResult? Function(_ImageViewChanged value)? imageViewChanged,
    TResult? Function(_UpdateIdentifier value)? updateIdentifier,
  }) {
    return generateImage?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_TextChanged value)? textChanged,
    TResult Function(_ImageSizeChanged value)? imageSizeChanged,
    TResult Function(_GenerateImage value)? generateImage,
    TResult Function(_ImageViewChanged value)? imageViewChanged,
    TResult Function(_UpdateIdentifier value)? updateIdentifier,
    required TResult orElse(),
  }) {
    if (generateImage != null) {
      return generateImage(this);
    }
    return orElse();
  }
}

abstract class _GenerateImage implements ImageGenerateEvent {
  const factory _GenerateImage(
          {required final String prompt,
          required final ImageGenerateOptionPayload optionPayload}) =
      _$GenerateImageImpl;

  String get prompt;
  ImageGenerateOptionPayload get optionPayload;
  @JsonKey(ignore: true)
  _$$GenerateImageImplCopyWith<_$GenerateImageImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ImageViewChangedImplCopyWith<$Res> {
  factory _$$ImageViewChangedImplCopyWith(_$ImageViewChangedImpl value,
          $Res Function(_$ImageViewChangedImpl) then) =
      __$$ImageViewChangedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({ImageViewType viewType});
}

/// @nodoc
class __$$ImageViewChangedImplCopyWithImpl<$Res>
    extends _$ImageGenerateEventCopyWithImpl<$Res, _$ImageViewChangedImpl>
    implements _$$ImageViewChangedImplCopyWith<$Res> {
  __$$ImageViewChangedImplCopyWithImpl(_$ImageViewChangedImpl _value,
      $Res Function(_$ImageViewChangedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? viewType = null,
  }) {
    return _then(_$ImageViewChangedImpl(
      viewType: null == viewType
          ? _value.viewType
          : viewType // ignore: cast_nullable_to_non_nullable
              as ImageViewType,
    ));
  }
}

/// @nodoc

class _$ImageViewChangedImpl implements _ImageViewChanged {
  const _$ImageViewChangedImpl({required this.viewType});

  @override
  final ImageViewType viewType;

  @override
  String toString() {
    return 'ImageGenerateEvent.imageViewChanged(viewType: $viewType)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ImageViewChangedImpl &&
            (identical(other.viewType, viewType) ||
                other.viewType == viewType));
  }

  @override
  int get hashCode => Object.hash(runtimeType, viewType);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ImageViewChangedImplCopyWith<_$ImageViewChangedImpl> get copyWith =>
      __$$ImageViewChangedImplCopyWithImpl<_$ImageViewChangedImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(String text) textChanged,
    required TResult Function(ImageSize imageSize) imageSizeChanged,
    required TResult Function(
            String prompt, ImageGenerateOptionPayload optionPayload)
        generateImage,
    required TResult Function(ImageViewType viewType) imageViewChanged,
    required TResult Function(String identifier) updateIdentifier,
  }) {
    return imageViewChanged(viewType);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(String text)? textChanged,
    TResult? Function(ImageSize imageSize)? imageSizeChanged,
    TResult? Function(String prompt, ImageGenerateOptionPayload optionPayload)?
        generateImage,
    TResult? Function(ImageViewType viewType)? imageViewChanged,
    TResult? Function(String identifier)? updateIdentifier,
  }) {
    return imageViewChanged?.call(viewType);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(String text)? textChanged,
    TResult Function(ImageSize imageSize)? imageSizeChanged,
    TResult Function(String prompt, ImageGenerateOptionPayload optionPayload)?
        generateImage,
    TResult Function(ImageViewType viewType)? imageViewChanged,
    TResult Function(String identifier)? updateIdentifier,
    required TResult orElse(),
  }) {
    if (imageViewChanged != null) {
      return imageViewChanged(viewType);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_TextChanged value) textChanged,
    required TResult Function(_ImageSizeChanged value) imageSizeChanged,
    required TResult Function(_GenerateImage value) generateImage,
    required TResult Function(_ImageViewChanged value) imageViewChanged,
    required TResult Function(_UpdateIdentifier value) updateIdentifier,
  }) {
    return imageViewChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_TextChanged value)? textChanged,
    TResult? Function(_ImageSizeChanged value)? imageSizeChanged,
    TResult? Function(_GenerateImage value)? generateImage,
    TResult? Function(_ImageViewChanged value)? imageViewChanged,
    TResult? Function(_UpdateIdentifier value)? updateIdentifier,
  }) {
    return imageViewChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_TextChanged value)? textChanged,
    TResult Function(_ImageSizeChanged value)? imageSizeChanged,
    TResult Function(_GenerateImage value)? generateImage,
    TResult Function(_ImageViewChanged value)? imageViewChanged,
    TResult Function(_UpdateIdentifier value)? updateIdentifier,
    required TResult orElse(),
  }) {
    if (imageViewChanged != null) {
      return imageViewChanged(this);
    }
    return orElse();
  }
}

abstract class _ImageViewChanged implements ImageGenerateEvent {
  const factory _ImageViewChanged({required final ImageViewType viewType}) =
      _$ImageViewChangedImpl;

  ImageViewType get viewType;
  @JsonKey(ignore: true)
  _$$ImageViewChangedImplCopyWith<_$ImageViewChangedImpl> get copyWith =>
      throw _privateConstructorUsedError;
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
    extends _$ImageGenerateEventCopyWithImpl<$Res, _$UpdateIdentifierImpl>
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
    return 'ImageGenerateEvent.updateIdentifier(identifier: $identifier)';
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
    required TResult Function(String text) textChanged,
    required TResult Function(ImageSize imageSize) imageSizeChanged,
    required TResult Function(
            String prompt, ImageGenerateOptionPayload optionPayload)
        generateImage,
    required TResult Function(ImageViewType viewType) imageViewChanged,
    required TResult Function(String identifier) updateIdentifier,
  }) {
    return updateIdentifier(identifier);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(String text)? textChanged,
    TResult? Function(ImageSize imageSize)? imageSizeChanged,
    TResult? Function(String prompt, ImageGenerateOptionPayload optionPayload)?
        generateImage,
    TResult? Function(ImageViewType viewType)? imageViewChanged,
    TResult? Function(String identifier)? updateIdentifier,
  }) {
    return updateIdentifier?.call(identifier);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(String text)? textChanged,
    TResult Function(ImageSize imageSize)? imageSizeChanged,
    TResult Function(String prompt, ImageGenerateOptionPayload optionPayload)?
        generateImage,
    TResult Function(ImageViewType viewType)? imageViewChanged,
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
    required TResult Function(_TextChanged value) textChanged,
    required TResult Function(_ImageSizeChanged value) imageSizeChanged,
    required TResult Function(_GenerateImage value) generateImage,
    required TResult Function(_ImageViewChanged value) imageViewChanged,
    required TResult Function(_UpdateIdentifier value) updateIdentifier,
  }) {
    return updateIdentifier(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_TextChanged value)? textChanged,
    TResult? Function(_ImageSizeChanged value)? imageSizeChanged,
    TResult? Function(_GenerateImage value)? generateImage,
    TResult? Function(_ImageViewChanged value)? imageViewChanged,
    TResult? Function(_UpdateIdentifier value)? updateIdentifier,
  }) {
    return updateIdentifier?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_TextChanged value)? textChanged,
    TResult Function(_ImageSizeChanged value)? imageSizeChanged,
    TResult Function(_GenerateImage value)? generateImage,
    TResult Function(_ImageViewChanged value)? imageViewChanged,
    TResult Function(_UpdateIdentifier value)? updateIdentifier,
    required TResult orElse(),
  }) {
    if (updateIdentifier != null) {
      return updateIdentifier(this);
    }
    return orElse();
  }
}

abstract class _UpdateIdentifier implements ImageGenerateEvent {
  const factory _UpdateIdentifier(final String identifier) =
      _$UpdateIdentifierImpl;

  String get identifier;
  @JsonKey(ignore: true)
  _$$UpdateIdentifierImplCopyWith<_$UpdateIdentifierImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$ImageGenerateState {
  ImageGenerateModel get data => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(ImageGenerateModel data) initial,
    required TResult Function(ImageGenerateModel data) loading,
    required TResult Function(ImageGenerateModel data, List<String> images)
        success,
    required TResult Function(ImageGenerateModel data, String errorMessage)
        error,
    required TResult Function(
            ImageGenerateModel data, String message, String? identifier)
        expiredSubscription,
    required TResult Function(
            ImageGenerateModel data, bool isExpiredSubscription)
        updateIdentifierSuccess,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(ImageGenerateModel data)? initial,
    TResult? Function(ImageGenerateModel data)? loading,
    TResult? Function(ImageGenerateModel data, List<String> images)? success,
    TResult? Function(ImageGenerateModel data, String errorMessage)? error,
    TResult? Function(
            ImageGenerateModel data, String message, String? identifier)?
        expiredSubscription,
    TResult? Function(ImageGenerateModel data, bool isExpiredSubscription)?
        updateIdentifierSuccess,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(ImageGenerateModel data)? initial,
    TResult Function(ImageGenerateModel data)? loading,
    TResult Function(ImageGenerateModel data, List<String> images)? success,
    TResult Function(ImageGenerateModel data, String errorMessage)? error,
    TResult Function(
            ImageGenerateModel data, String message, String? identifier)?
        expiredSubscription,
    TResult Function(ImageGenerateModel data, bool isExpiredSubscription)?
        updateIdentifierSuccess,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Success value) success,
    required TResult Function(_Error value) error,
    required TResult Function(_ExpiredSubscription value) expiredSubscription,
    required TResult Function(_UpdateIdentifierSuccess value)
        updateIdentifierSuccess,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Success value)? success,
    TResult? Function(_Error value)? error,
    TResult? Function(_ExpiredSubscription value)? expiredSubscription,
    TResult? Function(_UpdateIdentifierSuccess value)? updateIdentifierSuccess,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Success value)? success,
    TResult Function(_Error value)? error,
    TResult Function(_ExpiredSubscription value)? expiredSubscription,
    TResult Function(_UpdateIdentifierSuccess value)? updateIdentifierSuccess,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ImageGenerateStateCopyWith<ImageGenerateState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ImageGenerateStateCopyWith<$Res> {
  factory $ImageGenerateStateCopyWith(
          ImageGenerateState value, $Res Function(ImageGenerateState) then) =
      _$ImageGenerateStateCopyWithImpl<$Res, ImageGenerateState>;
  @useResult
  $Res call({ImageGenerateModel data});

  $ImageGenerateModelCopyWith<$Res> get data;
}

/// @nodoc
class _$ImageGenerateStateCopyWithImpl<$Res, $Val extends ImageGenerateState>
    implements $ImageGenerateStateCopyWith<$Res> {
  _$ImageGenerateStateCopyWithImpl(this._value, this._then);

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
              as ImageGenerateModel,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ImageGenerateModelCopyWith<$Res> get data {
    return $ImageGenerateModelCopyWith<$Res>(_value.data, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res>
    implements $ImageGenerateStateCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({ImageGenerateModel data});

  @override
  $ImageGenerateModelCopyWith<$Res> get data;
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$ImageGenerateStateCopyWithImpl<$Res, _$InitialImpl>
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
              as ImageGenerateModel,
    ));
  }
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl({this.data = const ImageGenerateModel()});

  @override
  @JsonKey()
  final ImageGenerateModel data;

  @override
  String toString() {
    return 'ImageGenerateState.initial(data: $data)';
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
    required TResult Function(ImageGenerateModel data) initial,
    required TResult Function(ImageGenerateModel data) loading,
    required TResult Function(ImageGenerateModel data, List<String> images)
        success,
    required TResult Function(ImageGenerateModel data, String errorMessage)
        error,
    required TResult Function(
            ImageGenerateModel data, String message, String? identifier)
        expiredSubscription,
    required TResult Function(
            ImageGenerateModel data, bool isExpiredSubscription)
        updateIdentifierSuccess,
  }) {
    return initial(data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(ImageGenerateModel data)? initial,
    TResult? Function(ImageGenerateModel data)? loading,
    TResult? Function(ImageGenerateModel data, List<String> images)? success,
    TResult? Function(ImageGenerateModel data, String errorMessage)? error,
    TResult? Function(
            ImageGenerateModel data, String message, String? identifier)?
        expiredSubscription,
    TResult? Function(ImageGenerateModel data, bool isExpiredSubscription)?
        updateIdentifierSuccess,
  }) {
    return initial?.call(data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(ImageGenerateModel data)? initial,
    TResult Function(ImageGenerateModel data)? loading,
    TResult Function(ImageGenerateModel data, List<String> images)? success,
    TResult Function(ImageGenerateModel data, String errorMessage)? error,
    TResult Function(
            ImageGenerateModel data, String message, String? identifier)?
        expiredSubscription,
    TResult Function(ImageGenerateModel data, bool isExpiredSubscription)?
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
    required TResult Function(_Error value) error,
    required TResult Function(_ExpiredSubscription value) expiredSubscription,
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
    TResult? Function(_Error value)? error,
    TResult? Function(_ExpiredSubscription value)? expiredSubscription,
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
    TResult Function(_Error value)? error,
    TResult Function(_ExpiredSubscription value)? expiredSubscription,
    TResult Function(_UpdateIdentifierSuccess value)? updateIdentifierSuccess,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements ImageGenerateState {
  const factory _Initial({final ImageGenerateModel data}) = _$InitialImpl;

  @override
  ImageGenerateModel get data;
  @override
  @JsonKey(ignore: true)
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LoadingImplCopyWith<$Res>
    implements $ImageGenerateStateCopyWith<$Res> {
  factory _$$LoadingImplCopyWith(
          _$LoadingImpl value, $Res Function(_$LoadingImpl) then) =
      __$$LoadingImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({ImageGenerateModel data});

  @override
  $ImageGenerateModelCopyWith<$Res> get data;
}

/// @nodoc
class __$$LoadingImplCopyWithImpl<$Res>
    extends _$ImageGenerateStateCopyWithImpl<$Res, _$LoadingImpl>
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
              as ImageGenerateModel,
    ));
  }
}

/// @nodoc

class _$LoadingImpl implements _Loading {
  const _$LoadingImpl({required this.data});

  @override
  final ImageGenerateModel data;

  @override
  String toString() {
    return 'ImageGenerateState.loading(data: $data)';
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
    required TResult Function(ImageGenerateModel data) initial,
    required TResult Function(ImageGenerateModel data) loading,
    required TResult Function(ImageGenerateModel data, List<String> images)
        success,
    required TResult Function(ImageGenerateModel data, String errorMessage)
        error,
    required TResult Function(
            ImageGenerateModel data, String message, String? identifier)
        expiredSubscription,
    required TResult Function(
            ImageGenerateModel data, bool isExpiredSubscription)
        updateIdentifierSuccess,
  }) {
    return loading(data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(ImageGenerateModel data)? initial,
    TResult? Function(ImageGenerateModel data)? loading,
    TResult? Function(ImageGenerateModel data, List<String> images)? success,
    TResult? Function(ImageGenerateModel data, String errorMessage)? error,
    TResult? Function(
            ImageGenerateModel data, String message, String? identifier)?
        expiredSubscription,
    TResult? Function(ImageGenerateModel data, bool isExpiredSubscription)?
        updateIdentifierSuccess,
  }) {
    return loading?.call(data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(ImageGenerateModel data)? initial,
    TResult Function(ImageGenerateModel data)? loading,
    TResult Function(ImageGenerateModel data, List<String> images)? success,
    TResult Function(ImageGenerateModel data, String errorMessage)? error,
    TResult Function(
            ImageGenerateModel data, String message, String? identifier)?
        expiredSubscription,
    TResult Function(ImageGenerateModel data, bool isExpiredSubscription)?
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
    required TResult Function(_Error value) error,
    required TResult Function(_ExpiredSubscription value) expiredSubscription,
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
    TResult? Function(_Error value)? error,
    TResult? Function(_ExpiredSubscription value)? expiredSubscription,
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
    TResult Function(_Error value)? error,
    TResult Function(_ExpiredSubscription value)? expiredSubscription,
    TResult Function(_UpdateIdentifierSuccess value)? updateIdentifierSuccess,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _Loading implements ImageGenerateState {
  const factory _Loading({required final ImageGenerateModel data}) =
      _$LoadingImpl;

  @override
  ImageGenerateModel get data;
  @override
  @JsonKey(ignore: true)
  _$$LoadingImplCopyWith<_$LoadingImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SuccessImplCopyWith<$Res>
    implements $ImageGenerateStateCopyWith<$Res> {
  factory _$$SuccessImplCopyWith(
          _$SuccessImpl value, $Res Function(_$SuccessImpl) then) =
      __$$SuccessImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({ImageGenerateModel data, List<String> images});

  @override
  $ImageGenerateModelCopyWith<$Res> get data;
}

/// @nodoc
class __$$SuccessImplCopyWithImpl<$Res>
    extends _$ImageGenerateStateCopyWithImpl<$Res, _$SuccessImpl>
    implements _$$SuccessImplCopyWith<$Res> {
  __$$SuccessImplCopyWithImpl(
      _$SuccessImpl _value, $Res Function(_$SuccessImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
    Object? images = null,
  }) {
    return _then(_$SuccessImpl(
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as ImageGenerateModel,
      images: null == images
          ? _value._images
          : images // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc

class _$SuccessImpl implements _Success {
  const _$SuccessImpl({required this.data, required final List<String> images})
      : _images = images;

  @override
  final ImageGenerateModel data;
  final List<String> _images;
  @override
  List<String> get images {
    if (_images is EqualUnmodifiableListView) return _images;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_images);
  }

  @override
  String toString() {
    return 'ImageGenerateState.success(data: $data, images: $images)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SuccessImpl &&
            (identical(other.data, data) || other.data == data) &&
            const DeepCollectionEquality().equals(other._images, _images));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, data, const DeepCollectionEquality().hash(_images));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SuccessImplCopyWith<_$SuccessImpl> get copyWith =>
      __$$SuccessImplCopyWithImpl<_$SuccessImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(ImageGenerateModel data) initial,
    required TResult Function(ImageGenerateModel data) loading,
    required TResult Function(ImageGenerateModel data, List<String> images)
        success,
    required TResult Function(ImageGenerateModel data, String errorMessage)
        error,
    required TResult Function(
            ImageGenerateModel data, String message, String? identifier)
        expiredSubscription,
    required TResult Function(
            ImageGenerateModel data, bool isExpiredSubscription)
        updateIdentifierSuccess,
  }) {
    return success(data, images);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(ImageGenerateModel data)? initial,
    TResult? Function(ImageGenerateModel data)? loading,
    TResult? Function(ImageGenerateModel data, List<String> images)? success,
    TResult? Function(ImageGenerateModel data, String errorMessage)? error,
    TResult? Function(
            ImageGenerateModel data, String message, String? identifier)?
        expiredSubscription,
    TResult? Function(ImageGenerateModel data, bool isExpiredSubscription)?
        updateIdentifierSuccess,
  }) {
    return success?.call(data, images);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(ImageGenerateModel data)? initial,
    TResult Function(ImageGenerateModel data)? loading,
    TResult Function(ImageGenerateModel data, List<String> images)? success,
    TResult Function(ImageGenerateModel data, String errorMessage)? error,
    TResult Function(
            ImageGenerateModel data, String message, String? identifier)?
        expiredSubscription,
    TResult Function(ImageGenerateModel data, bool isExpiredSubscription)?
        updateIdentifierSuccess,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(data, images);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Success value) success,
    required TResult Function(_Error value) error,
    required TResult Function(_ExpiredSubscription value) expiredSubscription,
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
    TResult? Function(_Error value)? error,
    TResult? Function(_ExpiredSubscription value)? expiredSubscription,
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
    TResult Function(_Error value)? error,
    TResult Function(_ExpiredSubscription value)? expiredSubscription,
    TResult Function(_UpdateIdentifierSuccess value)? updateIdentifierSuccess,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class _Success implements ImageGenerateState {
  const factory _Success(
      {required final ImageGenerateModel data,
      required final List<String> images}) = _$SuccessImpl;

  @override
  ImageGenerateModel get data;
  List<String> get images;
  @override
  @JsonKey(ignore: true)
  _$$SuccessImplCopyWith<_$SuccessImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ErrorImplCopyWith<$Res>
    implements $ImageGenerateStateCopyWith<$Res> {
  factory _$$ErrorImplCopyWith(
          _$ErrorImpl value, $Res Function(_$ErrorImpl) then) =
      __$$ErrorImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({ImageGenerateModel data, String errorMessage});

  @override
  $ImageGenerateModelCopyWith<$Res> get data;
}

/// @nodoc
class __$$ErrorImplCopyWithImpl<$Res>
    extends _$ImageGenerateStateCopyWithImpl<$Res, _$ErrorImpl>
    implements _$$ErrorImplCopyWith<$Res> {
  __$$ErrorImplCopyWithImpl(
      _$ErrorImpl _value, $Res Function(_$ErrorImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
    Object? errorMessage = null,
  }) {
    return _then(_$ErrorImpl(
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as ImageGenerateModel,
      errorMessage: null == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ErrorImpl implements _Error {
  const _$ErrorImpl({required this.data, required this.errorMessage});

  @override
  final ImageGenerateModel data;
  @override
  final String errorMessage;

  @override
  String toString() {
    return 'ImageGenerateState.error(data: $data, errorMessage: $errorMessage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ErrorImpl &&
            (identical(other.data, data) || other.data == data) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @override
  int get hashCode => Object.hash(runtimeType, data, errorMessage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      __$$ErrorImplCopyWithImpl<_$ErrorImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(ImageGenerateModel data) initial,
    required TResult Function(ImageGenerateModel data) loading,
    required TResult Function(ImageGenerateModel data, List<String> images)
        success,
    required TResult Function(ImageGenerateModel data, String errorMessage)
        error,
    required TResult Function(
            ImageGenerateModel data, String message, String? identifier)
        expiredSubscription,
    required TResult Function(
            ImageGenerateModel data, bool isExpiredSubscription)
        updateIdentifierSuccess,
  }) {
    return error(data, errorMessage);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(ImageGenerateModel data)? initial,
    TResult? Function(ImageGenerateModel data)? loading,
    TResult? Function(ImageGenerateModel data, List<String> images)? success,
    TResult? Function(ImageGenerateModel data, String errorMessage)? error,
    TResult? Function(
            ImageGenerateModel data, String message, String? identifier)?
        expiredSubscription,
    TResult? Function(ImageGenerateModel data, bool isExpiredSubscription)?
        updateIdentifierSuccess,
  }) {
    return error?.call(data, errorMessage);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(ImageGenerateModel data)? initial,
    TResult Function(ImageGenerateModel data)? loading,
    TResult Function(ImageGenerateModel data, List<String> images)? success,
    TResult Function(ImageGenerateModel data, String errorMessage)? error,
    TResult Function(
            ImageGenerateModel data, String message, String? identifier)?
        expiredSubscription,
    TResult Function(ImageGenerateModel data, bool isExpiredSubscription)?
        updateIdentifierSuccess,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(data, errorMessage);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Success value) success,
    required TResult Function(_Error value) error,
    required TResult Function(_ExpiredSubscription value) expiredSubscription,
    required TResult Function(_UpdateIdentifierSuccess value)
        updateIdentifierSuccess,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Success value)? success,
    TResult? Function(_Error value)? error,
    TResult? Function(_ExpiredSubscription value)? expiredSubscription,
    TResult? Function(_UpdateIdentifierSuccess value)? updateIdentifierSuccess,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Success value)? success,
    TResult Function(_Error value)? error,
    TResult Function(_ExpiredSubscription value)? expiredSubscription,
    TResult Function(_UpdateIdentifierSuccess value)? updateIdentifierSuccess,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _Error implements ImageGenerateState {
  const factory _Error(
      {required final ImageGenerateModel data,
      required final String errorMessage}) = _$ErrorImpl;

  @override
  ImageGenerateModel get data;
  String get errorMessage;
  @override
  @JsonKey(ignore: true)
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ExpiredSubscriptionImplCopyWith<$Res>
    implements $ImageGenerateStateCopyWith<$Res> {
  factory _$$ExpiredSubscriptionImplCopyWith(_$ExpiredSubscriptionImpl value,
          $Res Function(_$ExpiredSubscriptionImpl) then) =
      __$$ExpiredSubscriptionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({ImageGenerateModel data, String message, String? identifier});

  @override
  $ImageGenerateModelCopyWith<$Res> get data;
}

/// @nodoc
class __$$ExpiredSubscriptionImplCopyWithImpl<$Res>
    extends _$ImageGenerateStateCopyWithImpl<$Res, _$ExpiredSubscriptionImpl>
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
              as ImageGenerateModel,
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

class _$ExpiredSubscriptionImpl implements _ExpiredSubscription {
  const _$ExpiredSubscriptionImpl(
      {required this.data, required this.message, required this.identifier});

  @override
  final ImageGenerateModel data;
  @override
  final String message;
  @override
  final String? identifier;

  @override
  String toString() {
    return 'ImageGenerateState.expiredSubscription(data: $data, message: $message, identifier: $identifier)';
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
    required TResult Function(ImageGenerateModel data) initial,
    required TResult Function(ImageGenerateModel data) loading,
    required TResult Function(ImageGenerateModel data, List<String> images)
        success,
    required TResult Function(ImageGenerateModel data, String errorMessage)
        error,
    required TResult Function(
            ImageGenerateModel data, String message, String? identifier)
        expiredSubscription,
    required TResult Function(
            ImageGenerateModel data, bool isExpiredSubscription)
        updateIdentifierSuccess,
  }) {
    return expiredSubscription(data, message, identifier);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(ImageGenerateModel data)? initial,
    TResult? Function(ImageGenerateModel data)? loading,
    TResult? Function(ImageGenerateModel data, List<String> images)? success,
    TResult? Function(ImageGenerateModel data, String errorMessage)? error,
    TResult? Function(
            ImageGenerateModel data, String message, String? identifier)?
        expiredSubscription,
    TResult? Function(ImageGenerateModel data, bool isExpiredSubscription)?
        updateIdentifierSuccess,
  }) {
    return expiredSubscription?.call(data, message, identifier);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(ImageGenerateModel data)? initial,
    TResult Function(ImageGenerateModel data)? loading,
    TResult Function(ImageGenerateModel data, List<String> images)? success,
    TResult Function(ImageGenerateModel data, String errorMessage)? error,
    TResult Function(
            ImageGenerateModel data, String message, String? identifier)?
        expiredSubscription,
    TResult Function(ImageGenerateModel data, bool isExpiredSubscription)?
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
    required TResult Function(_Error value) error,
    required TResult Function(_ExpiredSubscription value) expiredSubscription,
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
    TResult? Function(_Error value)? error,
    TResult? Function(_ExpiredSubscription value)? expiredSubscription,
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
    TResult Function(_Error value)? error,
    TResult Function(_ExpiredSubscription value)? expiredSubscription,
    TResult Function(_UpdateIdentifierSuccess value)? updateIdentifierSuccess,
    required TResult orElse(),
  }) {
    if (expiredSubscription != null) {
      return expiredSubscription(this);
    }
    return orElse();
  }
}

abstract class _ExpiredSubscription implements ImageGenerateState {
  const factory _ExpiredSubscription(
      {required final ImageGenerateModel data,
      required final String message,
      required final String? identifier}) = _$ExpiredSubscriptionImpl;

  @override
  ImageGenerateModel get data;
  String get message;
  String? get identifier;
  @override
  @JsonKey(ignore: true)
  _$$ExpiredSubscriptionImplCopyWith<_$ExpiredSubscriptionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UpdateIdentifierSuccessImplCopyWith<$Res>
    implements $ImageGenerateStateCopyWith<$Res> {
  factory _$$UpdateIdentifierSuccessImplCopyWith(
          _$UpdateIdentifierSuccessImpl value,
          $Res Function(_$UpdateIdentifierSuccessImpl) then) =
      __$$UpdateIdentifierSuccessImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({ImageGenerateModel data, bool isExpiredSubscription});

  @override
  $ImageGenerateModelCopyWith<$Res> get data;
}

/// @nodoc
class __$$UpdateIdentifierSuccessImplCopyWithImpl<$Res>
    extends _$ImageGenerateStateCopyWithImpl<$Res,
        _$UpdateIdentifierSuccessImpl>
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
              as ImageGenerateModel,
      isExpiredSubscription: null == isExpiredSubscription
          ? _value.isExpiredSubscription
          : isExpiredSubscription // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$UpdateIdentifierSuccessImpl implements _UpdateIdentifierSuccess {
  const _$UpdateIdentifierSuccessImpl(
      {required this.data, required this.isExpiredSubscription});

  @override
  final ImageGenerateModel data;
  @override
  final bool isExpiredSubscription;

  @override
  String toString() {
    return 'ImageGenerateState.updateIdentifierSuccess(data: $data, isExpiredSubscription: $isExpiredSubscription)';
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
    required TResult Function(ImageGenerateModel data) initial,
    required TResult Function(ImageGenerateModel data) loading,
    required TResult Function(ImageGenerateModel data, List<String> images)
        success,
    required TResult Function(ImageGenerateModel data, String errorMessage)
        error,
    required TResult Function(
            ImageGenerateModel data, String message, String? identifier)
        expiredSubscription,
    required TResult Function(
            ImageGenerateModel data, bool isExpiredSubscription)
        updateIdentifierSuccess,
  }) {
    return updateIdentifierSuccess(data, isExpiredSubscription);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(ImageGenerateModel data)? initial,
    TResult? Function(ImageGenerateModel data)? loading,
    TResult? Function(ImageGenerateModel data, List<String> images)? success,
    TResult? Function(ImageGenerateModel data, String errorMessage)? error,
    TResult? Function(
            ImageGenerateModel data, String message, String? identifier)?
        expiredSubscription,
    TResult? Function(ImageGenerateModel data, bool isExpiredSubscription)?
        updateIdentifierSuccess,
  }) {
    return updateIdentifierSuccess?.call(data, isExpiredSubscription);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(ImageGenerateModel data)? initial,
    TResult Function(ImageGenerateModel data)? loading,
    TResult Function(ImageGenerateModel data, List<String> images)? success,
    TResult Function(ImageGenerateModel data, String errorMessage)? error,
    TResult Function(
            ImageGenerateModel data, String message, String? identifier)?
        expiredSubscription,
    TResult Function(ImageGenerateModel data, bool isExpiredSubscription)?
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
    required TResult Function(_Error value) error,
    required TResult Function(_ExpiredSubscription value) expiredSubscription,
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
    TResult? Function(_Error value)? error,
    TResult? Function(_ExpiredSubscription value)? expiredSubscription,
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
    TResult Function(_Error value)? error,
    TResult Function(_ExpiredSubscription value)? expiredSubscription,
    TResult Function(_UpdateIdentifierSuccess value)? updateIdentifierSuccess,
    required TResult orElse(),
  }) {
    if (updateIdentifierSuccess != null) {
      return updateIdentifierSuccess(this);
    }
    return orElse();
  }
}

abstract class _UpdateIdentifierSuccess implements ImageGenerateState {
  const factory _UpdateIdentifierSuccess(
          {required final ImageGenerateModel data,
          required final bool isExpiredSubscription}) =
      _$UpdateIdentifierSuccessImpl;

  @override
  ImageGenerateModel get data;
  bool get isExpiredSubscription;
  @override
  @JsonKey(ignore: true)
  _$$UpdateIdentifierSuccessImplCopyWith<_$UpdateIdentifierSuccessImpl>
      get copyWith => throw _privateConstructorUsedError;
}
