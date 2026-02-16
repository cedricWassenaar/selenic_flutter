import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:selenic_design/src/theme/text_area/text_area_colors.dart';
import 'package:selenic_design/src/theme/text_area/text_area_properties.dart';
import 'package:selenic_design/src/theme/tokens/tokens.dart';

@immutable
class SelenicTextAreaTheme extends ThemeExtension<SelenicTextAreaTheme>
    with DiagnosticableTreeMixin {
  /// The tokens of the Selenic Design System.
  final SelenicTokens tokens;

  /// The colors of the SelenicTextArea.
  final SelenicTextAreaColors colors;

  /// The properties of the SelenicTextArea.
  final SelenicTextAreaProperties properties;

  SelenicTextAreaTheme({
    required this.tokens,
    SelenicTextAreaColors? colors,
    SelenicTextAreaProperties? properties,
  })  : colors = colors ??
            SelenicTextAreaColors(
              backgroundColor: tokens.colors.goku,
              activeBorderColor: tokens.colors.piccolo,
              inactiveBorderColor: tokens.colors.beerus,
              errorColor: tokens.colors.chichi,
              hoverBorderColor: tokens.colors.beerus,
              textColor: tokens.colors.textPrimary,
              helperTextColor: tokens.colors.trunks,
            ),
        properties = properties ??
            SelenicTextAreaProperties(
              borderRadius: tokens.borders.interactiveSm,
              transitionDuration: tokens.transitions.defaultTransitionDuration,
              transitionCurve: tokens.transitions.defaultTransitionCurve,
              helperPadding: EdgeInsets.only(top: tokens.sizes.x4s),
              textPadding: EdgeInsets.all(tokens.sizes.x2s),
              textStyle: tokens.typography.body.text16,
              helperTextStyle: tokens.typography.body.text12,
            );

  @override
  SelenicTextAreaTheme copyWith({
    SelenicTokens? tokens,
    SelenicTextAreaColors? colors,
    SelenicTextAreaProperties? properties,
  }) {
    return SelenicTextAreaTheme(
      tokens: tokens ?? this.tokens,
      colors: colors ?? this.colors,
      properties: properties ?? this.properties,
    );
  }

  @override
  SelenicTextAreaTheme lerp(
      ThemeExtension<SelenicTextAreaTheme>? other, double t) {
    if (other is! SelenicTextAreaTheme) return this;

    return SelenicTextAreaTheme(
      tokens: tokens.lerp(other.tokens, t),
      colors: colors.lerp(other.colors, t),
      properties: properties.lerp(other.properties, t),
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder diagnosticProperties) {
    super.debugFillProperties(diagnosticProperties);
    diagnosticProperties
      ..add(DiagnosticsProperty("type", "SelenicTextAreaTheme"))
      ..add(DiagnosticsProperty<SelenicTokens>("tokens", tokens))
      ..add(DiagnosticsProperty<SelenicTextAreaColors>("colors", colors))
      ..add(
        DiagnosticsProperty<SelenicTextAreaProperties>(
            "properties", properties),
      );
  }
}
