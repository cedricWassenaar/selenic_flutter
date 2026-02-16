import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

@immutable
class SelenicTooltipProperties extends ThemeExtension<SelenicTooltipProperties>
    with DiagnosticableTreeMixin {
  /// The border radius of the SelenicTooltip.
  final BorderRadiusGeometry borderRadius;

  /// The base width of the SelenicTooltip arrow (tail).
  final double arrowBaseWidth;

  /// The length of the SelenicTooltip arrow (tail).
  final double arrowLength;

  /// The distance from the tip of the SelenicTooltip arrow (tail) to the target
  /// widget.
  final double arrowTipDistance;

  /// The duration of the SelenicTooltip transition animation (fade in or out).
  final Duration transitionDuration;

  /// The curve of the SelenicTooltip transition animation (fade in or out).
  final Curve transitionCurve;

  /// The padding of the SelenicTooltip content.
  final EdgeInsetsGeometry contentPadding;

  /// The text style of the SelenicTooltip.
  final TextStyle textStyle;

  const SelenicTooltipProperties({
    required this.borderRadius,
    required this.arrowBaseWidth,
    required this.arrowLength,
    required this.arrowTipDistance,
    required this.transitionDuration,
    required this.transitionCurve,
    required this.contentPadding,
    required this.textStyle,
  });

  @override
  SelenicTooltipProperties copyWith({
    BorderRadiusGeometry? borderRadius,
    double? arrowBaseWidth,
    double? arrowLength,
    double? arrowTipDistance,
    Duration? transitionDuration,
    Curve? transitionCurve,
    EdgeInsetsGeometry? contentPadding,
    TextStyle? textStyle,
  }) {
    return SelenicTooltipProperties(
      borderRadius: borderRadius ?? this.borderRadius,
      arrowBaseWidth: arrowBaseWidth ?? this.arrowBaseWidth,
      arrowLength: arrowLength ?? this.arrowLength,
      arrowTipDistance: arrowTipDistance ?? this.arrowTipDistance,
      transitionDuration: transitionDuration ?? this.transitionDuration,
      transitionCurve: transitionCurve ?? this.transitionCurve,
      contentPadding: contentPadding ?? this.contentPadding,
      textStyle: textStyle ?? this.textStyle,
    );
  }

  @override
  SelenicTooltipProperties lerp(
    ThemeExtension<SelenicTooltipProperties>? other,
    double t,
  ) {
    if (other is! SelenicTooltipProperties) return this;

    return SelenicTooltipProperties(
      borderRadius:
          BorderRadiusGeometry.lerp(borderRadius, other.borderRadius, t)!,
      arrowBaseWidth: lerpDouble(arrowBaseWidth, other.arrowBaseWidth, t)!,
      arrowLength: lerpDouble(arrowLength, other.arrowLength, t)!,
      arrowTipDistance:
          lerpDouble(arrowTipDistance, other.arrowTipDistance, t)!,
      transitionDuration:
          lerpDuration(transitionDuration, other.transitionDuration, t),
      transitionCurve: other.transitionCurve,
      contentPadding:
          EdgeInsetsGeometry.lerp(contentPadding, other.contentPadding, t)!,
      textStyle: TextStyle.lerp(textStyle, other.textStyle, t)!,
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(
        DiagnosticsProperty("type", "SelenicTooltipProperties"),
      )
      ..add(
        DiagnosticsProperty<BorderRadiusGeometry>("borderRadius", borderRadius),
      )
      ..add(
        DoubleProperty("arrowBaseWidth", arrowBaseWidth),
      )
      ..add(
        DoubleProperty("arrowLength", arrowLength),
      )
      ..add(
        DoubleProperty("arrowTipDistance", arrowTipDistance),
      )
      ..add(
        DiagnosticsProperty<Duration>("transitionDuration", transitionDuration),
      )
      ..add(
        DiagnosticsProperty<Curve>("transitionCurve", transitionCurve),
      )
      ..add(
        DiagnosticsProperty<EdgeInsetsGeometry>(
          "contentPadding",
          contentPadding,
        ),
      )
      ..add(
        DiagnosticsProperty<TextStyle>(
          "textStyle",
          textStyle,
        ),
      );
  }
}
