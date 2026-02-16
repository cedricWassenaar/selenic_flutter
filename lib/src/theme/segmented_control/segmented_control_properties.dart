import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

@immutable
class SelenicSegmentedControlProperties
    extends ThemeExtension<SelenicSegmentedControlProperties>
    with DiagnosticableTreeMixin {
  /// The border radius of the SelenicSegmentedControl.
  final BorderRadiusGeometry borderRadius;

  /// The gap between the SelenicSegmentedControl segments.
  final double gap;

  /// The duration of the SelenicSegmentedControl transition animation.
  final Duration transitionDuration;

  /// The curve of the SelenicSegmentedControl transition animation.
  final Curve transitionCurve;

  /// The padding of the SelenicSegmentedControl.
  final EdgeInsetsGeometry padding;

  const SelenicSegmentedControlProperties({
    required this.borderRadius,
    required this.gap,
    required this.transitionDuration,
    required this.transitionCurve,
    required this.padding,
  });

  @override
  SelenicSegmentedControlProperties copyWith({
    BorderRadiusGeometry? borderRadius,
    double? gap,
    Duration? transitionDuration,
    Curve? transitionCurve,
    EdgeInsetsGeometry? padding,
  }) {
    return SelenicSegmentedControlProperties(
      borderRadius: borderRadius ?? this.borderRadius,
      gap: gap ?? this.gap,
      transitionDuration: transitionDuration ?? this.transitionDuration,
      transitionCurve: transitionCurve ?? this.transitionCurve,
      padding: padding ?? this.padding,
    );
  }

  @override
  SelenicSegmentedControlProperties lerp(
    ThemeExtension<SelenicSegmentedControlProperties>? other,
    double t,
  ) {
    if (other is! SelenicSegmentedControlProperties) return this;

    return SelenicSegmentedControlProperties(
      borderRadius:
          BorderRadiusGeometry.lerp(borderRadius, other.borderRadius, t)!,
      gap: lerpDouble(gap, other.gap, t)!,
      transitionDuration:
          lerpDuration(transitionDuration, other.transitionDuration, t),
      transitionCurve: other.transitionCurve,
      padding: EdgeInsetsGeometry.lerp(padding, other.padding, t)!,
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(
        DiagnosticsProperty("type", "SelenicSegmentedControlProperties"),
      )
      ..add(
        DiagnosticsProperty<BorderRadiusGeometry>("borderRadius", borderRadius),
      )
      ..add(
        DoubleProperty("gap", gap),
      )
      ..add(
        DiagnosticsProperty<Duration>("transitionDuration", transitionDuration),
      )
      ..add(
        DiagnosticsProperty<Curve>("transitionCurve", transitionCurve),
      )
      ..add(
        DiagnosticsProperty<EdgeInsetsGeometry>("padding", padding),
      );
  }
}
