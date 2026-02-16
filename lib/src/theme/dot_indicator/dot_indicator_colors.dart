import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:selenic_design/src/utils/color_premul_lerp.dart';

@immutable
class SelenicDotIndicatorColors
    extends ThemeExtension<SelenicDotIndicatorColors>
    with DiagnosticableTreeMixin {
  /// The color of the selected SelenicDotIndicator dot.
  final Color selectedColor;

  /// The color of the unselected SelenicDotIndicator dot.
  final Color unselectedColor;

  const SelenicDotIndicatorColors({
    required this.selectedColor,
    required this.unselectedColor,
  });

  @override
  SelenicDotIndicatorColors copyWith({
    Color? selectedColor,
    Color? unselectedColor,
  }) {
    return SelenicDotIndicatorColors(
      selectedColor: selectedColor ?? this.selectedColor,
      unselectedColor: unselectedColor ?? this.unselectedColor,
    );
  }

  @override
  SelenicDotIndicatorColors lerp(
    ThemeExtension<SelenicDotIndicatorColors>? other,
    double t,
  ) {
    if (other is! SelenicDotIndicatorColors) return this;

    return SelenicDotIndicatorColors(
      selectedColor: colorPremulLerp(selectedColor, other.selectedColor, t)!,
      unselectedColor: colorPremulLerp(
        unselectedColor,
        other.unselectedColor,
        t,
      )!,
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty("type", "SelenicDotIndicatorColors"))
      ..add(ColorProperty("selectedColor", selectedColor))
      ..add(ColorProperty("unselectedColor", unselectedColor));
  }
}
