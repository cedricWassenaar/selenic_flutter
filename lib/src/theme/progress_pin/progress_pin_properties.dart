import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

@immutable
class SelenicProgressPinProperties
    extends ThemeExtension<SelenicProgressPinProperties>
    with DiagnosticableTreeMixin {
  /// The shadow elevation of the SelenicProgressPin.
  final double shadowElevation;

  /// The height of the SelenicProgressPin arrow.
  final double arrowHeight;

  /// The width of the SelenicProgressPin arrow.
  final double arrowWidth;

  /// The vertical distance between the SelenicProgressPin and the
  /// SelenicLinearProgress widget.
  final double pinDistance;

  /// The width of the SelenicProgressPin.
  final double pinWidth;

  /// The border width of the SelenicProgressPin.
  final double pinBorderWidth;

  /// The text style of the SelenicProgressPin.
  final TextStyle textStyle;

  const SelenicProgressPinProperties({
    required this.shadowElevation,
    required this.arrowHeight,
    required this.arrowWidth,
    required this.pinDistance,
    required this.pinWidth,
    required this.pinBorderWidth,
    required this.textStyle,
  });

  @override
  SelenicProgressPinProperties copyWith({
    double? shadowElevation,
    double? arrowHeight,
    double? arrowWidth,
    double? pinDistance,
    double? pinWidth,
    double? pinBorderWidth,
    TextStyle? textStyle,
  }) {
    return SelenicProgressPinProperties(
      shadowElevation: shadowElevation ?? this.shadowElevation,
      arrowHeight: arrowHeight ?? this.arrowHeight,
      arrowWidth: arrowWidth ?? this.arrowWidth,
      pinDistance: pinDistance ?? this.pinDistance,
      pinWidth: pinWidth ?? this.pinWidth,
      pinBorderWidth: pinBorderWidth ?? this.pinBorderWidth,
      textStyle: textStyle ?? this.textStyle,
    );
  }

  @override
  SelenicProgressPinProperties lerp(
    ThemeExtension<SelenicProgressPinProperties>? other,
    double t,
  ) {
    if (other is! SelenicProgressPinProperties) return this;

    return SelenicProgressPinProperties(
      shadowElevation: lerpDouble(shadowElevation, other.shadowElevation, t)!,
      arrowHeight: lerpDouble(arrowHeight, other.arrowHeight, t)!,
      arrowWidth: lerpDouble(arrowWidth, other.arrowWidth, t)!,
      pinDistance: lerpDouble(pinDistance, other.pinDistance, t)!,
      pinWidth: lerpDouble(pinWidth, other.pinWidth, t)!,
      pinBorderWidth: lerpDouble(pinBorderWidth, other.pinBorderWidth, t)!,
      textStyle: TextStyle.lerp(textStyle, other.textStyle, t)!,
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty("type", "SelenicProgressPinProperties"))
      ..add(DoubleProperty("shadowElevation", shadowElevation))
      ..add(DoubleProperty("arrowHeight", arrowHeight))
      ..add(DoubleProperty("arrowWidth", arrowWidth))
      ..add(DoubleProperty("pinDistance", pinDistance))
      ..add(DoubleProperty("pinWidth", pinWidth))
      ..add(DoubleProperty("pinBorderWidth", pinBorderWidth))
      ..add(DiagnosticsProperty<TextStyle>("textStyle", textStyle));
  }
}
