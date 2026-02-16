import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:selenic_design/src/theme/progress_pin/progress_pin_colors.dart';
import 'package:selenic_design/src/theme/progress_pin/progress_pin_properties.dart';
import 'package:selenic_design/src/theme/tokens/tokens.dart';

@immutable
class SelenicProgressPinTheme extends ThemeExtension<SelenicProgressPinTheme>
    with DiagnosticableTreeMixin {
  /// The tokens of the Selenic Design System.
  final SelenicTokens tokens;

  /// The colors of the SelenicProgressPin.
  final SelenicProgressPinColors colors;

  /// The properties of the SelenicProgressPin.
  final SelenicProgressPinProperties properties;

  SelenicProgressPinTheme({
    required this.tokens,
    SelenicProgressPinColors? colors,
    SelenicProgressPinProperties? properties,
  })  : colors = colors ??
            SelenicProgressPinColors(
              pinColor: tokens.colors.popo,
              pinBorderColor: tokens.colors.goten,
              thumbColor: tokens.colors.goten,
              shadowColor: tokens.colors.popo,
              textColor: tokens.colors.goten,
            ),
        properties = properties ??
            SelenicProgressPinProperties(
              arrowHeight: 6,
              arrowWidth: tokens.sizes.x4s,
              pinDistance: tokens.sizes.x5s,
              pinWidth: 36,
              pinBorderWidth: tokens.sizes.x6s,
              shadowElevation: 6,
              textStyle: tokens.typography.body.text10,
            );

  @override
  SelenicProgressPinTheme copyWith({
    SelenicTokens? tokens,
    SelenicProgressPinColors? colors,
    SelenicProgressPinProperties? properties,
  }) {
    return SelenicProgressPinTheme(
      tokens: tokens ?? this.tokens,
      colors: colors ?? this.colors,
      properties: properties ?? this.properties,
    );
  }

  @override
  SelenicProgressPinTheme lerp(
    ThemeExtension<SelenicProgressPinTheme>? other,
    double t,
  ) {
    if (other is! SelenicProgressPinTheme) return this;

    return SelenicProgressPinTheme(
      tokens: tokens.lerp(other.tokens, t),
      colors: colors.lerp(other.colors, t),
      properties: properties.lerp(other.properties, t),
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder diagnosticProperties) {
    super.debugFillProperties(diagnosticProperties);
    diagnosticProperties
      ..add(DiagnosticsProperty("type", "SelenicProgressPinTheme"))
      ..add(DiagnosticsProperty<SelenicTokens>("tokens", tokens))
      ..add(DiagnosticsProperty<SelenicProgressPinColors>("colors", colors))
      ..add(
        DiagnosticsProperty<SelenicProgressPinProperties>(
          "properties",
          properties,
        ),
      );
  }
}
