import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:selenic_design/src/utils/color_premul_lerp.dart';

@immutable
class SelenicControlEffect extends ThemeExtension<SelenicControlEffect>
    with DiagnosticableTreeMixin {
  /// The effect color of the control.
  final Color? effectColor;

  /// The effect duration of the control.
  final Duration effectDuration;

  /// The effect curve of the control.
  final Curve effectCurve;

  /// The effect extent of the control.
  final double? effectExtent;

  /// The effect scalar of the control.
  final double? effectScalar;

  const SelenicControlEffect({
    this.effectColor,
    required this.effectDuration,
    required this.effectCurve,
    this.effectExtent,
    this.effectScalar,
  });

  @override
  SelenicControlEffect copyWith({
    Color? effectColor,
    Duration? effectDuration,
    Curve? effectCurve,
    double? effectExtent,
    double? effectScalar,
  }) {
    return SelenicControlEffect(
      effectColor: effectColor ?? this.effectColor,
      effectDuration: effectDuration ?? this.effectDuration,
      effectCurve: effectCurve ?? this.effectCurve,
      effectExtent: effectExtent ?? this.effectExtent,
      effectScalar: effectScalar ?? this.effectScalar,
    );
  }

  @override
  SelenicControlEffect lerp(
      ThemeExtension<SelenicControlEffect>? other, double t) {
    if (other is! SelenicControlEffect) return this;

    return SelenicControlEffect(
      effectColor: colorPremulLerp(effectColor, other.effectColor, t),
      effectDuration: lerpDuration(effectDuration, other.effectDuration, t),
      effectCurve: other.effectCurve,
      effectExtent: lerpDouble(effectExtent, other.effectExtent, t),
      effectScalar: lerpDouble(effectScalar, other.effectScalar, t),
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty("type", "SelenicControlsEffects"))
      ..add(ColorProperty("effectColor", effectColor))
      ..add(DiagnosticsProperty<Duration>("effectDuration", effectDuration))
      ..add(DiagnosticsProperty<Curve>("effectCurve", effectCurve))
      ..add(DoubleProperty("effectExtent", effectExtent))
      ..add(DoubleProperty("effectScalar", effectScalar));
  }
}
