import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:selenic_design/src/utils/color_premul_lerp.dart';

@immutable
class SelenicProgressPinColors extends ThemeExtension<SelenicProgressPinColors>
    with DiagnosticableTreeMixin {
  /// The color of the SelenicProgressPin.
  final Color pinColor;

  /// The border color of the SelenicProgressPin.
  final Color pinBorderColor;

  /// The color of the SelenicProgressPin thumb.
  final Color thumbColor;

  /// The shadow color of the SelenicProgressPin.
  final Color shadowColor;

  /// The text color of the SelenicProgressPin.
  final Color textColor;

  const SelenicProgressPinColors({
    required this.pinColor,
    required this.pinBorderColor,
    required this.thumbColor,
    required this.shadowColor,
    required this.textColor,
  });

  @override
  SelenicProgressPinColors copyWith({
    Color? pinColor,
    Color? pinBorderColor,
    Color? thumbColor,
    Color? shadowColor,
    Color? textColor,
  }) {
    return SelenicProgressPinColors(
      pinColor: pinColor ?? this.pinColor,
      pinBorderColor: pinBorderColor ?? this.pinBorderColor,
      thumbColor: thumbColor ?? this.thumbColor,
      shadowColor: shadowColor ?? this.shadowColor,
      textColor: textColor ?? this.textColor,
    );
  }

  @override
  SelenicProgressPinColors lerp(
    ThemeExtension<SelenicProgressPinColors>? other,
    double t,
  ) {
    if (other is! SelenicProgressPinColors) return this;

    return SelenicProgressPinColors(
      pinColor: colorPremulLerp(pinColor, other.pinColor, t)!,
      pinBorderColor: colorPremulLerp(pinBorderColor, other.pinBorderColor, t)!,
      thumbColor: colorPremulLerp(thumbColor, other.thumbColor, t)!,
      shadowColor: colorPremulLerp(shadowColor, other.shadowColor, t)!,
      textColor: colorPremulLerp(textColor, other.textColor, t)!,
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty("type", "SelenicProgressPinColors"))
      ..add(ColorProperty("pinColor", pinColor))
      ..add(ColorProperty("pinBorderColor", pinBorderColor))
      ..add(ColorProperty("thumbColor", thumbColor))
      ..add(ColorProperty("shadowColor", shadowColor))
      ..add(ColorProperty("textColor", textColor));
  }
}
