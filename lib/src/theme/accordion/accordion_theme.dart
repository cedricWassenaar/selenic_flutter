import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:selenic_design/src/theme/accordion/accordion_colors.dart';
import 'package:selenic_design/src/theme/accordion/accordion_properties.dart';
import 'package:selenic_design/src/theme/accordion/accordion_shadows.dart';
import 'package:selenic_design/src/theme/accordion/accordion_sizes.dart';
import 'package:selenic_design/src/theme/tokens/tokens.dart';

@immutable
class SelenicAccordionTheme extends ThemeExtension<SelenicAccordionTheme>
    with DiagnosticableTreeMixin {
  /// The tokens of the Selenic Design System.
  final SelenicTokens tokens;

  /// The colors of the SelenicAccordion.
  final SelenicAccordionColors colors;

  /// The properties of the SelenicAccordion.
  final SelenicAccordionProperties properties;

  /// The shadows of the SelenicAccordion.
  final SelenicAccordionShadows shadows;

  /// The sizes of the SelenicAccordion.
  final SelenicAccordionSizes sizes;

  SelenicAccordionTheme({
    required this.tokens,
    SelenicAccordionColors? colors,
    SelenicAccordionProperties? properties,
    SelenicAccordionShadows? shadows,
    SelenicAccordionSizes? sizes,
  })  : colors = colors ??
            SelenicAccordionColors(
              textColor: tokens.colors.textPrimary,
              expandedTextColor: tokens.colors.textPrimary,
              contentColor: tokens.colors.textPrimary,
              iconColor: tokens.colors.iconPrimary,
              expandedIconColor: tokens.colors.iconPrimary,
              trailingIconColor: tokens.colors.iconPrimary,
              expandedTrailingIconColor: tokens.colors.iconSecondary,
              backgroundColor: tokens.colors.backgroundPrimary,
              expandedBackgroundColor: tokens.colors.backgroundPrimary,
              borderColor: tokens.colors.lineAccent,
              dividerColor: tokens.colors.lineAccent,
            ),
        properties = properties ??
            SelenicAccordionProperties(
              transitionDuration: tokens.transitions.defaultTransitionDuration,
              transitionCurve: tokens.transitions.defaultTransitionCurve,
            ),
        shadows =
            shadows ?? SelenicAccordionShadows(shadows: tokens.shadows.sm),
        sizes = sizes ?? SelenicAccordionSizes(tokens: tokens);

  @override
  SelenicAccordionTheme copyWith({
    SelenicTokens? tokens,
    SelenicAccordionColors? colors,
    SelenicAccordionProperties? properties,
    SelenicAccordionShadows? shadows,
    SelenicAccordionSizes? sizes,
  }) {
    return SelenicAccordionTheme(
      tokens: tokens ?? this.tokens,
      colors: colors ?? this.colors,
      properties: properties ?? this.properties,
      shadows: shadows ?? this.shadows,
      sizes: sizes ?? this.sizes,
    );
  }

  @override
  SelenicAccordionTheme lerp(
      ThemeExtension<SelenicAccordionTheme>? other, double t) {
    if (other is! SelenicAccordionTheme) return this;

    return SelenicAccordionTheme(
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
      ..add(DiagnosticsProperty("type", "SelenicAccordionTheme"))
      ..add(DiagnosticsProperty<SelenicTokens>("tokens", tokens))
      ..add(DiagnosticsProperty<SelenicAccordionColors>("colors", colors))
      ..add(
        DiagnosticsProperty<SelenicAccordionProperties>(
            "properties", properties),
      )
      ..add(
        DiagnosticsProperty<SelenicAccordionShadows>("shadows", shadows),
      )
      ..add(
        DiagnosticsProperty<SelenicAccordionSizes>("sizes", sizes),
      );
  }
}
