import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:selenic_design/src/utils/color_premul_lerp.dart';

@immutable
class SelenicTextInputColors extends ThemeExtension<SelenicTextInputColors>
    with DiagnosticableTreeMixin {
  /// The background color of the SelenicTextInput.
  final Color backgroundColor;

  /// The border color of the active or focused SelenicTextInput.
  final Color activeBorderColor;

  /// The border color of the inactive SelenicTextInput.
  final Color inactiveBorderColor;

  /// The color of the SelenicTextInput in error state.
  final Color errorColor;

  /// The border color of the SelenicTextInput on hover.
  final Color hoverBorderColor;

  /// The text color of the SelenicTextInput.
  final Color textColor;

  /// The text color of the SelenicTextInput helper and errorBuilder widgets.
  final Color helperTextColor;

  const SelenicTextInputColors({
    required this.backgroundColor,
    required this.activeBorderColor,
    required this.inactiveBorderColor,
    required this.errorColor,
    required this.hoverBorderColor,
    required this.textColor,
    required this.helperTextColor,
  });

  @override
  SelenicTextInputColors copyWith({
    Color? backgroundColor,
    Color? activeBorderColor,
    Color? inactiveBorderColor,
    Color? errorColor,
    Color? hoverBorderColor,
    Color? textColor,
    Color? helperTextColor,
  }) {
    return SelenicTextInputColors(
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
  SelenicTextInputColors lerp(
    ThemeExtension<SelenicTextInputColors>? other,
    double t,
  ) {
    if (other is! SelenicTextInputColors) return this;

    return SelenicTextInputColors(
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
      ..add(DiagnosticsProperty("type", "SelenicTextInputColors"))
      ..add(ColorProperty("backgroundColor", backgroundColor))
      ..add(ColorProperty("activeBorderColor", activeBorderColor))
      ..add(ColorProperty("inactiveBorderColor", inactiveBorderColor))
      ..add(ColorProperty("errorColor", errorColor))
      ..add(ColorProperty("hoverBorderColor", hoverBorderColor))
      ..add(ColorProperty("textColor", textColor))
      ..add(ColorProperty("helperTextColor", helperTextColor));
  }
}
