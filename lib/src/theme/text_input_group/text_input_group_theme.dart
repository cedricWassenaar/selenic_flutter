import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:selenic_design/src/theme/text_input_group/text_input_group_colors.dart';
import 'package:selenic_design/src/theme/text_input_group/text_input_group_properties.dart';
import 'package:selenic_design/src/theme/tokens/tokens.dart';

@immutable
class SelenicTextInputGroupTheme
    extends ThemeExtension<SelenicTextInputGroupTheme>
    with DiagnosticableTreeMixin {
  /// The tokens of the Selenic Design System.
  final SelenicTokens tokens;

  /// The colors of the SelenicTextInputGroup.
  final SelenicTextInputGroupColors colors;

  /// The properties of the SelenicTextInputGroup.
  final SelenicTextInputGroupProperties properties;

  SelenicTextInputGroupTheme({
    required this.tokens,
    SelenicTextInputGroupColors? colors,
    SelenicTextInputGroupProperties? properties,
  })  : colors = colors ??
            SelenicTextInputGroupColors(
              backgroundColor: tokens.colors.backgroundPrimary,
              errorColor: tokens.colors.error,
              helperTextColor: tokens.colors.bodyTextSecondary,
              borderColor: tokens.colors.lineAccent,
              hoverBorderColor: tokens.colors.lineAccent,
            ),
        properties = properties ??
            SelenicTextInputGroupProperties(
              borderRadius: tokens.borders.interactiveSm,
              transitionDuration: tokens.transitions.defaultTransitionDuration,
              transitionCurve: tokens.transitions.defaultTransitionCurve,
              helperPadding: EdgeInsets.only(top: tokens.sizes.x4s),
              textPadding: EdgeInsets.all(tokens.sizes.x2s),
              textStyle: tokens.typography.body.text16,
              helperTextStyle: tokens.typography.body.text12,
            );

  @override
  SelenicTextInputGroupTheme copyWith({
    SelenicTokens? tokens,
    SelenicTextInputGroupColors? colors,
    SelenicTextInputGroupProperties? properties,
  }) {
    return SelenicTextInputGroupTheme(
      tokens: tokens ?? this.tokens,
      colors: colors ?? this.colors,
      properties: properties ?? this.properties,
    );
  }

  @override
  SelenicTextInputGroupTheme lerp(
    ThemeExtension<SelenicTextInputGroupTheme>? other,
    double t,
  ) {
    if (other is! SelenicTextInputGroupTheme) return this;

    return SelenicTextInputGroupTheme(
      tokens: tokens.lerp(other.tokens, t),
      colors: colors.lerp(other.colors, t),
      properties: properties.lerp(other.properties, t),
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder diagnosticProperties) {
    super.debugFillProperties(diagnosticProperties);
    diagnosticProperties
      ..add(DiagnosticsProperty("type", "SelenicTextInputGroupTheme"))
      ..add(DiagnosticsProperty<SelenicTokens>("tokens", tokens))
      ..add(DiagnosticsProperty<SelenicTextInputGroupColors>("colors", colors))
      ..add(
        DiagnosticsProperty<SelenicTextInputGroupProperties>(
          "properties",
          properties,
        ),
      );
  }
}
