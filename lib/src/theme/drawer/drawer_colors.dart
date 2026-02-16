import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:selenic_design/src/utils/color_premul_lerp.dart';

@immutable
class SelenicDrawerColors extends ThemeExtension<SelenicDrawerColors>
    with DiagnosticableTreeMixin {
  /// The text color of the SelenicDrawer.
  final Color textColor;

  /// The icon color of the SelenicDrawer.
  final Color iconColor;

  /// The background color of the SelenicDrawer.
  final Color backgroundColor;

  const SelenicDrawerColors({
    required this.textColor,
    required this.iconColor,
    required this.backgroundColor,
  });

  @override
  SelenicDrawerColors copyWith({
    Color? textColor,
    Color? iconColor,
    Color? backgroundColor,
  }) {
    return SelenicDrawerColors(
      textColor: textColor ?? this.textColor,
      iconColor: iconColor ?? this.iconColor,
      backgroundColor: backgroundColor ?? this.backgroundColor,
    );
  }

  @override
  SelenicDrawerColors lerp(
      ThemeExtension<SelenicDrawerColors>? other, double t) {
    if (other is! SelenicDrawerColors) return this;

    return SelenicDrawerColors(
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
      ..add(DiagnosticsProperty("type", "SelenicDrawerColors"))
      ..add(ColorProperty("textColor", textColor))
      ..add(ColorProperty("iconColor", iconColor))
      ..add(ColorProperty("backgroundColor", backgroundColor));
  }
}
