import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

@immutable
class SelenicDotIndicatorProperties
    extends ThemeExtension<SelenicDotIndicatorProperties>
    with DiagnosticableTreeMixin {
  /// The gap between the SelenicDotIndicator dots.
  final double gap;

  /// The size of each SelenicDotIndicator dot.
  final double size;

  /// The duration of the SelenicDotIndicator transition animation.
  final Duration transitionDuration;

  /// The curve of the SelenicDotIndicator transition animation.
  final Curve transitionCurve;

  const SelenicDotIndicatorProperties({
    required this.size,
    required this.transitionDuration,
    required this.transitionCurve,
    required this.gap,
  });

  @override
  SelenicDotIndicatorProperties copyWith({
    double? gap,
    double? size,
    Duration? transitionDuration,
    Curve? transitionCurve,
  }) {
    return SelenicDotIndicatorProperties(
      gap: gap ?? this.gap,
      size: size ?? this.size,
      transitionDuration: transitionDuration ?? this.transitionDuration,
      transitionCurve: transitionCurve ?? this.transitionCurve,
    );
  }

  @override
  SelenicDotIndicatorProperties lerp(
    ThemeExtension<SelenicDotIndicatorProperties>? other,
    double t,
  ) {
    if (other is! SelenicDotIndicatorProperties) return this;

    return SelenicDotIndicatorProperties(
      gap: lerpDouble(gap, other.gap, t)!,
      size: lerpDouble(size, other.size, t)!,
      transitionDuration: lerpDuration(
        transitionDuration,
        other.transitionDuration,
        t,
      ),
      transitionCurve: other.transitionCurve,
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(
        DiagnosticsProperty("type", "SelenicDotIndicatorProperties"),
      )
      ..add(
        DoubleProperty("gap", gap),
      )
      ..add(
        DoubleProperty("size", size),
      )
      ..add(
        DiagnosticsProperty<Duration>("transitionDuration", transitionDuration),
      )
      ..add(
        DiagnosticsProperty<Curve>("transitionCurve", transitionCurve),
      );
  }
}
