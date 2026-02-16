import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:selenic_design/src/utils/color_premul_lerp.dart';

@immutable
class SelenicCheckboxColors extends ThemeExtension<SelenicCheckboxColors>
    with DiagnosticableTreeMixin {
  /// The background color of the checked SelenicCheckbox.
  final Color activeColor;

  /// The border color of the unchecked SelenicCheckbox.
  final Color borderColor;

  /// The color of the check icon when the SelenicCheckbox is checked.
  final Color checkColor;

  /// The background color of the unchecked SelenicCheckbox.
  final Color inactiveColor;

  const SelenicCheckboxColors({
    required this.activeColor,
    required this.borderColor,
    required this.checkColor,
    required this.inactiveColor,
  });

  @override
  SelenicCheckboxColors copyWith({
    Color? activeColor,
    Color? borderColor,
    Color? checkColor,
    Color? inactiveColor,
  }) {
    return SelenicCheckboxColors(
      activeColor: activeColor ?? this.activeColor,
      borderColor: borderColor ?? this.borderColor,
      checkColor: checkColor ?? this.checkColor,
      inactiveColor: inactiveColor ?? this.inactiveColor,
    );
  }

  @override
  SelenicCheckboxColors lerp(
      ThemeExtension<SelenicCheckboxColors>? other, double t) {
    if (other is! SelenicCheckboxColors) return this;

    return SelenicCheckboxColors(
      activeColor: colorPremulLerp(activeColor, other.activeColor, t)!,
      borderColor: colorPremulLerp(borderColor, other.borderColor, t)!,
      checkColor: colorPremulLerp(checkColor, other.checkColor, t)!,
      inactiveColor: colorPremulLerp(inactiveColor, other.inactiveColor, t)!,
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty("type", "SelenicCheckboxColors"))
      ..add(ColorProperty("activeColor", activeColor))
      ..add(ColorProperty("borderColor", borderColor))
      ..add(ColorProperty("checkColor", checkColor))
      ..add(ColorProperty("inactiveColor", inactiveColor));
  }
}
