import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:selenic_design/src/theme/alert/alert_colors.dart';
import 'package:selenic_design/src/theme/alert/alert_properties.dart';
import 'package:selenic_design/src/theme/tokens/tokens.dart';

@immutable
class SelenicAlertTheme extends ThemeExtension<SelenicAlertTheme>
    with DiagnosticableTreeMixin {
  /// The tokens of the Selenic Design System.
  final SelenicTokens tokens;

  /// The colors of the SelenicAlert.
  final SelenicAlertColors colors;

  /// The properties of the SelenicAlert.
  final SelenicAlertProperties properties;

  SelenicAlertTheme({
    required this.tokens,
    SelenicAlertColors? colors,
    SelenicAlertProperties? properties,
  })  : colors = colors ??
            SelenicAlertColors(
              backgroundColor: tokens.colors.backgroundPrimary,
              borderColor: tokens.colors.textSecondary,
              iconColor: tokens.colors.iconPrimary,
              textColor: tokens.colors.textPrimary,
            ),
        properties = properties ??
            SelenicAlertProperties(
              borderRadius: tokens.borders.interactiveSm,
              horizontalGap: tokens.sizes.x3s,
              minimumHeight: tokens.sizes.xl,
              verticalGap: tokens.sizes.x4s,
              transitionDuration: tokens.transitions.defaultTransitionDuration,
              transitionCurve: tokens.transitions.defaultTransitionCurve,
              padding: EdgeInsets.all(tokens.sizes.x2s),
              contentTextStyle: tokens.typography.body.textDefault,
              labelTextStyle: tokens.typography.heading.textDefault,
            );

  @override
  SelenicAlertTheme copyWith({
    SelenicTokens? tokens,
    SelenicAlertColors? colors,
    SelenicAlertProperties? properties,
  }) {
    return SelenicAlertTheme(
      tokens: tokens ?? this.tokens,
      colors: colors ?? this.colors,
      properties: properties ?? this.properties,
    );
  }

  @override
  SelenicAlertTheme lerp(ThemeExtension<SelenicAlertTheme>? other, double t) {
    if (other is! SelenicAlertTheme) return this;

    return SelenicAlertTheme(
      tokens: tokens.lerp(other.tokens, t),
      colors: colors.lerp(other.colors, t),
      properties: properties.lerp(other.properties, t),
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder diagnosticProperties) {
    super.debugFillProperties(diagnosticProperties);
    diagnosticProperties
      ..add(DiagnosticsProperty("type", "SelenicAlertTheme"))
      ..add(DiagnosticsProperty<SelenicTokens>("tokens", tokens))
      ..add(DiagnosticsProperty<SelenicAlertColors>("colors", colors))
      ..add(DiagnosticsProperty<SelenicAlertProperties>(
          "properties", properties));
  }
}
