import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:selenic_design/src/utils/color_premul_lerp.dart';

@immutable
class SelenicHoverEffect extends ThemeExtension<SelenicHoverEffect>
    with DiagnosticableTreeMixin {
  /// The color of the primary hover effect.
  final Color primaryHoverColor;

  /// The color of the secondary hover effect.
  final Color secondaryHoverColor;

  /// The duration of the hover effect.
  final Duration hoverDuration;

  /// The curve of the hover effect.
  final Curve hoverCurve;

  const SelenicHoverEffect({
    required this.primaryHoverColor,
    required this.secondaryHoverColor,
    required this.hoverDuration,
    required this.hoverCurve,
  });

  @override
  SelenicHoverEffect copyWith({
    Color? primaryHoverColor,
    Color? secondaryHoverColor,
    Duration? hoverDuration,
    Curve? hoverCurve,
  }) {
    return SelenicHoverEffect(
      primaryHoverColor: primaryHoverColor ?? this.primaryHoverColor,
      secondaryHoverColor: secondaryHoverColor ?? this.secondaryHoverColor,
      hoverDuration: hoverDuration ?? this.hoverDuration,
      hoverCurve: hoverCurve ?? this.hoverCurve,
    );
  }

  @override
  SelenicHoverEffect lerp(ThemeExtension<SelenicHoverEffect>? other, double t) {
    if (other is! SelenicHoverEffect) return this;

    return SelenicHoverEffect(
      primaryHoverColor:
          colorPremulLerp(primaryHoverColor, other.primaryHoverColor, t)!,
      secondaryHoverColor:
          colorPremulLerp(secondaryHoverColor, other.secondaryHoverColor, t)!,
      hoverDuration: lerpDuration(hoverDuration, other.hoverDuration, t),
      hoverCurve: other.hoverCurve,
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty("type", "SelenicHoverEffects"))
      ..add(ColorProperty("primaryHoverColor", primaryHoverColor))
      ..add(ColorProperty("secondaryHoverColor", secondaryHoverColor))
      ..add(DiagnosticsProperty<Duration>("hoverDuration", hoverDuration))
      ..add(DiagnosticsProperty<Curve>("hoverCurve", hoverCurve));
  }
}
