import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:selenic_design/src/theme/button/button_colors.dart';
import 'package:selenic_design/src/theme/button/button_sizes.dart';
import 'package:selenic_design/src/theme/tokens/tokens.dart';

@immutable
class SelenicButtonTheme extends ThemeExtension<SelenicButtonTheme>
    with DiagnosticableTreeMixin {
  /// The tokens of the Selenic Design System.
  final SelenicTokens tokens;

  /// The colors of the SelenicButton.
  final SelenicButtonColors colors;

  /// The sizes of the SelenicButton.
  final SelenicButtonSizes sizes;

  SelenicButtonTheme({
    required this.tokens,
    SelenicButtonColors? colors,
    SelenicButtonSizes? sizes,
  })  : colors = colors ??
            SelenicButtonColors(
              borderColor: tokens.colors.trunks,
              textColor: tokens.colors.textPrimary,
              filledVariantBackgroundColor: tokens.colors.piccolo,
              filledVariantTextColor: tokens.colors.goten,
              textVariantTextColor: tokens.colors.textSecondary,
              textVariantFocusColor: tokens.colors.piccolo,
              textVariantHoverColor: tokens.colors.jiren,
            ),
        sizes = sizes ?? SelenicButtonSizes(tokens: tokens);

  @override
  SelenicButtonTheme copyWith({
    SelenicTokens? tokens,
    SelenicButtonColors? colors,
    SelenicButtonSizes? sizes,
  }) {
    return SelenicButtonTheme(
      tokens: tokens ?? this.tokens,
      colors: colors ?? this.colors,
      sizes: sizes ?? this.sizes,
    );
  }

  @override
  SelenicButtonTheme lerp(ThemeExtension<SelenicButtonTheme>? other, double t) {
    if (other is! SelenicButtonTheme) return this;

    return SelenicButtonTheme(
      tokens: tokens.lerp(other.tokens, t),
      colors: colors.lerp(other.colors, t),
      sizes: sizes.lerp(other.sizes, t),
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty("type", "SelenicButtonTheme"))
      ..add(DiagnosticsProperty<SelenicTokens>("tokens", tokens))
      ..add(DiagnosticsProperty<SelenicButtonColors>("colors", colors))
      ..add(DiagnosticsProperty<SelenicButtonSizes>("sizes", sizes));
  }
}
