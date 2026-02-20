import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:selenic_design/src/theme/progress/linear_progress/linear_progress_colors.dart';
import 'package:selenic_design/src/theme/progress/linear_progress/linear_progress_sizes.dart';
import 'package:selenic_design/src/theme/tokens/tokens.dart';

@immutable
class SelenicLinearProgressTheme
    extends ThemeExtension<SelenicLinearProgressTheme>
    with DiagnosticableTreeMixin {
  /// The tokens of the Selenic Design System.
  final SelenicTokens tokens;

  /// The colors of the SelenicLinearProgress.
  final SelenicLinearProgressColors colors;

  /// The sizes of the SelenicLinearProgress.
  final SelenicLinearProgressSizes sizes;

  SelenicLinearProgressTheme({
    required this.tokens,
    SelenicLinearProgressColors? colors,
    SelenicLinearProgressSizes? sizes,
  })  : colors = colors ??
            SelenicLinearProgressColors(
              color: tokens.colors.accentPrimary,
              backgroundColor: tokens.colors.lineAccent,
              textColor: tokens.colors.textPrimary,
            ),
        sizes = sizes ?? SelenicLinearProgressSizes(tokens: tokens);

  @override
  SelenicLinearProgressTheme copyWith({
    SelenicTokens? tokens,
    SelenicLinearProgressColors? colors,
    SelenicLinearProgressSizes? sizes,
  }) {
    return SelenicLinearProgressTheme(
      tokens: tokens ?? this.tokens,
      colors: colors ?? this.colors,
      sizes: sizes ?? this.sizes,
    );
  }

  @override
  SelenicLinearProgressTheme lerp(
    ThemeExtension<SelenicLinearProgressTheme>? other,
    double t,
  ) {
    if (other is! SelenicLinearProgressTheme) return this;

    return SelenicLinearProgressTheme(
      tokens: tokens.lerp(other.tokens, t),
      colors: colors.lerp(other.colors, t),
      sizes: sizes.lerp(other.sizes, t),
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty("type", "SelenicLinearProgressTheme"))
      ..add(DiagnosticsProperty<SelenicTokens>("tokens", tokens))
      ..add(DiagnosticsProperty<SelenicLinearProgressColors>("colors", colors))
      ..add(DiagnosticsProperty<SelenicLinearProgressSizes>("sizes", sizes));
  }
}
