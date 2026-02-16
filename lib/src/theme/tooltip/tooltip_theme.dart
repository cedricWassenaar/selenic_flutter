import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:selenic_design/src/theme/tokens/tokens.dart';
import 'package:selenic_design/src/theme/tooltip/tooltip_colors.dart';
import 'package:selenic_design/src/theme/tooltip/tooltip_properties.dart';
import 'package:selenic_design/src/theme/tooltip/tooltip_shadows.dart';

@immutable
class SelenicTooltipTheme extends ThemeExtension<SelenicTooltipTheme>
    with DiagnosticableTreeMixin {
  /// The tokens of the Selenic Design System.
  final SelenicTokens tokens;

  /// The colors of the SelenicTooltip.
  final SelenicTooltipColors colors;

  /// The properties of the SelenicTooltip.
  final SelenicTooltipProperties properties;

  /// The shadows of the SelenicTooltip.
  final SelenicTooltipShadows shadows;

  SelenicTooltipTheme({
    required this.tokens,
    SelenicTooltipColors? colors,
    SelenicTooltipProperties? properties,
    SelenicTooltipShadows? shadows,
  })  : colors = colors ??
            SelenicTooltipColors(
              textColor: tokens.colors.textPrimary,
              iconColor: tokens.colors.iconPrimary,
              backgroundColor: tokens.colors.goku,
            ),
        properties = properties ??
            SelenicTooltipProperties(
              borderRadius: tokens.borders.interactiveXs,
              arrowBaseWidth: tokens.sizes.x2s,
              arrowLength: tokens.sizes.x4s,
              arrowTipDistance: tokens.sizes.x4s,
              transitionDuration: const Duration(milliseconds: 150),
              transitionCurve: tokens.transitions.defaultTransitionCurve,
              contentPadding: EdgeInsets.all(tokens.sizes.x3s),
              textStyle: tokens.typography.body.text12,
            ),
        shadows =
            shadows ?? SelenicTooltipShadows(tooltipShadows: tokens.shadows.sm);

  @override
  SelenicTooltipTheme copyWith({
    SelenicTokens? tokens,
    SelenicTooltipColors? colors,
    SelenicTooltipProperties? properties,
    SelenicTooltipShadows? shadows,
  }) {
    return SelenicTooltipTheme(
      tokens: tokens ?? this.tokens,
      colors: colors ?? this.colors,
      properties: properties ?? this.properties,
      shadows: shadows ?? this.shadows,
    );
  }

  @override
  SelenicTooltipTheme lerp(
      ThemeExtension<SelenicTooltipTheme>? other, double t) {
    if (other is! SelenicTooltipTheme) return this;

    return SelenicTooltipTheme(
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
        DiagnosticsProperty("type", "SelenicTooltipTheme"),
      )
      ..add(
        DiagnosticsProperty<SelenicTokens>("tokens", tokens),
      )
      ..add(
        DiagnosticsProperty<SelenicTooltipColors>("colors", colors),
      )
      ..add(
        DiagnosticsProperty<SelenicTooltipProperties>("properties", properties),
      )
      ..add(
        DiagnosticsProperty<SelenicTooltipShadows>("shadows", shadows),
      );
  }
}
