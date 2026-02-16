import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:selenic_design/src/theme/drawer/drawer_colors.dart';
import 'package:selenic_design/src/theme/drawer/drawer_properties.dart';
import 'package:selenic_design/src/theme/drawer/drawer_shadows.dart';
import 'package:selenic_design/src/theme/tokens/tokens.dart';

@immutable
class SelenicDrawerTheme extends ThemeExtension<SelenicDrawerTheme>
    with DiagnosticableTreeMixin {
  /// The tokens of the Selenic Design System.
  final SelenicTokens tokens;

  /// The colors of the SelenicDrawer.
  final SelenicDrawerColors colors;

  /// The properties of the SelenicDrawer.
  final SelenicDrawerProperties properties;

  /// The shadows of the SelenicDrawer.
  final SelenicDrawerShadows shadows;

  SelenicDrawerTheme({
    required this.tokens,
    SelenicDrawerColors? colors,
    SelenicDrawerProperties? properties,
    SelenicDrawerShadows? shadows,
  })  : colors = colors ??
            SelenicDrawerColors(
              textColor: tokens.colors.textPrimary,
              iconColor: tokens.colors.iconPrimary,
              backgroundColor: tokens.colors.goku,
            ),
        properties = properties ??
            SelenicDrawerProperties(
              borderRadius: BorderRadius.zero,
              width: 448,
              textStyle: tokens.typography.body.textDefault,
            ),
        shadows =
            shadows ?? SelenicDrawerShadows(drawerShadows: tokens.shadows.lg);

  @override
  SelenicDrawerTheme copyWith({
    SelenicTokens? tokens,
    SelenicDrawerColors? colors,
    SelenicDrawerProperties? properties,
    SelenicDrawerShadows? shadows,
  }) {
    return SelenicDrawerTheme(
      tokens: tokens ?? this.tokens,
      colors: colors ?? this.colors,
      properties: properties ?? this.properties,
      shadows: shadows ?? this.shadows,
    );
  }

  @override
  SelenicDrawerTheme lerp(ThemeExtension<SelenicDrawerTheme>? other, double t) {
    if (other is! SelenicDrawerTheme) return this;

    return SelenicDrawerTheme(
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
      ..add(DiagnosticsProperty("type", "SelenicDrawerTheme"))
      ..add(DiagnosticsProperty<SelenicTokens>("tokens", tokens))
      ..add(DiagnosticsProperty<SelenicDrawerColors>("colors", colors))
      ..add(DiagnosticsProperty<SelenicDrawerProperties>(
          "properties", properties))
      ..add(DiagnosticsProperty<SelenicDrawerShadows>("shadows", shadows));
  }
}
