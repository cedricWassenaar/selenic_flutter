import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:selenic_design/src/theme/tab_bar/tab_bar_colors.dart';
import 'package:selenic_design/src/theme/tab_bar/tab_bar_properties.dart';
import 'package:selenic_design/src/theme/tab_bar/tab_bar_sizes.dart';
import 'package:selenic_design/src/theme/tokens/tokens.dart';

@immutable
class SelenicTabBarTheme extends ThemeExtension<SelenicTabBarTheme>
    with DiagnosticableTreeMixin {
  /// The tokens of the Selenic Design System.
  final SelenicTokens tokens;

  /// The colors of the SelenicTabBar.
  final SelenicTabBarColors colors;

  /// The properties of the SelenicTabBar.
  final SelenicTabBarProperties properties;

  /// The sizes of the SelenicTabBar.
  final SelenicTabBarSizes sizes;

  SelenicTabBarTheme({
    required this.tokens,
    SelenicTabBarColors? colors,
    SelenicTabBarProperties? properties,
    SelenicTabBarSizes? sizes,
  })  : colors = colors ??
            SelenicTabBarColors(
              indicatorColor: tokens.colors.piccolo,
              textColor: tokens.colors.textPrimary,
              selectedTextColor: tokens.colors.piccolo,
              selectedPillTextColor: tokens.colors.textPrimary,
              selectedPillTabColor: tokens.colors.goku,
            ),
        properties = properties ??
            SelenicTabBarProperties(
              gap: tokens.sizes.x5s,
              transitionDuration: tokens.transitions.defaultTransitionDuration,
              transitionCurve: tokens.transitions.defaultTransitionCurve,
            ),
        sizes = sizes ?? SelenicTabBarSizes(tokens: tokens);

  @override
  SelenicTabBarTheme copyWith({
    SelenicTokens? tokens,
    SelenicTabBarColors? colors,
    SelenicTabBarProperties? properties,
    SelenicTabBarSizes? sizes,
  }) {
    return SelenicTabBarTheme(
      tokens: tokens ?? this.tokens,
      colors: colors ?? this.colors,
      properties: properties ?? this.properties,
      sizes: sizes ?? this.sizes,
    );
  }

  @override
  SelenicTabBarTheme lerp(ThemeExtension<SelenicTabBarTheme>? other, double t) {
    if (other is! SelenicTabBarTheme) return this;

    return SelenicTabBarTheme(
      tokens: tokens.lerp(other.tokens, t),
      colors: colors.lerp(other.colors, t),
      properties: properties.lerp(other.properties, t),
      sizes: sizes.lerp(other.sizes, t),
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder diagnosticProperties) {
    super.debugFillProperties(diagnosticProperties);
    diagnosticProperties
      ..add(DiagnosticsProperty("type", "SelenicTabBarTheme"))
      ..add(DiagnosticsProperty<SelenicTokens>("tokens", tokens))
      ..add(DiagnosticsProperty<SelenicTabBarColors>("colors", colors))
      ..add(DiagnosticsProperty<SelenicTabBarProperties>(
          "properties", properties))
      ..add(DiagnosticsProperty<SelenicTabBarSizes>("sizes", sizes));
  }
}
