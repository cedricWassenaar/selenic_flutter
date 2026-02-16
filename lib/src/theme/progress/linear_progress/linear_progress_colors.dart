import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:selenic_design/src/utils/color_premul_lerp.dart';

@immutable
class SelenicLinearProgressColors
    extends ThemeExtension<SelenicLinearProgressColors>
    with DiagnosticableTreeMixin {
  /// The color of the SelenicLinearProgress.
  final Color color;

  /// The text color of the SelenicLinearProgress.
  final Color textColor;

  /// The background color of the SelenicLinearProgress.
  final Color backgroundColor;

  const SelenicLinearProgressColors({
    required this.color,
    required this.textColor,
    required this.backgroundColor,
  });

  @override
  SelenicLinearProgressColors copyWith({
    Color? color,
    Color? textColor,
    Color? backgroundColor,
  }) {
    return SelenicLinearProgressColors(
      color: color ?? this.color,
      textColor: textColor ?? this.textColor,
      backgroundColor: backgroundColor ?? this.backgroundColor,
    );
  }

  @override
  SelenicLinearProgressColors lerp(
    ThemeExtension<SelenicLinearProgressColors>? other,
    double t,
  ) {
    if (other is! SelenicLinearProgressColors) return this;

    return SelenicLinearProgressColors(
      color: colorPremulLerp(color, other.color, t)!,
      textColor: colorPremulLerp(textColor, other.textColor, t)!,
      backgroundColor:
          colorPremulLerp(backgroundColor, other.backgroundColor, t)!,
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty("type", "SelenicLinearProgressColors"))
      ..add(ColorProperty("color", color))
      ..add(ColorProperty("textColor", textColor))
      ..add(ColorProperty("backgroundColor", backgroundColor));
  }
}
