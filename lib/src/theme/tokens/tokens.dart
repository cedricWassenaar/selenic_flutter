import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:moon_tokens/moon_tokens.dart';

import 'package:selenic_design/src/theme/tokens/borders.dart';
import 'package:selenic_design/src/theme/tokens/opacities.dart';
import 'package:selenic_design/src/theme/tokens/shadows.dart';
import 'package:selenic_design/src/theme/tokens/sizes.dart';
import 'package:selenic_design/src/theme/tokens/transitions.dart';
import 'package:selenic_design/src/theme/tokens/typography/typography.dart';

@immutable
class SelenicTokens extends ThemeExtension<SelenicTokens>
    with DiagnosticableTreeMixin {
  static const light = SelenicTokens(
    borders: SelenicBorders.borders,
    colors: MoonColors.light,
    complementaryColors: MoonColors.dark,
    opacities: SelenicOpacities.opacities,
    shadows: SelenicShadows.light,
    sizes: SelenicSizes.sizes,
    transitions: SelenicTransitions.transitions,
    typography: SelenicTypography.typography,
  );

  static const dark = SelenicTokens(
    borders: SelenicBorders.borders,
    colors: MoonColors.dark,
    complementaryColors: MoonColors.light,
    opacities: SelenicOpacities.opacities,
    shadows: SelenicShadows.dark,
    sizes: SelenicSizes.sizes,
    transitions: SelenicTransitions.transitions,
    typography: SelenicTypography.typography,
  );

  /// The borders of the Selenic Design System.
  final SelenicBorders borders;

  /// The colors of the Selenic Design System.
  final MoonColors colors;

  /// The colors of the Selenic Design System that are from complementary theme
  /// (light -> dark, dark -> light).
  final MoonColors complementaryColors;

  /// The opacities of the Selenic Design System.
  final SelenicOpacities opacities;

  /// The shadows of the Selenic Design System.
  final SelenicShadows shadows;

  /// The sizes of the Selenic Design System.
  final SelenicSizes sizes;

  final SelenicTransitions transitions;

  /// The typography of the Selenic Design System.
  final SelenicTypography typography;

  const SelenicTokens({
    required this.borders,
    required this.colors,
    required this.complementaryColors,
    required this.opacities,
    required this.shadows,
    required this.sizes,
    required this.transitions,
    required this.typography,
  });

  @override
  SelenicTokens copyWith({
    SelenicBorders? borders,
    MoonColors? colors,
    MoonColors? complementaryColors,
    SelenicOpacities? opacities,
    SelenicShadows? shadows,
    SelenicSizes? sizes,
    SelenicTransitions? transitions,
    SelenicTypography? typography,
  }) {
    return SelenicTokens(
      borders: borders ?? this.borders,
      colors: colors ?? this.colors,
      complementaryColors: complementaryColors ?? this.complementaryColors,
      opacities: opacities ?? this.opacities,
      shadows: shadows ?? this.shadows,
      sizes: sizes ?? this.sizes,
      transitions: transitions ?? this.transitions,
      typography: typography ?? this.typography,
    );
  }

  @override
  SelenicTokens lerp(ThemeExtension<SelenicTokens>? other, double t) {
    if (other is! SelenicTokens) return this;

    return SelenicTokens(
      borders: borders.lerp(other.borders, t),
      colors: colors.lerp(other.colors, t),
      complementaryColors:
          complementaryColors.lerp(other.complementaryColors, t),
      opacities: opacities.lerp(other.opacities, t),
      shadows: shadows.lerp(other.shadows, t),
      sizes: sizes.lerp(other.sizes, t),
      transitions: transitions.lerp(other.transitions, t),
      typography: typography.lerp(other.typography, t),
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty("type", "SelenicTokens"))
      ..add(DiagnosticsProperty<SelenicBorders>("SelenicBorders", borders))
      ..add(DiagnosticsProperty<MoonColors>("MoonColors", colors))
      ..add(DiagnosticsProperty<MoonColors>("MoonColors", complementaryColors))
      ..add(
          DiagnosticsProperty<SelenicOpacities>("SelenicOpacities", opacities))
      ..add(DiagnosticsProperty<SelenicShadows>("SelenicShadows", shadows))
      ..add(DiagnosticsProperty<SelenicSizes>("SelenicSizes", sizes))
      ..add(
        DiagnosticsProperty<SelenicTransitions>(
          "SelenicTransitions",
          transitions,
        ),
      )
      ..add(
        DiagnosticsProperty<SelenicTypography>(
          "SelenicTypography",
          typography,
        ),
      );
  }
}
