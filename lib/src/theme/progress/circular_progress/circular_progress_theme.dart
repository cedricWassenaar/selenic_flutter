import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:selenic_design/src/theme/progress/circular_progress/circular_progress_colors.dart';
import 'package:selenic_design/src/theme/progress/circular_progress/circular_progress_sizes.dart';
import 'package:selenic_design/src/theme/tokens/tokens.dart';

@immutable
class SelenicCircularProgressTheme
    extends ThemeExtension<SelenicCircularProgressTheme>
    with DiagnosticableTreeMixin {
  /// The tokens of the Selenic Design System.
  final SelenicTokens tokens;

  /// The colors of the SelenicCircularProgress.
  final SelenicCircularProgressColors colors;

  /// The sizes of the SelenicCircularProgress.
  final SelenicCircularProgressSizes sizes;

  SelenicCircularProgressTheme({
    required this.tokens,
    SelenicCircularProgressColors? colors,
    SelenicCircularProgressSizes? sizes,
  })  : colors = colors ??
            SelenicCircularProgressColors(
              color: tokens.colors.accentPrimary,
              backgroundColor: tokens.colors.lineAccent,
            ),
        sizes = sizes ?? SelenicCircularProgressSizes(tokens: tokens);

  @override
  SelenicCircularProgressTheme copyWith({
    SelenicTokens? tokens,
    SelenicCircularProgressColors? colors,
    SelenicCircularProgressSizes? sizes,
  }) {
    return SelenicCircularProgressTheme(
      tokens: tokens ?? this.tokens,
      colors: colors ?? this.colors,
      sizes: sizes ?? this.sizes,
    );
  }

  @override
  SelenicCircularProgressTheme lerp(
    ThemeExtension<SelenicCircularProgressTheme>? other,
    double t,
  ) {
    if (other is! SelenicCircularProgressTheme) return this;

    return SelenicCircularProgressTheme(
      tokens: tokens.lerp(other.tokens, t),
      colors: colors.lerp(other.colors, t),
      sizes: sizes.lerp(other.sizes, t),
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty("type", "SelenicCircularProgressTheme"))
      ..add(DiagnosticsProperty<SelenicTokens>("tokens", tokens))
      ..add(
          DiagnosticsProperty<SelenicCircularProgressColors>("colors", colors))
      ..add(DiagnosticsProperty<SelenicCircularProgressSizes>("sizes", sizes));
  }
}
