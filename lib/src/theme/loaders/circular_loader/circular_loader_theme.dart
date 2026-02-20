import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:selenic_design/src/theme/loaders/circular_loader/circular_loader_colors.dart';
import 'package:selenic_design/src/theme/loaders/circular_loader/circular_loader_sizes.dart';
import 'package:selenic_design/src/theme/tokens/tokens.dart';

@immutable
class SelenicCircularLoaderTheme
    extends ThemeExtension<SelenicCircularLoaderTheme>
    with DiagnosticableTreeMixin {
  /// The tokens of the Selenic Design System.
  final SelenicTokens tokens;

  /// The colors of the SelenicCircularLoader.
  final SelenicCircularLoaderColors colors;

  /// The sizes of the SelenicCircularLoader.
  final SelenicCircularLoaderSizes sizes;

  SelenicCircularLoaderTheme({
    required this.tokens,
    SelenicCircularLoaderColors? colors,
    SelenicCircularLoaderSizes? sizes,
  })  : colors = colors ??
            SelenicCircularLoaderColors(
              color: tokens.colors.accentPrimary,
              backgroundColor: Colors.transparent,
            ),
        sizes = sizes ?? SelenicCircularLoaderSizes(tokens: tokens);

  @override
  SelenicCircularLoaderTheme copyWith({
    SelenicTokens? tokens,
    SelenicCircularLoaderColors? colors,
    SelenicCircularLoaderSizes? sizes,
  }) {
    return SelenicCircularLoaderTheme(
      tokens: tokens ?? this.tokens,
      colors: colors ?? this.colors,
      sizes: sizes ?? this.sizes,
    );
  }

  @override
  SelenicCircularLoaderTheme lerp(
    ThemeExtension<SelenicCircularLoaderTheme>? other,
    double t,
  ) {
    if (other is! SelenicCircularLoaderTheme) return this;

    return SelenicCircularLoaderTheme(
      tokens: tokens.lerp(other.tokens, t),
      colors: colors.lerp(other.colors, t),
      sizes: sizes.lerp(other.sizes, t),
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty("type", "SelenicCircularLoaderTheme"))
      ..add(DiagnosticsProperty<SelenicCircularLoaderColors>("colors", colors))
      ..add(DiagnosticsProperty<SelenicCircularLoaderSizes>("sizes", sizes));
  }
}
