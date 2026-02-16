import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

@immutable
class SelenicDrawerProperties extends ThemeExtension<SelenicDrawerProperties>
    with DiagnosticableTreeMixin {
  /// The border radius of the SelenicDrawer.
  final BorderRadiusGeometry borderRadius;

  /// The width of the SelenicDrawer.
  final double width;

  /// The text style of the SelenicDrawer.
  final TextStyle textStyle;

  const SelenicDrawerProperties({
    required this.borderRadius,
    required this.width,
    required this.textStyle,
  });

  @override
  SelenicDrawerProperties copyWith({
    BorderRadiusGeometry? borderRadius,
    double? width,
    TextStyle? textStyle,
  }) {
    return SelenicDrawerProperties(
      borderRadius: borderRadius ?? this.borderRadius,
      width: width ?? this.width,
      textStyle: textStyle ?? this.textStyle,
    );
  }

  @override
  SelenicDrawerProperties lerp(
    ThemeExtension<SelenicDrawerProperties>? other,
    double t,
  ) {
    if (other is! SelenicDrawerProperties) return this;

    return SelenicDrawerProperties(
      borderRadius:
          BorderRadiusGeometry.lerp(borderRadius, other.borderRadius, t)!,
      width: lerpDouble(width, other.width, t)!,
      textStyle: TextStyle.lerp(textStyle, other.textStyle, t)!,
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(
        DiagnosticsProperty("type", "SelenicDrawerProperties"),
      )
      ..add(
        DiagnosticsProperty<BorderRadiusGeometry>("borderRadius", borderRadius),
      )
      ..add(
        DoubleProperty("width", width),
      )
      ..add(
        DiagnosticsProperty<TextStyle>("textStyle", textStyle),
      );
  }
}
