import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:selenic_design/src/utils/color_premul_lerp.dart';

@immutable
class SelenicFocusEffect extends ThemeExtension<SelenicFocusEffect>
    with DiagnosticableTreeMixin {
  /// The color of the focus effect.
  final Color effectColor;

  /// The extent of the focus effect.
  final double effectExtent;

  /// The duration of the focus effect.
  final Duration effectDuration;

  /// The curve of the focus effect.
  final Curve effectCurve;

  const SelenicFocusEffect({
    required this.effectColor,
    required this.effectExtent,
    required this.effectDuration,
    required this.effectCurve,
  });

  @override
  SelenicFocusEffect copyWith({
    Color? effectColor,
    double? effectExtent,
    Duration? effectDuration,
    Curve? effectCurve,
  }) {
    return SelenicFocusEffect(
      effectColor: effectColor ?? this.effectColor,
      effectExtent: effectExtent ?? this.effectExtent,
      effectDuration: effectDuration ?? this.effectDuration,
      effectCurve: effectCurve ?? this.effectCurve,
    );
  }

  @override
  SelenicFocusEffect lerp(ThemeExtension<SelenicFocusEffect>? other, double t) {
    if (other is! SelenicFocusEffect) return this;

    return SelenicFocusEffect(
      effectColor: colorPremulLerp(effectColor, other.effectColor, t)!,
      effectExtent: lerpDouble(effectExtent, other.effectExtent, t)!,
      effectDuration: lerpDuration(effectDuration, other.effectDuration, t),
      effectCurve: other.effectCurve,
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty("type", "SelenicFocusEffects"))
      ..add(ColorProperty("effectColor", effectColor))
      ..add(DoubleProperty("effectExtent", effectExtent))
      ..add(DiagnosticsProperty<Duration>("effectDuration", effectDuration))
      ..add(DiagnosticsProperty<Curve>("effectCurve", effectCurve));
  }
}
