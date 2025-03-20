import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_list_custom_config.freezed.dart';
part 'product_list_custom_config.g.dart';

@freezed
class ProductListCustomConfig with _$ProductListCustomConfig {
  const factory ProductListCustomConfig({
    @Default('') String name,
    List<String>? productIds,
    String? backgroundColor,
    String? colorShadow,
  }) = _ProductListCustomConfig;

  factory ProductListCustomConfig.fromJson(Map<String, dynamic> json) =>
      _$ProductListCustomConfigFromJson(json);
}
