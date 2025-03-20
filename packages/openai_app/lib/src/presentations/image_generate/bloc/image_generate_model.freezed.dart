// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'image_generate_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ImageGenerateModel {
  String? get identifier => throw _privateConstructorUsedError;
  bool get allowSubmit => throw _privateConstructorUsedError;
  ImageViewType get viewType => throw _privateConstructorUsedError;
  ImageSize get imageSize => throw _privateConstructorUsedError;
  int get remainingImageGen => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ImageGenerateModelCopyWith<ImageGenerateModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ImageGenerateModelCopyWith<$Res> {
  factory $ImageGenerateModelCopyWith(
          ImageGenerateModel value, $Res Function(ImageGenerateModel) then) =
      _$ImageGenerateModelCopyWithImpl<$Res, ImageGenerateModel>;
  @useResult
  $Res call(
      {String? identifier,
      bool allowSubmit,
      ImageViewType viewType,
      ImageSize imageSize,
      int remainingImageGen});
}

/// @nodoc
class _$ImageGenerateModelCopyWithImpl<$Res, $Val extends ImageGenerateModel>
    implements $ImageGenerateModelCopyWith<$Res> {
  _$ImageGenerateModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? identifier = freezed,
    Object? allowSubmit = null,
    Object? viewType = null,
    Object? imageSize = null,
    Object? remainingImageGen = null,
  }) {
    return _then(_value.copyWith(
      identifier: freezed == identifier
          ? _value.identifier
          : identifier // ignore: cast_nullable_to_non_nullable
              as String?,
      allowSubmit: null == allowSubmit
          ? _value.allowSubmit
          : allowSubmit // ignore: cast_nullable_to_non_nullable
              as bool,
      viewType: null == viewType
          ? _value.viewType
          : viewType // ignore: cast_nullable_to_non_nullable
              as ImageViewType,
      imageSize: null == imageSize
          ? _value.imageSize
          : imageSize // ignore: cast_nullable_to_non_nullable
              as ImageSize,
      remainingImageGen: null == remainingImageGen
          ? _value.remainingImageGen
          : remainingImageGen // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ImageGenerateModelImplCopyWith<$Res>
    implements $ImageGenerateModelCopyWith<$Res> {
  factory _$$ImageGenerateModelImplCopyWith(_$ImageGenerateModelImpl value,
          $Res Function(_$ImageGenerateModelImpl) then) =
      __$$ImageGenerateModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? identifier,
      bool allowSubmit,
      ImageViewType viewType,
      ImageSize imageSize,
      int remainingImageGen});
}

/// @nodoc
class __$$ImageGenerateModelImplCopyWithImpl<$Res>
    extends _$ImageGenerateModelCopyWithImpl<$Res, _$ImageGenerateModelImpl>
    implements _$$ImageGenerateModelImplCopyWith<$Res> {
  __$$ImageGenerateModelImplCopyWithImpl(_$ImageGenerateModelImpl _value,
      $Res Function(_$ImageGenerateModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? identifier = freezed,
    Object? allowSubmit = null,
    Object? viewType = null,
    Object? imageSize = null,
    Object? remainingImageGen = null,
  }) {
    return _then(_$ImageGenerateModelImpl(
      identifier: freezed == identifier
          ? _value.identifier
          : identifier // ignore: cast_nullable_to_non_nullable
              as String?,
      allowSubmit: null == allowSubmit
          ? _value.allowSubmit
          : allowSubmit // ignore: cast_nullable_to_non_nullable
              as bool,
      viewType: null == viewType
          ? _value.viewType
          : viewType // ignore: cast_nullable_to_non_nullable
              as ImageViewType,
      imageSize: null == imageSize
          ? _value.imageSize
          : imageSize // ignore: cast_nullable_to_non_nullable
              as ImageSize,
      remainingImageGen: null == remainingImageGen
          ? _value.remainingImageGen
          : remainingImageGen // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$ImageGenerateModelImpl
    with DiagnosticableTreeMixin
    implements _ImageGenerateModel {
  const _$ImageGenerateModelImpl(
      {this.identifier,
      this.allowSubmit = false,
      this.viewType = ImageViewType.page,
      this.imageSize = ImageSize.small,
      this.remainingImageGen = 0});

  @override
  final String? identifier;
  @override
  @JsonKey()
  final bool allowSubmit;
  @override
  @JsonKey()
  final ImageViewType viewType;
  @override
  @JsonKey()
  final ImageSize imageSize;
  @override
  @JsonKey()
  final int remainingImageGen;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ImageGenerateModel(identifier: $identifier, allowSubmit: $allowSubmit, viewType: $viewType, imageSize: $imageSize, remainingImageGen: $remainingImageGen)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ImageGenerateModel'))
      ..add(DiagnosticsProperty('identifier', identifier))
      ..add(DiagnosticsProperty('allowSubmit', allowSubmit))
      ..add(DiagnosticsProperty('viewType', viewType))
      ..add(DiagnosticsProperty('imageSize', imageSize))
      ..add(DiagnosticsProperty('remainingImageGen', remainingImageGen));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ImageGenerateModelImpl &&
            (identical(other.identifier, identifier) ||
                other.identifier == identifier) &&
            (identical(other.allowSubmit, allowSubmit) ||
                other.allowSubmit == allowSubmit) &&
            (identical(other.viewType, viewType) ||
                other.viewType == viewType) &&
            (identical(other.imageSize, imageSize) ||
                other.imageSize == imageSize) &&
            (identical(other.remainingImageGen, remainingImageGen) ||
                other.remainingImageGen == remainingImageGen));
  }

  @override
  int get hashCode => Object.hash(runtimeType, identifier, allowSubmit,
      viewType, imageSize, remainingImageGen);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ImageGenerateModelImplCopyWith<_$ImageGenerateModelImpl> get copyWith =>
      __$$ImageGenerateModelImplCopyWithImpl<_$ImageGenerateModelImpl>(
          this, _$identity);
}

abstract class _ImageGenerateModel implements ImageGenerateModel {
  const factory _ImageGenerateModel(
      {final String? identifier,
      final bool allowSubmit,
      final ImageViewType viewType,
      final ImageSize imageSize,
      final int remainingImageGen}) = _$ImageGenerateModelImpl;

  @override
  String? get identifier;
  @override
  bool get allowSubmit;
  @override
  ImageViewType get viewType;
  @override
  ImageSize get imageSize;
  @override
  int get remainingImageGen;
  @override
  @JsonKey(ignore: true)
  _$$ImageGenerateModelImplCopyWith<_$ImageGenerateModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
