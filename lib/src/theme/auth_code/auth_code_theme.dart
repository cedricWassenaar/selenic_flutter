import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:selenic_design/src/theme/auth_code/auth_code_colors.dart';
import 'package:selenic_design/src/theme/auth_code/auth_code_properties.dart';
import 'package:selenic_design/src/theme/tokens/tokens.dart';

@immutable
class SelenicAuthCodeTheme extends ThemeExtension<SelenicAuthCodeTheme>
    with DiagnosticableTreeMixin {
  /// The tokens of the Selenic Design System.
  final SelenicTokens tokens;

  /// The colors of the SelenicAuthCode.
  final SelenicAuthCodeColors colors;

  /// The properties of the SelenicAuthCode.
  final SelenicAuthCodeProperties properties;

  SelenicAuthCodeTheme({
    required this.tokens,
    SelenicAuthCodeColors? colors,
    SelenicAuthCodeProperties? properties,
  })  : colors = colors ??
            SelenicAuthCodeColors(
              selectedBorderColor: tokens.colors.accentPrimary,
              activeBorderColor: tokens.colors.lineAccent,
              inactiveBorderColor: tokens.colors.lineAccent,
              errorBorderColor: tokens.colors.error,
              selectedFillColor: tokens.colors.backgroundPrimary,
              activeFillColor: tokens.colors.backgroundPrimary,
              inactiveFillColor: tokens.colors.backgroundPrimary,
              textColor: tokens.colors.textPrimary,
            ),
        properties = properties ??
            SelenicAuthCodeProperties(
              borderRadius: tokens.borders.interactiveSm,
              gap: tokens.sizes.x4s,
              height: tokens.sizes.xl,
              width: tokens.sizes.lg,
              animationDuration: tokens.transitions.defaultTransitionDuration,
              errorAnimationDuration:
                  tokens.transitions.defaultTransitionDuration,
              peekDuration: tokens.transitions.defaultTransitionDuration,
              animationCurve: tokens.transitions.defaultTransitionCurve,
              errorAnimationCurve: tokens.transitions.defaultTransitionCurve,
              textStyle: tokens.typography.body.text24,
              errorTextStyle: tokens.typography.body.text12,
            );

  @override
  SelenicAuthCodeTheme copyWith({
    SelenicTokens? tokens,
    SelenicAuthCodeColors? colors,
    SelenicAuthCodeProperties? properties,
  }) {
    return SelenicAuthCodeTheme(
      tokens: tokens ?? this.tokens,
      colors: colors ?? this.colors,
      properties: properties ?? this.properties,
    );
  }

  @override
  SelenicAuthCodeTheme lerp(
      ThemeExtension<SelenicAuthCodeTheme>? other, double t) {
    if (other is! SelenicAuthCodeTheme) return this;

    return SelenicAuthCodeTheme(
      tokens: tokens.lerp(other.tokens, t),
      colors: colors.lerp(other.colors, t),
      properties: properties.lerp(other.properties, t),
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder diagnosticProperties) {
    super.debugFillProperties(diagnosticProperties);
    diagnosticProperties
      ..add(DiagnosticsProperty("type", "SelenicAuthCodeTheme"))
      ..add(DiagnosticsProperty<SelenicTokens>("tokens", tokens))
      ..add(DiagnosticsProperty<SelenicAuthCodeColors>("colors", colors))
      ..add(
        DiagnosticsProperty<SelenicAuthCodeProperties>(
            "properties", properties),
      );
  }
}
