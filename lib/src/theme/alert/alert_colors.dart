import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:selenic_design/src/utils/color_premul_lerp.dart';

@immutable
class SelenicAlertColors extends ThemeExtension<SelenicAlertColors>
    with DiagnosticableTreeMixin {
  /// The background color of the SelenicAlert.
  final Color backgroundColor;

  /// The border color of the SelenicAlert.
  final Color borderColor;

  /// The icon color of the SelenicAlert.
  final Color iconColor;

  /// The text color of the SelenicAlert.
  final Color textColor;

  const SelenicAlertColors({
    required this.backgroundColor,
    required this.borderColor,
    required this.iconColor,
    required this.textColor,
  });

  @override
  SelenicAlertColors copyWith({
    Color? backgroundColor,
    Color? borderColor,
    Color? iconColor,
    Color? textColor,
  }) {
    return SelenicAlertColors(
      backgroundColor: backgroundColor ?? this.backgroundColor,
      borderColor: borderColor ?? this.borderColor,
      iconColor: iconColor ?? this.iconColor,
      textColor: textColor ?? this.textColor,
    );
  }

  @override
  SelenicAlertColors lerp(ThemeExtension<SelenicAlertColors>? other, double t) {
    if (other is! SelenicAlertColors) return this;

    return SelenicAlertColors(
      backgroundColor:
          colorPremulLerp(backgroundColor, other.backgroundColor, t)!,
      borderColor: colorPremulLerp(borderColor, other.borderColor, t)!,
      iconColor: colorPremulLerp(iconColor, other.iconColor, t)!,
      textColor: colorPremulLerp(textColor, other.textColor, t)!,
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty("type", "SelenicAlertColors"))
      ..add(ColorProperty("backgroundColor", backgroundColor))
      ..add(ColorProperty("borderColor", borderColor))
      ..add(ColorProperty("iconColor", iconColor))
      ..add(ColorProperty("textColor", textColor));
  }
}
