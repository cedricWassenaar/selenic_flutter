import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:selenic_design/src/utils/color_premul_lerp.dart';

@immutable
class SelenicTextAreaColors extends ThemeExtension<SelenicTextAreaColors>
    with DiagnosticableTreeMixin {
  /// The background color of the SelenicTextArea.
  final Color backgroundColor;

  /// The border color of the active or focused SelenicTextArea.
  final Color activeBorderColor;

  /// The border color of the inactive SelenicTextArea.
  final Color inactiveBorderColor;

  /// The color of the SelenicTextArea in error state.
  final Color errorColor;

  /// The border color of the SelenicTextArea on hover.
  final Color hoverBorderColor;

  /// The text color of the SelenicTextArea.
  final Color textColor;

  /// The text color of the SelenicTextArea helper and errorBuilder widgets.
  final Color helperTextColor;

  const SelenicTextAreaColors({
    required this.backgroundColor,
    required this.activeBorderColor,
    required this.inactiveBorderColor,
    required this.errorColor,
    required this.hoverBorderColor,
    required this.textColor,
    required this.helperTextColor,
  });

  @override
  SelenicTextAreaColors copyWith({
    Color? backgroundColor,
    Color? activeBorderColor,
    Color? inactiveBorderColor,
    Color? errorColor,
    Color? hoverBorderColor,
    Color? textColor,
    Color? helperTextColor,
  }) {
    return SelenicTextAreaColors(
      backgroundColor: backgroundColor ?? this.backgroundColor,
      activeBorderColor: activeBorderColor ?? this.activeBorderColor,
      inactiveBorderColor: inactiveBorderColor ?? this.inactiveBorderColor,
      errorColor: errorColor ?? this.errorColor,
      hoverBorderColor: hoverBorderColor ?? this.hoverBorderColor,
      textColor: textColor ?? this.textColor,
      helperTextColor: helperTextColor ?? this.helperTextColor,
    );
  }

  @override
  SelenicTextAreaColors lerp(
      ThemeExtension<SelenicTextAreaColors>? other, double t) {
    if (other is! SelenicTextAreaColors) return this;

    return SelenicTextAreaColors(
      backgroundColor:
          colorPremulLerp(backgroundColor, other.backgroundColor, t)!,
      activeBorderColor:
          colorPremulLerp(activeBorderColor, other.activeBorderColor, t)!,
      inactiveBorderColor:
          colorPremulLerp(inactiveBorderColor, other.inactiveBorderColor, t)!,
      errorColor: colorPremulLerp(errorColor, other.errorColor, t)!,
      hoverBorderColor:
          colorPremulLerp(hoverBorderColor, other.hoverBorderColor, t)!,
      textColor: colorPremulLerp(textColor, other.textColor, t)!,
      helperTextColor:
          colorPremulLerp(helperTextColor, other.helperTextColor, t)!,
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty("type", "SelenicTextAreaColors"))
      ..add(ColorProperty("backgroundColor", backgroundColor))
      ..add(ColorProperty("activeBorderColor", activeBorderColor))
      ..add(ColorProperty("inactiveBorderColor", inactiveBorderColor))
      ..add(ColorProperty("errorColor", errorColor))
      ..add(ColorProperty("hoverBorderColor", hoverBorderColor))
      ..add(ColorProperty("textColor", textColor))
      ..add(ColorProperty("helperTextColor", helperTextColor));
  }
}
