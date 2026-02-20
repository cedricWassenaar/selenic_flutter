import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:selenic_design/src/theme/tag/tag_colors.dart';
import 'package:selenic_design/src/theme/tag/tag_sizes.dart';
import 'package:selenic_design/src/theme/tokens/tokens.dart';

@immutable
class SelenicTagTheme extends ThemeExtension<SelenicTagTheme>
    with DiagnosticableTreeMixin {
  /// The tokens of the Selenic Design System.
  final SelenicTokens tokens;

  /// The colors of the SelenicTag.
  final SelenicTagColors colors;

  /// The sizes of the SelenicTag.
  final SelenicTagSizes sizes;

  SelenicTagTheme({
    required this.tokens,
    SelenicTagColors? colors,
    SelenicTagSizes? sizes,
  })  : colors = colors ??
            SelenicTagColors(
              textColor: tokens.colors.textPrimary,
              iconColor: tokens.colors.iconPrimary,
              backgroundColor: tokens.colors.backgroundPrimary,
            ),
        sizes = sizes ?? SelenicTagSizes(tokens: tokens);

  @override
  SelenicTagTheme copyWith({
    SelenicTokens? tokens,
    SelenicTagColors? colors,
    SelenicTagSizes? sizes,
  }) {
    return SelenicTagTheme(
      tokens: tokens ?? this.tokens,
      colors: colors ?? this.colors,
      sizes: sizes ?? this.sizes,
    );
  }

  @override
  SelenicTagTheme lerp(ThemeExtension<SelenicTagTheme>? other, double t) {
    if (other is! SelenicTagTheme) return this;

    return SelenicTagTheme(
      tokens: tokens.lerp(other.tokens, t),
      colors: colors.lerp(other.colors, t),
      sizes: sizes.lerp(other.sizes, t),
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty("type", "SelenicTagTheme"))
      ..add(DiagnosticsProperty<SelenicTokens>("tokens", tokens))
      ..add(DiagnosticsProperty<SelenicTagColors>("colors", colors))
      ..add(DiagnosticsProperty<SelenicTagSizes>("sizes", sizes));
  }
}
