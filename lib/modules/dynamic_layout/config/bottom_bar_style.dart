import 'package:json_annotation/json_annotation.dart';

@JsonEnum()
enum BottomBarStyle {
  static,
  opacityEffect,
  slideEffect,
  defect,
  ;

  bool get isNormal => this == BottomBarStyle.static;

  bool get isOpacityEffect => this == BottomBarStyle.opacityEffect;

  bool get isSlideEffect => this == BottomBarStyle.slideEffect;

  bool get isDefect => this == BottomBarStyle.defect;

  static BottomBarStyle get defaultValue => BottomBarStyle.static;

  factory BottomBarStyle.fromString(String? value) {
    return BottomBarStyle.values.firstWhere(
      (e) => e.name == value,
      orElse: () => BottomBarStyle.defaultValue,
    );
  }
}
