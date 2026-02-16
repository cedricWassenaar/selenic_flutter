import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:selenic_design/src/utils/color_premul_lerp.dart';

@immutable
class SelenicSegmentedControlColors
    extends ThemeExtension<SelenicSegmentedControlColors>
    with DiagnosticableTreeMixin {
  /// The background color of the SelenicSegmentedControl.
  final Color backgroundColor;

  /// The color of the selected SelenicSegmentedControl segment.
  final Color selectedSegmentColor;

  /// The text color of the SelenicSegmentedControl segment.
  final Color textColor;

  /// The text color of the selected SelenicSegmentedControl segment.
  final Color selectedTextColor;

  const SelenicSegmentedControlColors({
    required this.backgroundColor,
    required this.selectedSegmentColor,
    required this.textColor,
    required this.selectedTextColor,
  });

  @override
  SelenicSegmentedControlColors copyWith({
    Color? backgroundColor,
    Color? selectedSegmentColor,
    Color? textColor,
    Color? selectedTextColor,
  }) {
    return SelenicSegmentedControlColors(
      backgroundColor: backgroundColor ?? this.backgroundColor,
      selectedSegmentColor: selectedSegmentColor ?? this.selectedSegmentColor,
      textColor: textColor ?? this.textColor,
      selectedTextColor: selectedTextColor ?? this.selectedTextColor,
    );
  }

  @override
  SelenicSegmentedControlColors lerp(
    ThemeExtension<SelenicSegmentedControlColors>? other,
    double t,
  ) {
    if (other is! SelenicSegmentedControlColors) return this;

    return SelenicSegmentedControlColors(
      backgroundColor:
          colorPremulLerp(backgroundColor, other.backgroundColor, t)!,
      selectedSegmentColor:
          colorPremulLerp(selectedSegmentColor, other.selectedSegmentColor, t)!,
      textColor: colorPremulLerp(textColor, other.textColor, t)!,
      selectedTextColor:
          colorPremulLerp(selectedTextColor, other.selectedTextColor, t)!,
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty("type", "SelenicSegmentedControlColors"))
      ..add(ColorProperty("backgroundColor", backgroundColor))
      ..add(ColorProperty("selectedSegmentColor", selectedSegmentColor))
      ..add(ColorProperty("textColor", textColor))
      ..add(ColorProperty("selectedTextColor", selectedTextColor));
  }
}
