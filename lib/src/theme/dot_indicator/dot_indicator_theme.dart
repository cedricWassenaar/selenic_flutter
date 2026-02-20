import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:selenic_design/src/theme/dot_indicator/dot_indicator_colors.dart';
import 'package:selenic_design/src/theme/dot_indicator/dot_indicator_properties.dart';
import 'package:selenic_design/src/theme/tokens/tokens.dart';

@immutable
class SelenicDotIndicatorTheme extends ThemeExtension<SelenicDotIndicatorTheme>
    with DiagnosticableTreeMixin {
  /// The tokens of the Selenic Design System.
  final SelenicTokens tokens;

  /// The colors of the SelenicDotIndicator.
  final SelenicDotIndicatorColors colors;

  /// The properties of the SelenicDotIndicator.
  final SelenicDotIndicatorProperties properties;

  SelenicDotIndicatorTheme({
    required this.tokens,
    SelenicDotIndicatorColors? colors,
    SelenicDotIndicatorProperties? properties,
  })  : colors = colors ??
            SelenicDotIndicatorColors(
              selectedColor: tokens.colors.accentPrimary,
              unselectedColor: tokens.colors.lineAccent,
            ),
        properties = properties ??
            SelenicDotIndicatorProperties(
              gap: tokens.sizes.x4s,
              size: tokens.sizes.x4s,
              transitionDuration: tokens.transitions.defaultTransitionDuration,
              transitionCurve: tokens.transitions.defaultTransitionCurve,
            );

  @override
  SelenicDotIndicatorTheme copyWith({
    SelenicTokens? tokens,
    SelenicDotIndicatorColors? colors,
    SelenicDotIndicatorProperties? properties,
  }) {
    return SelenicDotIndicatorTheme(
      tokens: tokens ?? this.tokens,
      colors: colors ?? this.colors,
      properties: properties ?? this.properties,
    );
  }

  @override
  SelenicDotIndicatorTheme lerp(
    ThemeExtension<SelenicDotIndicatorTheme>? other,
    double t,
  ) {
    if (other is! SelenicDotIndicatorTheme) return this;

    return SelenicDotIndicatorTheme(
      tokens: tokens.lerp(other.tokens, t),
      colors: colors.lerp(other.colors, t),
      properties: properties.lerp(other.properties, t),
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder diagnosticProperties) {
    super.debugFillProperties(diagnosticProperties);
    diagnosticProperties
      ..add(DiagnosticsProperty("type", "SelenicDotIndicatorTheme"))
      ..add(DiagnosticsProperty<SelenicTokens>("tokens", tokens))
      ..add(DiagnosticsProperty<SelenicDotIndicatorColors>("colors", colors))
      ..add(
        DiagnosticsProperty<SelenicDotIndicatorProperties>(
          "properties",
          properties,
        ),
      );
  }
}
