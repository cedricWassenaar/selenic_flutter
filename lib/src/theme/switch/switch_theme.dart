import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:selenic_design/src/theme/switch/switch_colors.dart';
import 'package:selenic_design/src/theme/switch/switch_properties.dart';
import 'package:selenic_design/src/theme/switch/switch_shadows.dart';
import 'package:selenic_design/src/theme/switch/switch_sizes.dart';
import 'package:selenic_design/src/theme/tokens/tokens.dart';

@immutable
class SelenicSwitchTheme extends ThemeExtension<SelenicSwitchTheme>
    with DiagnosticableTreeMixin {
  /// The tokens of the Selenic Design System.
  final SelenicTokens tokens;

  /// The colors of the SelenicSwitch.
  final SelenicSwitchColors colors;

  /// The properties of the SelenicSwitch.
  final SelenicSwitchProperties properties;

  /// The shadows of the SelenicSwitch.
  final SelenicSwitchShadows shadows;

  /// The sizes of the SelenicSwitch.
  final SelenicSwitchSizes sizes;

  SelenicSwitchTheme({
    required this.tokens,
    SelenicSwitchColors? colors,
    SelenicSwitchProperties? properties,
    SelenicSwitchShadows? shadows,
    SelenicSwitchSizes? sizes,
  })  : colors = colors ??
            SelenicSwitchColors(
              activeTrackColor: tokens.colors.piccolo,
              inactiveTrackColor: tokens.colors.beerus,
              activeTextColor: tokens.colors.goten,
              inactiveTextColor: tokens.colors.bulma,
              activeIconColor: tokens.colors.goten,
              inactiveIconColor: tokens.colors.bulma,
              thumbIconColor: tokens.colors.popo,
              thumbColor: tokens.colors.goten,
            ),
        properties = properties ??
            SelenicSwitchProperties(
              transitionDuration: tokens.transitions.defaultTransitionDuration,
              transitionCurve: tokens.transitions.defaultTransitionCurve,
            ),
        shadows = shadows ??
            SelenicSwitchShadows(
              thumbShadows: tokens.shadows.sm,
            ),
        sizes = sizes ?? SelenicSwitchSizes(tokens: tokens);

  @override
  SelenicSwitchTheme copyWith({
    SelenicTokens? tokens,
    SelenicSwitchColors? colors,
    SelenicSwitchProperties? properties,
    SelenicSwitchShadows? shadows,
    SelenicSwitchSizes? sizes,
  }) {
    return SelenicSwitchTheme(
      tokens: tokens ?? this.tokens,
      colors: colors ?? this.colors,
      properties: properties ?? this.properties,
      shadows: shadows ?? this.shadows,
      sizes: sizes ?? this.sizes,
    );
  }

  @override
  SelenicSwitchTheme lerp(ThemeExtension<SelenicSwitchTheme>? other, double t) {
    if (other is! SelenicSwitchTheme) return this;

    return SelenicSwitchTheme(
      tokens: tokens.lerp(other.tokens, t),
      colors: colors.lerp(other.colors, t),
      properties: properties.lerp(other.properties, t),
      shadows: shadows.lerp(other.shadows, t),
      sizes: sizes.lerp(other.sizes, t),
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder diagnosticProperties) {
    super.debugFillProperties(diagnosticProperties);
    diagnosticProperties
      ..add(DiagnosticsProperty("type", "SelenicSwitchTheme"))
      ..add(DiagnosticsProperty<SelenicTokens>("tokens", tokens))
      ..add(DiagnosticsProperty<SelenicSwitchColors>("colors", colors))
      ..add(DiagnosticsProperty<SelenicSwitchProperties>(
          "properties", properties))
      ..add(DiagnosticsProperty<SelenicSwitchShadows>("shadows", shadows))
      ..add(DiagnosticsProperty<SelenicSwitchSizes>("sizes", sizes));
  }
}
