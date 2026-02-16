import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:selenic_design/src/utils/color_premul_lerp.dart';

@immutable
class SelenicButtonColors extends ThemeExtension<SelenicButtonColors>
    with DiagnosticableTreeMixin {
  /// The border color of the SelenicButton.
  final Color borderColor;

  /// The text color of the SelenicButton.
  final Color textColor;

  /// The background color of the SelenicButton filled variant.
  final Color filledVariantBackgroundColor;

  /// The text color of the SelenicButton filled variant.
  final Color filledVariantTextColor;

  /// The focus effect color of the SelenicButton text variant.
  final Color textVariantFocusColor;

  /// The hover effect color of the SelenicButton text variant.
  final Color textVariantHoverColor;

  /// The text color of the SelenicButton text variant.
  final Color textVariantTextColor;

  const SelenicButtonColors({
    required this.borderColor,
    required this.textColor,
    required this.filledVariantBackgroundColor,
    required this.filledVariantTextColor,
    required this.textVariantFocusColor,
    required this.textVariantHoverColor,
    required this.textVariantTextColor,
  });

  @override
  SelenicButtonColors copyWith({
    Color? borderColor,
    Color? textColor,
    Color? filledVariantBackgroundColor,
    Color? filledVariantTextColor,
    Color? textVariantFocusColor,
    Color? textVariantHoverColor,
    Color? textVariantTextColor,
  }) {
    return SelenicButtonColors(
      borderColor: borderColor ?? this.borderColor,
      textColor: textColor ?? this.textColor,
      filledVariantBackgroundColor:
          filledVariantBackgroundColor ?? this.filledVariantBackgroundColor,
      filledVariantTextColor:
          filledVariantTextColor ?? this.filledVariantTextColor,
      textVariantFocusColor:
          textVariantFocusColor ?? this.textVariantFocusColor,
      textVariantHoverColor:
          textVariantHoverColor ?? this.textVariantHoverColor,
      textVariantTextColor: textVariantTextColor ?? this.textVariantTextColor,
    );
  }

  @override
  SelenicButtonColors lerp(
      ThemeExtension<SelenicButtonColors>? other, double t) {
    if (other is! SelenicButtonColors) return this;

    return SelenicButtonColors(
      borderColor: colorPremulLerp(borderColor, other.borderColor, t)!,
      textColor: colorPremulLerp(textColor, other.textColor, t)!,
      filledVariantBackgroundColor: colorPremulLerp(
        filledVariantBackgroundColor,
        other.filledVariantBackgroundColor,
        t,
      )!,
      filledVariantTextColor: colorPremulLerp(
        filledVariantTextColor,
        other.filledVariantTextColor,
        t,
      )!,
      textVariantFocusColor: colorPremulLerp(
        textVariantFocusColor,
        other.textVariantFocusColor,
        t,
      )!,
      textVariantHoverColor: colorPremulLerp(
        textVariantHoverColor,
        other.textVariantHoverColor,
        t,
      )!,
      textVariantTextColor:
          colorPremulLerp(textVariantTextColor, other.textVariantTextColor, t)!,
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(
        DiagnosticsProperty(
          "type",
          "SelenicButtonColors",
        ),
      )
      ..add(
        ColorProperty(
          "borderColor",
          borderColor,
        ),
      )
      ..add(
        ColorProperty(
          "textColor",
          textColor,
        ),
      )
      ..add(
        ColorProperty(
          "filledVariantBackgroundColor",
          filledVariantBackgroundColor,
        ),
      )
      ..add(ColorProperty("filledVariantTextColor", filledVariantTextColor))
      ..add(ColorProperty("textVariantFocusColor", textVariantFocusColor))
      ..add(ColorProperty("textVariantHoverColor", textVariantHoverColor))
      ..add(ColorProperty("textVariantTextColor", textVariantTextColor));
  }
}
