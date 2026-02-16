import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:selenic_design/src/theme/carousel/carousel_colors.dart';
import 'package:selenic_design/src/theme/carousel/carousel_properties.dart';
import 'package:selenic_design/src/theme/tokens/tokens.dart';

@immutable
class SelenicCarouselTheme extends ThemeExtension<SelenicCarouselTheme>
    with DiagnosticableTreeMixin {
  /// The tokens of the Selenic Design System.
  final SelenicTokens tokens;

  /// The colors of the SelenicCarousel.
  final SelenicCarouselColors colors;

  /// The properties of the SelenicCarousel.
  final SelenicCarouselProperties properties;

  SelenicCarouselTheme({
    required this.tokens,
    SelenicCarouselColors? colors,
    SelenicCarouselProperties? properties,
  })  : colors = colors ??
            SelenicCarouselColors(
              textColor: tokens.colors.textPrimary,
              iconColor: tokens.colors.iconPrimary,
            ),
        properties = properties ??
            SelenicCarouselProperties(
              gap: tokens.sizes.x2s,
              textStyle: tokens.typography.body.textDefault,
              autoPlayDelay: const Duration(seconds: 3),
              transitionDuration: const Duration(milliseconds: 800),
              transitionCurve: Curves.fastOutSlowIn,
            );

  @override
  SelenicCarouselTheme copyWith({
    SelenicTokens? tokens,
    SelenicCarouselColors? colors,
    SelenicCarouselProperties? properties,
  }) {
    return SelenicCarouselTheme(
      tokens: tokens ?? this.tokens,
      colors: colors ?? this.colors,
      properties: properties ?? this.properties,
    );
  }

  @override
  SelenicCarouselTheme lerp(
      ThemeExtension<SelenicCarouselTheme>? other, double t) {
    if (other is! SelenicCarouselTheme) return this;

    return SelenicCarouselTheme(
      tokens: tokens,
      properties: properties.lerp(other.properties, t),
      colors: colors.lerp(other.colors, t),
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder diagnosticProperties) {
    super.debugFillProperties(diagnosticProperties);
    diagnosticProperties
      ..add(DiagnosticsProperty("type", "SelenicCarouselTheme"))
      ..add(DiagnosticsProperty<SelenicTokens>("tokens", tokens))
      ..add(DiagnosticsProperty<SelenicCarouselColors>("colors", colors))
      ..add(
        DiagnosticsProperty<SelenicCarouselProperties>(
            "properties", properties),
      );
  }
}
