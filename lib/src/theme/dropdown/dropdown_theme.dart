import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:selenic_design/src/theme/dropdown/dropdown_colors.dart';
import 'package:selenic_design/src/theme/dropdown/dropdown_properties.dart';
import 'package:selenic_design/src/theme/dropdown/dropdown_shadows.dart';
import 'package:selenic_design/src/theme/tokens/tokens.dart';

@immutable
class SelenicDropdownTheme extends ThemeExtension<SelenicDropdownTheme>
    with DiagnosticableTreeMixin {
  /// The tokens of the Selenic Design System.
  final SelenicTokens tokens;

  /// The colors of the SelenicDropdown.
  final SelenicDropdownColors colors;

  /// The properties of the SelenicDropdown.
  final SelenicDropdownProperties properties;

  /// The shadows of the SelenicDropdown.
  final SelenicDropdownShadows shadows;

  SelenicDropdownTheme({
    required this.tokens,
    SelenicDropdownColors? colors,
    SelenicDropdownProperties? properties,
    SelenicDropdownShadows? shadows,
  })  : colors = colors ??
            SelenicDropdownColors(
              textColor: tokens.colors.textPrimary,
              iconColor: tokens.colors.iconPrimary,
              backgroundColor: tokens.colors.goku,
            ),
        properties = properties ??
            SelenicDropdownProperties(
              borderRadius: tokens.borders.interactiveMd,
              distanceToTarget: tokens.sizes.x4s,
              transitionDuration: Duration.zero,
              transitionCurve: tokens.transitions.defaultTransitionCurve,
              contentPadding: EdgeInsets.all(tokens.sizes.x5s),
              dropdownMargin: EdgeInsets.all(tokens.sizes.x4s),
              textStyle: tokens.typography.body.textDefault,
            ),
        shadows = shadows ??
            SelenicDropdownShadows(dropdownShadows: tokens.shadows.sm);

  @override
  SelenicDropdownTheme copyWith({
    SelenicTokens? tokens,
    SelenicDropdownColors? colors,
    SelenicDropdownProperties? properties,
    SelenicDropdownShadows? shadows,
  }) {
    return SelenicDropdownTheme(
      tokens: tokens ?? this.tokens,
      colors: colors ?? this.colors,
      properties: properties ?? this.properties,
      shadows: shadows ?? this.shadows,
    );
  }

  @override
  SelenicDropdownTheme lerp(
      ThemeExtension<SelenicDropdownTheme>? other, double t) {
    if (other is! SelenicDropdownTheme) return this;

    return SelenicDropdownTheme(
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
      ..add(
        DiagnosticsProperty("type", "SelenicDropdownTheme"),
      )
      ..add(
        DiagnosticsProperty<SelenicTokens>("tokens", tokens),
      )
      ..add(
        DiagnosticsProperty<SelenicDropdownColors>("colors", colors),
      )
      ..add(
        DiagnosticsProperty<SelenicDropdownProperties>(
            "properties", properties),
      )
      ..add(
        DiagnosticsProperty<SelenicDropdownShadows>("shadows", shadows),
      );
  }
}
