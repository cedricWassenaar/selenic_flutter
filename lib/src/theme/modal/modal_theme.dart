import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:selenic_design/src/theme/modal/modal_colors.dart';
import 'package:selenic_design/src/theme/modal/modal_properties.dart';
import 'package:selenic_design/src/theme/tokens/tokens.dart';

@immutable
class SelenicModalTheme extends ThemeExtension<SelenicModalTheme>
    with DiagnosticableTreeMixin {
  /// The tokens of the Selenic Design System.
  final SelenicTokens tokens;

  /// The colors of the SelenicModal.
  final SelenicModalColors colors;

  /// The properties of the SelenicModal.
  final SelenicModalProperties properties;

  SelenicModalTheme({
    required this.tokens,
    SelenicModalColors? colors,
    SelenicModalProperties? properties,
  })  : colors = colors ??
            SelenicModalColors(
              textColor: tokens.colors.textPrimary,
              iconColor: tokens.colors.iconPrimary,
              backgroundColor: tokens.colors.goku,
              barrierColor: tokens.colors.zeno,
            ),
        properties = properties ??
            SelenicModalProperties(
              borderRadius: tokens.borders.surfaceSm,
              transitionDuration: tokens.transitions.defaultTransitionDuration,
              transitionCurve: tokens.transitions.defaultTransitionCurve,
              textStyle: tokens.typography.body.textDefault,
            );

  @override
  SelenicModalTheme copyWith({
    SelenicTokens? tokens,
    SelenicModalColors? colors,
    SelenicModalProperties? properties,
  }) {
    return SelenicModalTheme(
      tokens: tokens ?? this.tokens,
      colors: colors ?? this.colors,
      properties: properties ?? this.properties,
    );
  }

  @override
  SelenicModalTheme lerp(ThemeExtension<SelenicModalTheme>? other, double t) {
    if (other is! SelenicModalTheme) return this;

    return SelenicModalTheme(
      tokens: tokens.lerp(other.tokens, t),
      colors: colors.lerp(other.colors, t),
      properties: properties.lerp(other.properties, t),
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder diagnosticProperties) {
    super.debugFillProperties(diagnosticProperties);
    diagnosticProperties
      ..add(DiagnosticsProperty("type", "SelenicModalTheme"))
      ..add(DiagnosticsProperty<SelenicTokens>("tokens", tokens))
      ..add(DiagnosticsProperty<SelenicModalColors>("colors", colors))
      ..add(DiagnosticsProperty<SelenicModalProperties>(
          "properties", properties));
  }
}
