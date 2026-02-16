import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

@immutable
class SelenicToastProperties extends ThemeExtension<SelenicToastProperties>
    with DiagnosticableTreeMixin {
  /// The border radius of the SelenicToast.
  final BorderRadiusGeometry borderRadius;

  /// The horizontal gap between the leading, label and trailing widgets of the
  /// SelenicToast.
  final double horizontalGap;

  /// The vertical gap between the SelenicToast header and content.
  final double verticalGap;

  /// The duration to display the SelenicToast.
  final Duration displayDuration;

  /// The duration of the SelenicToast transition animation (slide in or out).
  final Duration transitionDuration;

  /// The curve of the SelenicToast transition animation (slide in or out).
  final Curve transitionCurve;

  /// The padding of the SelenicToast content.
  final EdgeInsetsGeometry contentPadding;

  /// The text style of the SelenicToast.
  final TextStyle textStyle;

  const SelenicToastProperties({
    required this.borderRadius,
    required this.horizontalGap,
    required this.verticalGap,
    required this.displayDuration,
    required this.transitionDuration,
    required this.transitionCurve,
    required this.contentPadding,
    required this.textStyle,
  });

  @override
  SelenicToastProperties copyWith({
    BorderRadiusGeometry? borderRadius,
    double? horizontalGap,
    double? verticalGap,
    Duration? displayDuration,
    Duration? transitionDuration,
    Curve? transitionCurve,
    EdgeInsetsGeometry? contentPadding,
    TextStyle? textStyle,
  }) {
    return SelenicToastProperties(
      borderRadius: borderRadius ?? this.borderRadius,
      horizontalGap: horizontalGap ?? this.horizontalGap,
      verticalGap: verticalGap ?? this.verticalGap,
      displayDuration: displayDuration ?? this.displayDuration,
      transitionDuration: transitionDuration ?? this.transitionDuration,
      transitionCurve: transitionCurve ?? this.transitionCurve,
      contentPadding: contentPadding ?? this.contentPadding,
      textStyle: textStyle ?? this.textStyle,
    );
  }

  @override
  SelenicToastProperties lerp(
    ThemeExtension<SelenicToastProperties>? other,
    double t,
  ) {
    if (other is! SelenicToastProperties) return this;

    return SelenicToastProperties(
      borderRadius: BorderRadiusGeometry.lerp(
        borderRadius,
        other.borderRadius,
        t,
      )!,
      horizontalGap: lerpDouble(horizontalGap, other.horizontalGap, t)!,
      verticalGap: lerpDouble(verticalGap, other.verticalGap, t)!,
      displayDuration: lerpDuration(displayDuration, other.displayDuration, t),
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
        DiagnosticsProperty("type", "SelenicToastProperties"),
      )
      ..add(
        DiagnosticsProperty<BorderRadiusGeometry>("borderRadius", borderRadius),
      )
      ..add(
        DoubleProperty("horizontalGap", horizontalGap),
      )
      ..add(
        DiagnosticsProperty<Duration>("displayDuration", displayDuration),
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
