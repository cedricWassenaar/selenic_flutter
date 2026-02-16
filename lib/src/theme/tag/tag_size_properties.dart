import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

@immutable
class SelenicTagSizeProperties extends ThemeExtension<SelenicTagSizeProperties>
    with DiagnosticableTreeMixin {
  /// The border radius of the SelenicTag.
  final BorderRadiusGeometry borderRadius;

  /// The horizontal gap between the leading, label and trailing widgets of the
  /// SelenicTag.
  final double gap;

  /// The height of the SelenicTag.
  final double height;

  /// The size value of the SelenicTag icon.
  final double iconSizeValue;

  /// The padding of the SelenicTag.
  final EdgeInsetsGeometry padding;

  /// The text style of the SelenicTag.
  final TextStyle textStyle;

  const SelenicTagSizeProperties({
    required this.borderRadius,
    required this.gap,
    required this.height,
    required this.iconSizeValue,
    required this.padding,
    required this.textStyle,
  });

  @override
  SelenicTagSizeProperties copyWith({
    BorderRadiusGeometry? borderRadius,
    double? gap,
    double? height,
    double? iconSizeValue,
    EdgeInsetsGeometry? padding,
    TextStyle? textStyle,
  }) {
    return SelenicTagSizeProperties(
      borderRadius: borderRadius ?? this.borderRadius,
      gap: gap ?? this.gap,
      height: height ?? this.height,
      iconSizeValue: iconSizeValue ?? this.iconSizeValue,
      padding: padding ?? this.padding,
      textStyle: textStyle ?? this.textStyle,
    );
  }

  @override
  SelenicTagSizeProperties lerp(
    ThemeExtension<SelenicTagSizeProperties>? other,
    double t,
  ) {
    if (other is! SelenicTagSizeProperties) return this;

    return SelenicTagSizeProperties(
      borderRadius:
          BorderRadiusGeometry.lerp(borderRadius, other.borderRadius, t)!,
      gap: lerpDouble(gap, other.gap, t)!,
      height: lerpDouble(height, other.height, t)!,
      iconSizeValue: lerpDouble(iconSizeValue, other.iconSizeValue, t)!,
      padding: EdgeInsetsGeometry.lerp(padding, other.padding, t)!,
      textStyle: TextStyle.lerp(textStyle, other.textStyle, t)!,
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(
        DiagnosticsProperty(
          "type",
          "SelenicTagSizeProperties",
        ),
      )
      ..add(
        DiagnosticsProperty<BorderRadiusGeometry>(
          "borderRadius",
          borderRadius,
        ),
      )
      ..add(DoubleProperty("gap", gap))
      ..add(DoubleProperty("height", height))
      ..add(DoubleProperty("iconSizeValue", iconSizeValue))
      ..add(DiagnosticsProperty<EdgeInsetsGeometry>("padding", padding))
      ..add(DiagnosticsProperty<TextStyle>("textStyle", textStyle));
  }
}
