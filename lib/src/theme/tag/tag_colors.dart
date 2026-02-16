import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:selenic_design/src/utils/color_premul_lerp.dart';

@immutable
class SelenicTagColors extends ThemeExtension<SelenicTagColors>
    with DiagnosticableTreeMixin {
  /// The text color of the SelenicTag.
  final Color textColor;

  /// The icon color of the SelenicTag.
  final Color iconColor;

  /// The background color of the SelenicTag.
  final Color backgroundColor;

  const SelenicTagColors({
    required this.textColor,
    required this.iconColor,
    required this.backgroundColor,
  });

  @override
  SelenicTagColors copyWith({
    Color? textColor,
    Color? iconColor,
    Color? backgroundColor,
  }) {
    return SelenicTagColors(
      textColor: textColor ?? this.textColor,
      iconColor: iconColor ?? this.iconColor,
      backgroundColor: backgroundColor ?? this.backgroundColor,
    );
  }

  @override
  SelenicTagColors lerp(ThemeExtension<SelenicTagColors>? other, double t) {
    if (other is! SelenicTagColors) return this;

    return SelenicTagColors(
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
      ..add(DiagnosticsProperty("type", "SelenicTagColors"))
      ..add(ColorProperty("textColor", textColor))
      ..add(ColorProperty("iconColor", iconColor))
      ..add(ColorProperty("backgroundColor", backgroundColor));
  }
}
