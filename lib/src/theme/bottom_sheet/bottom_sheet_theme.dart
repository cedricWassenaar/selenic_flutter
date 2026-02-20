import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:selenic_design/src/theme/bottom_sheet/bottom_sheet_colors.dart';
import 'package:selenic_design/src/theme/bottom_sheet/bottom_sheet_properties.dart';
import 'package:selenic_design/src/theme/tokens/tokens.dart';

@immutable
class SelenicBottomSheetTheme extends ThemeExtension<SelenicBottomSheetTheme>
    with DiagnosticableTreeMixin {
  /// The tokens of the Selenic Design System.
  final SelenicTokens tokens;

  /// The colors of the SelenicBottomSheet.
  final SelenicBottomSheetColors colors;

  /// The properties of the SelenicBottomSheet.
  final SelenicBottomSheetProperties properties;

  SelenicBottomSheetTheme({
    required this.tokens,
    SelenicBottomSheetColors? colors,
    SelenicBottomSheetProperties? properties,
  })  : colors = colors ??
            SelenicBottomSheetColors(
              textColor: tokens.colors.textPrimary,
              iconColor: tokens.colors.iconPrimary,
              backgroundColor: tokens.colors.backgroundPrimary,
              barrierColor: tokens.colors.overlayModal,
            ),
        properties = properties ??
            SelenicBottomSheetProperties(
              borderRadius: tokens.borders.surfaceLg,
              transitionDuration: const Duration(milliseconds: 350),
              transitionCurve: const Cubic(0.0, 0.0, 0.2, 1.0),
              textStyle: tokens.typography.body.textDefault,
            );

  @override
  SelenicBottomSheetTheme copyWith({
    SelenicTokens? tokens,
    SelenicBottomSheetColors? colors,
    SelenicBottomSheetProperties? properties,
  }) {
    return SelenicBottomSheetTheme(
      tokens: tokens ?? this.tokens,
      colors: colors ?? this.colors,
      properties: properties ?? this.properties,
    );
  }

  @override
  SelenicBottomSheetTheme lerp(
    ThemeExtension<SelenicBottomSheetTheme>? other,
    double t,
  ) {
    if (other is! SelenicBottomSheetTheme) return this;

    return SelenicBottomSheetTheme(
      tokens: tokens.lerp(other.tokens, t),
      colors: colors.lerp(other.colors, t),
      properties: properties.lerp(other.properties, t),
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder diagnosticProperties) {
    super.debugFillProperties(diagnosticProperties);
    diagnosticProperties
      ..add(DiagnosticsProperty("type", "SelenicBottomSheetTheme"))
      ..add(DiagnosticsProperty<SelenicTokens>("tokens", tokens))
      ..add(DiagnosticsProperty<SelenicBottomSheetColors>("colors", colors))
      ..add(
        DiagnosticsProperty<SelenicBottomSheetProperties>(
          "properties",
          properties,
        ),
      );
  }
}
