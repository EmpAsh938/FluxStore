// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_list_custom_config.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProductListCustomConfigImpl _$$ProductListCustomConfigImplFromJson(
        Map<String, dynamic> json) =>
    _$ProductListCustomConfigImpl(
      name: json['name'] as String? ?? '',
      productIds: (json['productIds'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      backgroundColor: json['backgroundColor'] as String?,
      colorShadow: json['colorShadow'] as String?,
    );

Map<String, dynamic> _$$ProductListCustomConfigImplToJson(
        _$ProductListCustomConfigImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'productIds': instance.productIds,
      'backgroundColor': instance.backgroundColor,
      'colorShadow': instance.colorShadow,
    };
