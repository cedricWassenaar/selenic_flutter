import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:selenic_design/src/theme/checkbox/checkbox_colors.dart';
import 'package:selenic_design/src/theme/checkbox/checkbox_properties.dart';
import 'package:selenic_design/src/theme/tokens/tokens.dart';

@immutable
class SelenicCheckboxTheme extends ThemeExtension<SelenicCheckboxTheme>
    with DiagnosticableTreeMixin {
  /// The tokens of the Selenic Design System.
  final SelenicTokens tokens;

  /// The colors of the SelenicCheckbox.
  final SelenicCheckboxColors colors;

  /// The properties of the SelenicCheckbox.
  final SelenicCheckboxProperties properties;

  SelenicCheckboxTheme({
    required this.tokens,
    SelenicCheckboxColors? colors,
    SelenicCheckboxProperties? properties,
  })  : colors = colors ??
            SelenicCheckboxColors(
              activeColor: tokens.colors.piccolo,
              borderColor: tokens.colors.trunks,
              checkColor: tokens.colors.goten,
              inactiveColor: Colors.transparent,
            ),
        properties = properties ??
            SelenicCheckboxProperties(
                borderRadius: tokens.borders.interactiveXs);

  @override
  SelenicCheckboxTheme copyWith({
    SelenicTokens? tokens,
    SelenicCheckboxColors? colors,
    SelenicCheckboxProperties? properties,
  }) {
    return SelenicCheckboxTheme(
      tokens: tokens ?? this.tokens,
      colors: colors ?? this.colors,
      properties: properties ?? this.properties,
    );
  }

  @override
  SelenicCheckboxTheme lerp(
      ThemeExtension<SelenicCheckboxTheme>? other, double t) {
    if (other is! SelenicCheckboxTheme) return this;

    return SelenicCheckboxTheme(
      tokens: tokens.lerp(other.tokens, t),
      colors: colors.lerp(other.colors, t),
      properties: properties.lerp(other.properties, t),
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder diagnosticProperties) {
    super.debugFillProperties(diagnosticProperties);
    diagnosticProperties
      ..add(DiagnosticsProperty("type", "SelenicCheckboxTheme"))
      ..add(DiagnosticsProperty<SelenicTokens>("tokens", tokens))
      ..add(DiagnosticsProperty<SelenicCheckboxColors>("colors", colors))
      ..add(
        DiagnosticsProperty<SelenicCheckboxProperties>(
            "properties", properties),
      );
  }
}
