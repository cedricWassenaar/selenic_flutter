import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:selenic_design/src/theme/radio/radio_colors.dart';
import 'package:selenic_design/src/theme/tokens/tokens.dart';

@immutable
class SelenicRadioTheme extends ThemeExtension<SelenicRadioTheme>
    with DiagnosticableTreeMixin {
  /// The tokens of the Selenic Design System.
  final SelenicTokens tokens;

  /// The colors of the SelenicRadio.
  final SelenicRadioColors colors;

  SelenicRadioTheme({
    required this.tokens,
    SelenicRadioColors? colors,
  }) : colors = colors ??
            SelenicRadioColors(
              activeColor: tokens.colors.accentPrimary,
              inactiveColor: tokens.colors.bodyTextSecondary,
            );

  @override
  SelenicRadioTheme copyWith(
      {SelenicTokens? tokens, SelenicRadioColors? colors}) {
    return SelenicRadioTheme(
      tokens: tokens ?? this.tokens,
      colors: colors ?? this.colors,
    );
  }

  @override
  SelenicRadioTheme lerp(ThemeExtension<SelenicRadioTheme>? other, double t) {
    if (other is! SelenicRadioTheme) return this;

    return SelenicRadioTheme(
      tokens: tokens.lerp(other.tokens, t),
      colors: colors.lerp(other.colors, t),
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder diagnosticProperties) {
    super.debugFillProperties(diagnosticProperties);
    diagnosticProperties
      ..add(DiagnosticsProperty("type", "SelenicRadioTheme"))
      ..add(DiagnosticsProperty<SelenicTokens>("tokens", tokens))
      ..add(DiagnosticsProperty<SelenicRadioColors>("colors", colors));
  }
}
