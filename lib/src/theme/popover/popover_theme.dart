import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:selenic_design/src/theme/popover/popover_colors.dart';
import 'package:selenic_design/src/theme/popover/popover_properties.dart';
import 'package:selenic_design/src/theme/popover/popover_shadows.dart';
import 'package:selenic_design/src/theme/tokens/tokens.dart';

@immutable
class SelenicPopoverTheme extends ThemeExtension<SelenicPopoverTheme>
    with DiagnosticableTreeMixin {
  /// The tokens of the Selenic Design System.
  final SelenicTokens tokens;

  /// The colors of the SelenicPopover.
  final SelenicPopoverColors colors;

  /// The properties of the SelenicPopover.
  final SelenicPopoverProperties properties;

  /// The shadows of the SelenicPopover.
  final SelenicPopoverShadows shadows;

  SelenicPopoverTheme({
    required this.tokens,
    SelenicPopoverColors? colors,
    SelenicPopoverProperties? properties,
    SelenicPopoverShadows? shadows,
  })  : colors = colors ??
            SelenicPopoverColors(
              textColor: tokens.colors.textPrimary,
              iconColor: tokens.colors.iconPrimary,
              backgroundColor: tokens.colors.goku,
            ),
        properties = properties ??
            SelenicPopoverProperties(
              borderRadius: tokens.borders.interactiveMd,
              distanceToTarget: tokens.sizes.x4s,
              transitionDuration: tokens.transitions.defaultTransitionDuration,
              transitionCurve: tokens.transitions.defaultTransitionCurve,
              contentPadding: EdgeInsets.all(tokens.sizes.x3s),
              textStyle: tokens.typography.body.textDefault,
            ),
        shadows =
            shadows ?? SelenicPopoverShadows(popoverShadows: tokens.shadows.sm);

  @override
  SelenicPopoverTheme copyWith({
    SelenicTokens? tokens,
    SelenicPopoverColors? colors,
    SelenicPopoverProperties? properties,
    SelenicPopoverShadows? shadows,
  }) {
    return SelenicPopoverTheme(
      tokens: tokens ?? this.tokens,
      colors: colors ?? this.colors,
      properties: properties ?? this.properties,
      shadows: shadows ?? this.shadows,
    );
  }

  @override
  SelenicPopoverTheme lerp(
      ThemeExtension<SelenicPopoverTheme>? other, double t) {
    if (other is! SelenicPopoverTheme) return this;

    return SelenicPopoverTheme(
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
        DiagnosticsProperty("type", "SelenicPopoverTheme"),
      )
      ..add(
        DiagnosticsProperty<SelenicTokens>("tokens", tokens),
      )
      ..add(
        DiagnosticsProperty<SelenicPopoverColors>("colors", colors),
      )
      ..add(
        DiagnosticsProperty<SelenicPopoverProperties>("properties", properties),
      )
      ..add(
        DiagnosticsProperty<SelenicPopoverShadows>("shadows", shadows),
      );
  }
}
