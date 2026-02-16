import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:selenic_design/src/theme/loaders/linear_loader/linear_loader_colors.dart';
import 'package:selenic_design/src/theme/loaders/linear_loader/linear_loader_sizes.dart';
import 'package:selenic_design/src/theme/tokens/tokens.dart';

@immutable
class SelenicLinearLoaderTheme extends ThemeExtension<SelenicLinearLoaderTheme>
    with DiagnosticableTreeMixin {
  /// The tokens of the Selenic Design System.
  final SelenicTokens tokens;

  /// The colors of the SelenicLinearLoader.
  final SelenicLinearLoaderColors colors;

  /// The sizes of the SelenicLinearLoader.
  final SelenicLinearLoaderSizes sizes;

  SelenicLinearLoaderTheme({
    required this.tokens,
    SelenicLinearLoaderColors? colors,
    SelenicLinearLoaderSizes? sizes,
  })  : colors = colors ??
            SelenicLinearLoaderColors(
              color: tokens.colors.piccolo,
              backgroundColor: Colors.transparent,
            ),
        sizes = sizes ?? SelenicLinearLoaderSizes(tokens: tokens);

  @override
  SelenicLinearLoaderTheme copyWith({
    SelenicTokens? tokens,
    SelenicLinearLoaderColors? colors,
    SelenicLinearLoaderSizes? sizes,
  }) {
    return SelenicLinearLoaderTheme(
      tokens: tokens ?? this.tokens,
      colors: colors ?? this.colors,
      sizes: sizes ?? this.sizes,
    );
  }

  @override
  SelenicLinearLoaderTheme lerp(
    ThemeExtension<SelenicLinearLoaderTheme>? other,
    double t,
  ) {
    if (other is! SelenicLinearLoaderTheme) return this;

    return SelenicLinearLoaderTheme(
      tokens: tokens.lerp(other.tokens, t),
      colors: colors.lerp(other.colors, t),
      sizes: sizes.lerp(other.sizes, t),
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty("type", "SelenicLinearLoaderTheme"))
      ..add(DiagnosticsProperty<SelenicTokens>("tokens", tokens))
      ..add(DiagnosticsProperty<SelenicLinearLoaderColors>("colors", colors))
      ..add(DiagnosticsProperty<SelenicLinearLoaderSizes>("sizes", sizes));
  }
}
