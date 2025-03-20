// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product_list_custom_config.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ProductListCustomConfig _$ProductListCustomConfigFromJson(
    Map<String, dynamic> json) {
  return _ProductListCustomConfig.fromJson(json);
}

/// @nodoc
mixin _$ProductListCustomConfig {
  String get name => throw _privateConstructorUsedError;
  List<String>? get productIds => throw _privateConstructorUsedError;
  String? get backgroundColor => throw _privateConstructorUsedError;
  String? get colorShadow => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProductListCustomConfigCopyWith<ProductListCustomConfig> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductListCustomConfigCopyWith<$Res> {
  factory $ProductListCustomConfigCopyWith(ProductListCustomConfig value,
          $Res Function(ProductListCustomConfig) then) =
      _$ProductListCustomConfigCopyWithImpl<$Res, ProductListCustomConfig>;
  @useResult
  $Res call(
      {String name,
      List<String>? productIds,
      String? backgroundColor,
      String? colorShadow});
}

/// @nodoc
class _$ProductListCustomConfigCopyWithImpl<$Res,
        $Val extends ProductListCustomConfig>
    implements $ProductListCustomConfigCopyWith<$Res> {
  _$ProductListCustomConfigCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? productIds = freezed,
    Object? backgroundColor = freezed,
    Object? colorShadow = freezed,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      productIds: freezed == productIds
          ? _value.productIds
          : productIds // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      backgroundColor: freezed == backgroundColor
          ? _value.backgroundColor
          : backgroundColor // ignore: cast_nullable_to_non_nullable
              as String?,
      colorShadow: freezed == colorShadow
          ? _value.colorShadow
          : colorShadow // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ProductListCustomConfigImplCopyWith<$Res>
    implements $ProductListCustomConfigCopyWith<$Res> {
  factory _$$ProductListCustomConfigImplCopyWith(
          _$ProductListCustomConfigImpl value,
          $Res Function(_$ProductListCustomConfigImpl) then) =
      __$$ProductListCustomConfigImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String name,
      List<String>? productIds,
      String? backgroundColor,
      String? colorShadow});
}

/// @nodoc
class __$$ProductListCustomConfigImplCopyWithImpl<$Res>
    extends _$ProductListCustomConfigCopyWithImpl<$Res,
        _$ProductListCustomConfigImpl>
    implements _$$ProductListCustomConfigImplCopyWith<$Res> {
  __$$ProductListCustomConfigImplCopyWithImpl(
      _$ProductListCustomConfigImpl _value,
      $Res Function(_$ProductListCustomConfigImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? productIds = freezed,
    Object? backgroundColor = freezed,
    Object? colorShadow = freezed,
  }) {
    return _then(_$ProductListCustomConfigImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      productIds: freezed == productIds
          ? _value._productIds
          : productIds // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      backgroundColor: freezed == backgroundColor
          ? _value.backgroundColor
          : backgroundColor // ignore: cast_nullable_to_non_nullable
              as String?,
      colorShadow: freezed == colorShadow
          ? _value.colorShadow
          : colorShadow // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ProductListCustomConfigImpl implements _ProductListCustomConfig {
  const _$ProductListCustomConfigImpl(
      {this.name = '',
      final List<String>? productIds,
      this.backgroundColor,
      this.colorShadow})
      : _productIds = productIds;

  factory _$ProductListCustomConfigImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProductListCustomConfigImplFromJson(json);

  @override
  @JsonKey()
  final String name;
  final List<String>? _productIds;
  @override
  List<String>? get productIds {
    final value = _productIds;
    if (value == null) return null;
    if (_productIds is EqualUnmodifiableListView) return _productIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final String? backgroundColor;
  @override
  final String? colorShadow;

  @override
  String toString() {
    return 'ProductListCustomConfig(name: $name, productIds: $productIds, backgroundColor: $backgroundColor, colorShadow: $colorShadow)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProductListCustomConfigImpl &&
            (identical(other.name, name) || other.name == name) &&
            const DeepCollectionEquality()
                .equals(other._productIds, _productIds) &&
            (identical(other.backgroundColor, backgroundColor) ||
                other.backgroundColor == backgroundColor) &&
            (identical(other.colorShadow, colorShadow) ||
                other.colorShadow == colorShadow));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      name,
      const DeepCollectionEquality().hash(_productIds),
      backgroundColor,
      colorShadow);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ProductListCustomConfigImplCopyWith<_$ProductListCustomConfigImpl>
      get copyWith => __$$ProductListCustomConfigImplCopyWithImpl<
          _$ProductListCustomConfigImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProductListCustomConfigImplToJson(
      this,
    );
  }
}

abstract class _ProductListCustomConfig implements ProductListCustomConfig {
  const factory _ProductListCustomConfig(
      {final String name,
      final List<String>? productIds,
      final String? backgroundColor,
      final String? colorShadow}) = _$ProductListCustomConfigImpl;

  factory _ProductListCustomConfig.fromJson(Map<String, dynamic> json) =
      _$ProductListCustomConfigImpl.fromJson;

  @override
  String get name;
  @override
  List<String>? get productIds;
  @override
  String? get backgroundColor;
  @override
  String? get colorShadow;
  @override
  @JsonKey(ignore: true)
  _$$ProductListCustomConfigImplCopyWith<_$ProductListCustomConfigImpl>
      get copyWith => throw _privateConstructorUsedError;
}
