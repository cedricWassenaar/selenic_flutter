import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:selenic_design/src/utils/color_premul_lerp.dart';

@immutable
class SelenicChipColors extends ThemeExtension<SelenicChipColors>
    with DiagnosticableTreeMixin {
  /// The text and border color of the SelenicChip in active state.
  final Color activeColor;

  /// The background color of the SelenicChip.
  final Color backgroundColor;

  /// The background color of the SelenicChip in active state.
  final Color activeBackgroundColor;

  /// The text color of the SelenicChip.
  final Color textColor;

  const SelenicChipColors({
    required this.activeColor,
    required this.backgroundColor,
    required this.activeBackgroundColor,
    required this.textColor,
  });

  @override
  SelenicChipColors copyWith({
    Color? activeColor,
    Color? backgroundColor,
    Color? activeBackgroundColor,
    Color? textColor,
  }) {
    return SelenicChipColors(
      activeColor: activeColor ?? this.activeColor,
      backgroundColor: backgroundColor ?? this.backgroundColor,
      activeBackgroundColor:
          activeBackgroundColor ?? this.activeBackgroundColor,
      textColor: textColor ?? this.textColor,
    );
  }

  @override
  SelenicChipColors lerp(ThemeExtension<SelenicChipColors>? other, double t) {
    if (other is! SelenicChipColors) return this;

    return SelenicChipColors(
      activeColor: colorPremulLerp(activeColor, other.activeColor, t)!,
      backgroundColor:
          colorPremulLerp(backgroundColor, other.backgroundColor, t)!,
      activeBackgroundColor: colorPremulLerp(
        activeBackgroundColor,
        other.activeBackgroundColor,
        t,
      )!,
      textColor: colorPremulLerp(textColor, other.textColor, t)!,
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty("type", "SelenicChipColors"))
      ..add(ColorProperty("activeColor", activeColor))
      ..add(ColorProperty("backgroundColor", backgroundColor))
      ..add(ColorProperty("activeBackgroundColor", activeBackgroundColor))
      ..add(ColorProperty("textColor", textColor));
  }
}
