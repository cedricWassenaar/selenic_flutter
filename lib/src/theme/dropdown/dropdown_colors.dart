import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:selenic_design/src/utils/color_premul_lerp.dart';

@immutable
class SelenicDropdownColors extends ThemeExtension<SelenicDropdownColors>
    with DiagnosticableTreeMixin {
  /// The text color of the SelenicDropdown.
  final Color textColor;

  /// The icon color of the SelenicDropdown.
  final Color iconColor;

  /// The background color of the SelenicDropdown.
  final Color backgroundColor;

  const SelenicDropdownColors({
    required this.textColor,
    required this.iconColor,
    required this.backgroundColor,
  });

  @override
  SelenicDropdownColors copyWith({
    Color? textColor,
    Color? iconColor,
    Color? backgroundColor,
  }) {
    return SelenicDropdownColors(
      textColor: textColor ?? this.textColor,
      iconColor: iconColor ?? this.iconColor,
      backgroundColor: backgroundColor ?? this.backgroundColor,
    );
  }

  @override
  SelenicDropdownColors lerp(
      ThemeExtension<SelenicDropdownColors>? other, double t) {
    if (other is! SelenicDropdownColors) return this;

    return SelenicDropdownColors(
      textColor: colorPremulLerp(textColor, other.textColor, t)!,
      iconColor: colorPremulLerp(iconColor, other.iconColor, t)!,
      backgroundColor:
          colorPremulLerp(backgroundColor, other.backgroundColor, t)!,
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty("type", "SelenicDropdownColors"))
      ..add(ColorProperty("textColor", textColor))
      ..add(ColorProperty("iconColor", iconColor))
      ..add(ColorProperty("backgroundColor", backgroundColor));
  }
}
