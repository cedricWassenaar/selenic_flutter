import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:selenic_design/src/utils/color_premul_lerp.dart';

@immutable
class SelenicTabBarColors extends ThemeExtension<SelenicTabBarColors>
    with DiagnosticableTreeMixin {
  /// The color of the SelenicTabBar tab indicator.
  final Color indicatorColor;

  /// The text color of the SelenicTabBar.
  final Color textColor;

  /// The text color of the selected SelenicTabBar tab.
  final Color selectedTextColor;

  /// The text color of the selected SelenicTabBar pill tab.
  final Color selectedPillTextColor;

  /// The background color of the selected SelenicTabBar pill tab.
  final Color selectedPillTabColor;

  const SelenicTabBarColors({
    required this.indicatorColor,
    required this.textColor,
    required this.selectedTextColor,
    required this.selectedPillTextColor,
    required this.selectedPillTabColor,
  });

  @override
  SelenicTabBarColors copyWith({
    Color? indicatorColor,
    Color? textColor,
    Color? selectedTextColor,
    Color? selectedPillTextColor,
    Color? selectedPillTabColor,
  }) {
    return SelenicTabBarColors(
      indicatorColor: indicatorColor ?? this.indicatorColor,
      textColor: textColor ?? this.textColor,
      selectedTextColor: selectedTextColor ?? this.selectedTextColor,
      selectedPillTextColor:
          selectedPillTextColor ?? this.selectedPillTextColor,
      selectedPillTabColor: selectedPillTabColor ?? this.selectedPillTabColor,
    );
  }

  @override
  SelenicTabBarColors lerp(
      ThemeExtension<SelenicTabBarColors>? other, double t) {
    if (other is! SelenicTabBarColors) return this;

    return SelenicTabBarColors(
      indicatorColor: colorPremulLerp(indicatorColor, other.indicatorColor, t)!,
      textColor: colorPremulLerp(textColor, other.textColor, t)!,
      selectedTextColor:
          colorPremulLerp(selectedTextColor, other.selectedTextColor, t)!,
      selectedPillTextColor: colorPremulLerp(
        selectedPillTextColor,
        other.selectedPillTextColor,
        t,
      )!,
      selectedPillTabColor:
          colorPremulLerp(selectedPillTabColor, other.selectedPillTabColor, t)!,
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty("type", "SelenicTabBarColors"))
      ..add(ColorProperty("indicatorColor", indicatorColor))
      ..add(ColorProperty("textColor", textColor))
      ..add(ColorProperty("selectedTextColor", selectedTextColor))
      ..add(ColorProperty("selectedPillTextColor", selectedPillTextColor))
      ..add(ColorProperty("selectedPillTabColor", selectedPillTabColor));
  }
}
