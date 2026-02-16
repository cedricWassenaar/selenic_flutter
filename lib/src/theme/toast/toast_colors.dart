import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:selenic_design/src/utils/color_premul_lerp.dart';

@immutable
class SelenicToastColors extends ThemeExtension<SelenicToastColors>
    with DiagnosticableTreeMixin {
  /// The background color of the SelenicToast light variant.
  final Color lightVariantBackgroundColor;

  /// The background color of the SelenicToast dark variant.
  final Color darkVariantBackgroundColor;

  /// The text color of the SelenicToast light variant.
  final Color lightVariantTextColor;

  /// The text color of the SelenicToast dark variant.
  final Color darkVariantTextColor;

  /// The icon color of the SelenicToast light variant.
  final Color lightVariantIconColor;

  /// The icon color of the SelenicToast dark variant.
  final Color darkVariantIconColor;

  const SelenicToastColors({
    required this.lightVariantBackgroundColor,
    required this.darkVariantBackgroundColor,
    required this.lightVariantTextColor,
    required this.darkVariantTextColor,
    required this.lightVariantIconColor,
    required this.darkVariantIconColor,
  });

  @override
  SelenicToastColors copyWith({
    Color? lightVariantBackgroundColor,
    Color? darkVariantBackgroundColor,
    Color? lightVariantTextColor,
    Color? darkVariantTextColor,
    Color? lightVariantIconColor,
    Color? darkVariantIconColor,
  }) {
    return SelenicToastColors(
      lightVariantBackgroundColor:
          lightVariantBackgroundColor ?? this.lightVariantBackgroundColor,
      darkVariantBackgroundColor:
          darkVariantBackgroundColor ?? this.darkVariantBackgroundColor,
      lightVariantTextColor:
          lightVariantTextColor ?? this.lightVariantTextColor,
      darkVariantTextColor: darkVariantTextColor ?? this.darkVariantTextColor,
      lightVariantIconColor:
          lightVariantIconColor ?? this.lightVariantIconColor,
      darkVariantIconColor: darkVariantIconColor ?? this.darkVariantIconColor,
    );
  }

  @override
  SelenicToastColors lerp(ThemeExtension<SelenicToastColors>? other, double t) {
    if (other is! SelenicToastColors) return this;

    return SelenicToastColors(
      lightVariantBackgroundColor: colorPremulLerp(
        lightVariantBackgroundColor,
        other.lightVariantBackgroundColor,
        t,
      )!,
      darkVariantBackgroundColor: colorPremulLerp(
        darkVariantBackgroundColor,
        other.darkVariantBackgroundColor,
        t,
      )!,
      lightVariantTextColor: colorPremulLerp(
        lightVariantTextColor,
        other.lightVariantTextColor,
        t,
      )!,
      darkVariantTextColor: colorPremulLerp(
        darkVariantTextColor,
        other.darkVariantTextColor,
        t,
      )!,
      lightVariantIconColor: colorPremulLerp(
        lightVariantIconColor,
        other.lightVariantIconColor,
        t,
      )!,
      darkVariantIconColor: colorPremulLerp(
        darkVariantIconColor,
        other.darkVariantIconColor,
        t,
      )!,
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(
        DiagnosticsProperty(
          "type",
          "SelenicToastColors",
        ),
      )
      ..add(
        ColorProperty(
          "lightVariantBackgroundColor",
          lightVariantBackgroundColor,
        ),
      )
      ..add(
        ColorProperty(
          "darkVariantBackgroundColor",
          darkVariantBackgroundColor,
        ),
      )
      ..add(ColorProperty("lightVariantTextColor", lightVariantTextColor))
      ..add(ColorProperty("darkVariantTextColor", darkVariantTextColor))
      ..add(ColorProperty("lightVariantIconColor", lightVariantIconColor))
      ..add(ColorProperty("darkVariantIconColor", darkVariantIconColor));
  }
}
