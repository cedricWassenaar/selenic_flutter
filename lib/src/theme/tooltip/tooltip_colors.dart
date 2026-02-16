import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:selenic_design/src/utils/color_premul_lerp.dart';

@immutable
class SelenicTooltipColors extends ThemeExtension<SelenicTooltipColors>
    with DiagnosticableTreeMixin {
  /// The text color of the SelenicTooltip.
  final Color textColor;

  /// The icon color of the SelenicTooltip.
  final Color iconColor;

  /// The background color of the SelenicTooltip.
  final Color backgroundColor;

  const SelenicTooltipColors({
    required this.textColor,
    required this.iconColor,
    required this.backgroundColor,
  });

  @override
  SelenicTooltipColors copyWith({
    Color? textColor,
    Color? iconColor,
    Color? backgroundColor,
  }) {
    return SelenicTooltipColors(
      textColor: textColor ?? this.textColor,
      iconColor: iconColor ?? this.iconColor,
      backgroundColor: backgroundColor ?? this.backgroundColor,
    );
  }

  @override
  SelenicTooltipColors lerp(
      ThemeExtension<SelenicTooltipColors>? other, double t) {
    if (other is! SelenicTooltipColors) return this;

    return SelenicTooltipColors(
      textColor: colorPremulLerp(textColor, other.textColor, t)!,
      iconColor: colorPremulLerp(iconColor, other.iconColor, t)!,
      backgroundColor: colorPremulLerp(
        backgroundColor,
        other.backgroundColor,
        t,
      )!,
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty("type", "SelenicTooltipColors"))
      ..add(ColorProperty("textColor", textColor))
      ..add(ColorProperty("iconColor", iconColor))
      ..add(ColorProperty("backgroundColor", backgroundColor));
  }
}
