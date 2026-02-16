import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:selenic_design/src/theme/chip/chip_colors.dart';
import 'package:selenic_design/src/theme/chip/chip_sizes.dart';
import 'package:selenic_design/src/theme/tokens/tokens.dart';

@immutable
class SelenicChipTheme extends ThemeExtension<SelenicChipTheme>
    with DiagnosticableTreeMixin {
  /// The tokens of the Selenic Design System.
  final SelenicTokens tokens;

  /// The colors of the SelenicChip.
  final SelenicChipColors colors;

  /// The sizes of the SelenicChip.
  final SelenicChipSizes sizes;

  SelenicChipTheme({
    required this.tokens,
    SelenicChipColors? colors,
    SelenicChipSizes? sizes,
  })  : colors = colors ??
            SelenicChipColors(
              activeColor: tokens.colors.piccolo,
              backgroundColor: tokens.colors.goku,
              activeBackgroundColor: tokens.colors.jiren,
              textColor: tokens.colors.textPrimary,
            ),
        sizes = sizes ?? SelenicChipSizes(tokens: tokens);

  @override
  SelenicChipTheme copyWith({
    SelenicTokens? tokens,
    SelenicChipColors? colors,
    SelenicChipSizes? sizes,
  }) {
    return SelenicChipTheme(
      tokens: tokens ?? this.tokens,
      colors: colors ?? this.colors,
      sizes: sizes ?? this.sizes,
    );
  }

  @override
  SelenicChipTheme lerp(ThemeExtension<SelenicChipTheme>? other, double t) {
    if (other is! SelenicChipTheme) return this;

    return SelenicChipTheme(
      tokens: tokens.lerp(other.tokens, t),
      colors: colors.lerp(other.colors, t),
      sizes: sizes.lerp(other.sizes, t),
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty("type", "SelenicChipTheme"))
      ..add(DiagnosticsProperty<SelenicTokens>("tokens", tokens))
      ..add(DiagnosticsProperty<SelenicChipColors>("colors", colors))
      ..add(DiagnosticsProperty<SelenicChipSizes>("sizes", sizes));
  }
}
