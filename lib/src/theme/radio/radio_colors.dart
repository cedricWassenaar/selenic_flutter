import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:selenic_design/src/utils/color_premul_lerp.dart';

@immutable
class SelenicRadioColors extends ThemeExtension<SelenicRadioColors>
    with DiagnosticableTreeMixin {
  /// The color of the selected SelenicRadio button.
  final Color activeColor;

  /// The background color of the unselected SelenicRadio button.
  final Color inactiveColor;

  const SelenicRadioColors({
    required this.activeColor,
    required this.inactiveColor,
  });

  @override
  SelenicRadioColors copyWith({Color? activeColor, Color? inactiveColor}) {
    return SelenicRadioColors(
      activeColor: activeColor ?? this.activeColor,
      inactiveColor: inactiveColor ?? this.inactiveColor,
    );
  }

  @override
  SelenicRadioColors lerp(ThemeExtension<SelenicRadioColors>? other, double t) {
    if (other is! SelenicRadioColors) return this;

    return SelenicRadioColors(
      activeColor: colorPremulLerp(activeColor, other.activeColor, t)!,
      inactiveColor: colorPremulLerp(inactiveColor, other.inactiveColor, t)!,
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty("type", "SelenicRadioColors"))
      ..add(ColorProperty("activeColor", activeColor))
      ..add(ColorProperty("inactiveColor", inactiveColor));
  }
}
