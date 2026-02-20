import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:selenic_design/src/theme/segmented_control/segmented_control_colors.dart';
import 'package:selenic_design/src/theme/segmented_control/segmented_control_properties.dart';
import 'package:selenic_design/src/theme/segmented_control/segmented_control_sizes.dart';
import 'package:selenic_design/src/theme/tokens/tokens.dart';

@immutable
class SelenicSegmentedControlTheme
    extends ThemeExtension<SelenicSegmentedControlTheme>
    with DiagnosticableTreeMixin {
  /// The tokens of the Selenic Design System.
  final SelenicTokens tokens;

  /// The colors of the SelenicSegmentedControl.
  final SelenicSegmentedControlColors colors;

  /// The properties of the SelenicSegmentedControl.
  final SelenicSegmentedControlProperties properties;

  /// The sizes of the SelenicSegmentedControl.
  final SelenicSegmentedControlSizes sizes;

  SelenicSegmentedControlTheme({
    required this.tokens,
    SelenicSegmentedControlColors? colors,
    SelenicSegmentedControlProperties? properties,
    SelenicSegmentedControlSizes? sizes,
  })  : colors = colors ??
            SelenicSegmentedControlColors(
              backgroundColor: tokens.colors.backgroundSecondary,
              selectedSegmentColor: tokens.colors.backgroundPrimary,
              textColor: tokens.colors.textPrimary,
              selectedTextColor: tokens.colors.textPrimary,
            ),
        properties = properties ??
            SelenicSegmentedControlProperties(
              borderRadius: tokens.borders.interactiveMd,
              gap: tokens.sizes.x5s,
              transitionDuration: tokens.transitions.defaultTransitionDuration,
              transitionCurve: tokens.transitions.defaultTransitionCurve,
              padding: EdgeInsets.all(tokens.sizes.x5s),
            ),
        sizes = sizes ?? SelenicSegmentedControlSizes(tokens: tokens);

  @override
  SelenicSegmentedControlTheme copyWith({
    SelenicTokens? tokens,
    SelenicSegmentedControlColors? colors,
    SelenicSegmentedControlProperties? properties,
    SelenicSegmentedControlSizes? sizes,
  }) {
    return SelenicSegmentedControlTheme(
      tokens: tokens ?? this.tokens,
      colors: colors ?? this.colors,
      properties: properties ?? this.properties,
      sizes: sizes ?? this.sizes,
    );
  }

  @override
  SelenicSegmentedControlTheme lerp(
    ThemeExtension<SelenicSegmentedControlTheme>? other,
    double t,
  ) {
    if (other is! SelenicSegmentedControlTheme) return this;

    return SelenicSegmentedControlTheme(
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
      ..add(DiagnosticsProperty("type", "SelenicSegmentedControlTheme"))
      ..add(DiagnosticsProperty<SelenicTokens>("tokens", tokens))
      ..add(
          DiagnosticsProperty<SelenicSegmentedControlColors>("colors", colors))
      ..add(
        DiagnosticsProperty<SelenicSegmentedControlProperties>(
          "properties",
          properties,
        ),
      )
      ..add(
        DiagnosticsProperty<SelenicSegmentedControlSizes>(
          "sizes",
          sizes,
        ),
      );
  }
}
