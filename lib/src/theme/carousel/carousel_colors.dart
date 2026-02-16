import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:selenic_design/src/utils/color_premul_lerp.dart';

@immutable
class SelenicCarouselColors extends ThemeExtension<SelenicCarouselColors>
    with DiagnosticableTreeMixin {
  /// The text color of the SelenicCarousel items.
  final Color textColor;

  /// The icon color of the SelenicCarousel items.
  final Color iconColor;

  const SelenicCarouselColors({
    required this.textColor,
    required this.iconColor,
  });

  @override
  SelenicCarouselColors copyWith({
    Color? textColor,
    Color? iconColor,
  }) {
    return SelenicCarouselColors(
      textColor: textColor ?? this.textColor,
      iconColor: iconColor ?? this.iconColor,
    );
  }

  @override
  SelenicCarouselColors lerp(
      ThemeExtension<SelenicCarouselColors>? other, double t) {
    if (other is! SelenicCarouselColors) return this;

    return SelenicCarouselColors(
      textColor: colorPremulLerp(textColor, other.textColor, t)!,
      iconColor: colorPremulLerp(iconColor, other.iconColor, t)!,
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty("type", "SelenicCarouselColors"))
      ..add(ColorProperty("textColor", textColor))
      ..add(ColorProperty("iconColor", iconColor));
  }
}
