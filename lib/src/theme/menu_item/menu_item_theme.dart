import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:selenic_design/src/theme/menu_item/menu_item_colors.dart';
import 'package:selenic_design/src/theme/menu_item/menu_item_properties.dart';
import 'package:selenic_design/src/theme/tokens/tokens.dart';

@immutable
class SelenicMenuItemTheme extends ThemeExtension<SelenicMenuItemTheme>
    with DiagnosticableTreeMixin {
  /// The tokens of the Selenic Design System.
  final SelenicTokens tokens;

  /// The colors of the SelenicMenuItem.
  final SelenicMenuItemColors colors;

  /// The properties of the SelenicMenuItem.
  final SelenicMenuItemProperties properties;

  SelenicMenuItemTheme({
    required this.tokens,
    SelenicMenuItemColors? colors,
    SelenicMenuItemProperties? properties,
  })  : colors = colors ??
            SelenicMenuItemColors(
              backgroundColor: Colors.transparent,
              dividerColor: tokens.colors.lineAccent,
              iconColor: tokens.colors.iconPrimary,
              labelTextColor: tokens.colors.textPrimary,
              contentTextColor: tokens.colors.textSecondary,
            ),
        properties = properties ??
            SelenicMenuItemProperties(
              borderRadius: tokens.borders.interactiveSm,
              verticalGap: tokens.sizes.x5s,
              minimumHeight: tokens.sizes.md,
              padding: EdgeInsets.all(tokens.sizes.x3s),
              labelTextStyle: tokens.typography.body.textDefault,
              contentTextStyle: tokens.typography.body.text12,
            );

  @override
  SelenicMenuItemTheme copyWith({
    SelenicTokens? tokens,
    SelenicMenuItemColors? colors,
    SelenicMenuItemProperties? properties,
  }) {
    return SelenicMenuItemTheme(
      tokens: tokens ?? this.tokens,
      colors: colors ?? this.colors,
      properties: properties ?? this.properties,
    );
  }

  @override
  SelenicMenuItemTheme lerp(
      ThemeExtension<SelenicMenuItemTheme>? other, double t) {
    if (other is! SelenicMenuItemTheme) return this;

    return SelenicMenuItemTheme(
      tokens: tokens.lerp(other.tokens, t),
      colors: colors.lerp(other.colors, t),
      properties: properties.lerp(other.properties, t),
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder diagnosticProperties) {
    super.debugFillProperties(diagnosticProperties);
    diagnosticProperties
      ..add(DiagnosticsProperty("type", "SelenicMenuItemTheme"))
      ..add(DiagnosticsProperty<SelenicTokens>("tokens", tokens))
      ..add(DiagnosticsProperty<SelenicMenuItemColors>("colors", colors))
      ..add(
        DiagnosticsProperty<SelenicMenuItemProperties>(
            "properties", properties),
      );
  }
}
