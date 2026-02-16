import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:selenic_design/src/theme/table/table_colors.dart';
import 'package:selenic_design/src/theme/table/table_properties.dart';
import 'package:selenic_design/src/theme/table/table_sizes.dart';
import 'package:selenic_design/src/theme/tokens/tokens.dart';

@immutable
class SelenicTableTheme extends ThemeExtension<SelenicTableTheme>
    with DiagnosticableTreeMixin {
  /// The tokens of the Selenic Design System.
  final SelenicTokens tokens;

  /// The colors of the SelenicTable.
  final SelenicTableColors colors;

  /// The properties of the SelenicTable.
  final SelenicTableProperties properties;

  /// The sizes of the SelenicTable.
  final SelenicTableSizes sizes;

  SelenicTableTheme({
    required this.tokens,
    SelenicTableColors? colors,
    SelenicTableProperties? properties,
    SelenicTableSizes? sizes,
  })  : colors = colors ??
            SelenicTableColors(
              columnTextColor: tokens.colors.textPrimary,
              rowTextColor: tokens.colors.textPrimary,
              rowLabelTextColor: tokens.colors.textPrimary,
              rowPinnedAnimatedLabelTextColor: tokens.colors.trunks,
              iconColor: tokens.colors.iconPrimary,
              rowBackgroundColor: tokens.colors.goku,
            ),
        properties = properties ??
            SelenicTableProperties(
              transitionDuration: const Duration(milliseconds: 400),
              transitionCurve: tokens.transitions.defaultTransitionCurve,
            ),
        sizes = sizes ?? SelenicTableSizes(tokens: tokens);

  @override
  SelenicTableTheme copyWith({
    SelenicTokens? tokens,
    SelenicTableColors? colors,
    SelenicTableProperties? properties,
    SelenicTableSizes? sizes,
  }) {
    return SelenicTableTheme(
      tokens: tokens ?? this.tokens,
      colors: colors ?? this.colors,
      properties: properties ?? this.properties,
      sizes: sizes ?? this.sizes,
    );
  }

  @override
  SelenicTableTheme lerp(ThemeExtension<SelenicTableTheme>? other, double t) {
    if (other is! SelenicTableTheme) return this;

    return SelenicTableTheme(
      tokens: tokens.lerp(other.tokens, t),
      colors: colors.lerp(other.colors, t),
      properties: properties.lerp(other.properties, t),
      sizes: sizes.lerp(other.sizes, t),
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder diagnosticProperties) {
    super.debugFillProperties(diagnosticProperties);
    diagnosticProperties
      ..add(DiagnosticsProperty("type", "SelenicTableTheme"))
      ..add(DiagnosticsProperty<SelenicTokens>("tokens", tokens))
      ..add(DiagnosticsProperty<SelenicTableColors>("colors", colors))
      ..add(
          DiagnosticsProperty<SelenicTableProperties>("properties", properties))
      ..add(DiagnosticsProperty<SelenicTableSizes>("sizes", sizes));
  }
}
