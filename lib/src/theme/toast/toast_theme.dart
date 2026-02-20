import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:selenic_design/src/theme/toast/toast_colors.dart';
import 'package:selenic_design/src/theme/toast/toast_properties.dart';
import 'package:selenic_design/src/theme/toast/toast_shadows.dart';
import 'package:selenic_design/src/theme/tokens/tokens.dart';

@immutable
class SelenicToastTheme extends ThemeExtension<SelenicToastTheme>
    with DiagnosticableTreeMixin {
  /// The tokens of the Selenic Design System.
  final SelenicTokens tokens;

  /// The colors of the SelenicToast.
  final SelenicToastColors colors;

  /// The properties of the SelenicToast.
  final SelenicToastProperties properties;

  /// The shadows of the SelenicToast.
  final SelenicToastShadows shadows;

  SelenicToastTheme({
    required this.tokens,
    SelenicToastColors? colors,
    SelenicToastProperties? properties,
    SelenicToastShadows? shadows,
  })  : colors = colors ??
            SelenicToastColors(
              lightVariantBackgroundColor: tokens.colors.backgroundPrimary,
              darkVariantBackgroundColor:
                  tokens.complementaryColors.backgroundPrimary,
              lightVariantTextColor: tokens.colors.bodyTextPrimary,
              darkVariantTextColor: tokens.complementaryColors.bodyTextPrimary,
              lightVariantIconColor: tokens.colors.bodyTextPrimary,
              darkVariantIconColor: tokens.complementaryColors.bodyTextPrimary,
            ),
        properties = properties ??
            SelenicToastProperties(
              borderRadius: tokens.borders.surfaceSm,
              horizontalGap: tokens.sizes.x2s,
              verticalGap: tokens.sizes.x3s,
              displayDuration: const Duration(seconds: 3),
              transitionDuration: tokens.transitions.defaultTransitionDuration,
              transitionCurve: tokens.transitions.defaultTransitionCurve,
              contentPadding: EdgeInsets.all(tokens.sizes.x2s),
              textStyle: tokens.typography.body.textDefault,
            ),
        shadows =
            shadows ?? SelenicToastShadows(toastShadows: tokens.shadows.lg);

  @override
  SelenicToastTheme copyWith({
    SelenicTokens? tokens,
    SelenicToastColors? colors,
    SelenicToastProperties? properties,
    SelenicToastShadows? shadows,
  }) {
    return SelenicToastTheme(
      tokens: tokens ?? this.tokens,
      colors: colors ?? this.colors,
      properties: properties ?? this.properties,
      shadows: shadows ?? this.shadows,
    );
  }

  @override
  SelenicToastTheme lerp(ThemeExtension<SelenicToastTheme>? other, double t) {
    if (other is! SelenicToastTheme) return this;

    return SelenicToastTheme(
      tokens: tokens.lerp(other.tokens, t),
      colors: colors.lerp(other.colors, t),
      properties: properties.lerp(other.properties, t),
      shadows: shadows.lerp(other.shadows, t),
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder diagnosticProperties) {
    super.debugFillProperties(diagnosticProperties);
    diagnosticProperties
      ..add(DiagnosticsProperty("type", "SelenicToastTheme"))
      ..add(DiagnosticsProperty<SelenicTokens>("tokens", tokens))
      ..add(DiagnosticsProperty<SelenicToastColors>("colors", colors))
      ..add(
          DiagnosticsProperty<SelenicToastProperties>("properties", properties))
      ..add(DiagnosticsProperty<SelenicToastShadows>("shadows", shadows));
  }
}
