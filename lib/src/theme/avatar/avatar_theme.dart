import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:selenic_design/src/theme/avatar/avatar_colors.dart';
import 'package:selenic_design/src/theme/avatar/avatar_sizes.dart';
import 'package:selenic_design/src/theme/tokens/tokens.dart';

@immutable
class SelenicAvatarTheme extends ThemeExtension<SelenicAvatarTheme>
    with DiagnosticableTreeMixin {
  /// The tokens of the Selenic Design System.
  final SelenicTokens tokens;

  /// The colors of the SelenicAvatar.
  final SelenicAvatarColors colors;

  /// The sizes of the SelenicAvatar.
  final SelenicAvatarSizes sizes;

  SelenicAvatarTheme({
    required this.tokens,
    SelenicAvatarColors? colors,
    SelenicAvatarSizes? sizes,
  })  : colors = colors ??
            SelenicAvatarColors(
              backgroundColor: tokens.colors.goku,
              badgeColor: tokens.colors.roshi,
              iconColor: tokens.colors.iconPrimary,
              textColor: tokens.colors.textPrimary,
            ),
        sizes = sizes ?? SelenicAvatarSizes(tokens: tokens);

  @override
  SelenicAvatarTheme copyWith({
    SelenicTokens? tokens,
    SelenicAvatarColors? colors,
    SelenicAvatarSizes? sizes,
  }) {
    return SelenicAvatarTheme(
      tokens: tokens ?? this.tokens,
      colors: colors ?? this.colors,
      sizes: sizes ?? this.sizes,
    );
  }

  @override
  SelenicAvatarTheme lerp(ThemeExtension<SelenicAvatarTheme>? other, double t) {
    if (other is! SelenicAvatarTheme) return this;

    return SelenicAvatarTheme(
      tokens: tokens.lerp(other.tokens, t),
      colors: colors.lerp(other.colors, t),
      sizes: sizes.lerp(other.sizes, t),
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty("type", "SelenicAvatarTheme"))
      ..add(DiagnosticsProperty<SelenicTokens>("tokens", tokens))
      ..add(DiagnosticsProperty<SelenicAvatarColors>("colors", colors))
      ..add(DiagnosticsProperty<SelenicAvatarSizes>("sizes", sizes));
  }
}
