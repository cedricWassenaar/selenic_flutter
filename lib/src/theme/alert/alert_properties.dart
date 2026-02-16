import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

@immutable
class SelenicAlertProperties extends ThemeExtension<SelenicAlertProperties>
    with DiagnosticableTreeMixin {
  /// The border radius of the SelenicAlert.
  final BorderRadiusGeometry borderRadius;

  /// The horizontal gap between the leading, label and trailing widgets of the
  /// SelenicAlert.
  final double horizontalGap;

  /// The minimum height of the SelenicAlert.
  final double minimumHeight;

  /// The vertical gap between the SelenicAlert header and content.
  final double verticalGap;

  /// The duration of the SelenicAlert transition animation (fade in or out).
  final Duration transitionDuration;

  /// The curve of the SelenicAlert transition animation (fade in or out).
  final Curve transitionCurve;

  /// The padding of the SelenicAlert.
  final EdgeInsetsGeometry padding;

  /// The text style of the SelenicAlert content.
  final TextStyle contentTextStyle;

  /// The text style of the SelenicAlert label.
  final TextStyle labelTextStyle;

  const SelenicAlertProperties({
    required this.borderRadius,
    required this.horizontalGap,
    required this.minimumHeight,
    required this.verticalGap,
    required this.transitionDuration,
    required this.transitionCurve,
    required this.padding,
    required this.contentTextStyle,
    required this.labelTextStyle,
  });

  @override
  SelenicAlertProperties copyWith({
    BorderRadiusGeometry? borderRadius,
    double? horizontalGap,
    double? minimumHeight,
    double? verticalGap,
    Duration? transitionDuration,
    Curve? transitionCurve,
    EdgeInsetsGeometry? padding,
    TextStyle? contentTextStyle,
    TextStyle? labelTextStyle,
  }) {
    return SelenicAlertProperties(
      borderRadius: borderRadius ?? this.borderRadius,
      horizontalGap: horizontalGap ?? this.horizontalGap,
      minimumHeight: minimumHeight ?? this.minimumHeight,
      verticalGap: verticalGap ?? this.verticalGap,
      transitionDuration: transitionDuration ?? this.transitionDuration,
      transitionCurve: transitionCurve ?? this.transitionCurve,
      padding: padding ?? this.padding,
      contentTextStyle: contentTextStyle ?? this.contentTextStyle,
      labelTextStyle: labelTextStyle ?? this.labelTextStyle,
    );
  }

  @override
  SelenicAlertProperties lerp(
    ThemeExtension<SelenicAlertProperties>? other,
    double t,
  ) {
    if (other is! SelenicAlertProperties) return this;

    return SelenicAlertProperties(
      borderRadius:
          BorderRadiusGeometry.lerp(borderRadius, other.borderRadius, t)!,
      horizontalGap: lerpDouble(horizontalGap, other.horizontalGap, t)!,
      minimumHeight: lerpDouble(minimumHeight, other.minimumHeight, t)!,
      verticalGap: lerpDouble(verticalGap, other.verticalGap, t)!,
      transitionDuration:
          lerpDuration(transitionDuration, other.transitionDuration, t),
      transitionCurve: other.transitionCurve,
      padding: EdgeInsetsGeometry.lerp(padding, other.padding, t)!,
      contentTextStyle:
          TextStyle.lerp(contentTextStyle, other.contentTextStyle, t)!,
      labelTextStyle: TextStyle.lerp(labelTextStyle, other.labelTextStyle, t)!,
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(
        DiagnosticsProperty("type", "SelenicAlertProperties"),
      )
      ..add(
        DiagnosticsProperty<BorderRadiusGeometry>("borderRadius", borderRadius),
      )
      ..add(
        DoubleProperty("horizontalGap", horizontalGap),
      )
      ..add(
        DoubleProperty("minimumHeight", minimumHeight),
      )
      ..add(
        DoubleProperty("verticalGap", verticalGap),
      )
      ..add(
        DiagnosticsProperty<Duration>("transitionDuration", transitionDuration),
      )
      ..add(
        DiagnosticsProperty<Curve>("transitionCurve", transitionCurve),
      )
      ..add(
        DiagnosticsProperty<EdgeInsetsGeometry>("padding", padding),
      )
      ..add(
        DiagnosticsProperty<TextStyle>("contentTextStyle", contentTextStyle),
      )
      ..add(
        DiagnosticsProperty<TextStyle>("labelTextStyle", labelTextStyle),
      );
  }
}
