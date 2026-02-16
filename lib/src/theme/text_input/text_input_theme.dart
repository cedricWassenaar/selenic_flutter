import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:selenic_design/src/theme/text_input/text_input_colors.dart';
import 'package:selenic_design/src/theme/text_input/text_input_properties.dart';
import 'package:selenic_design/src/theme/text_input/text_input_sizes.dart';
import 'package:selenic_design/src/theme/tokens/tokens.dart';

@immutable
class SelenicTextInputTheme extends ThemeExtension<SelenicTextInputTheme>
    with DiagnosticableTreeMixin {
  /// The tokens of the Selenic Design System.
  final SelenicTokens tokens;

  /// The colors of the SelenicTextInput.
  final SelenicTextInputColors colors;

  /// The properties of the SelenicTextInput.
  final SelenicTextInputProperties properties;

  /// The sizes of the SelenicTextInput.
  final SelenicTextInputSizes sizes;

  SelenicTextInputTheme({
    required this.tokens,
    SelenicTextInputColors? colors,
    SelenicTextInputProperties? properties,
    SelenicTextInputSizes? sizes,
  })  : colors = colors ??
            SelenicTextInputColors(
              backgroundColor: tokens.colors.goku,
              activeBorderColor: tokens.colors.piccolo,
              inactiveBorderColor: tokens.colors.beerus,
              errorColor: tokens.colors.chichi,
              hoverBorderColor: tokens.colors.beerus,
              textColor: tokens.colors.textPrimary,
              helperTextColor: tokens.colors.textSecondary,
            ),
        properties = properties ??
            SelenicTextInputProperties(
              // The duration value extracted from:
              // https://github.com/material-components/material-components-android/blob/master/lib/java/com/google/android/material/textfield/TextInputLayout.java
              transitionDuration: const Duration(milliseconds: 167),
              transitionCurve: Curves.fastOutSlowIn,
              helperPadding: EdgeInsets.only(top: tokens.sizes.x4s),
              helperTextStyle: tokens.typography.body.text12,
            ),
        sizes = sizes ?? SelenicTextInputSizes(tokens: tokens);

  @override
  SelenicTextInputTheme copyWith({
    SelenicTokens? tokens,
    SelenicTextInputColors? colors,
    SelenicTextInputProperties? properties,
    SelenicTextInputSizes? sizes,
  }) {
    return SelenicTextInputTheme(
      tokens: tokens ?? this.tokens,
      colors: colors ?? this.colors,
      properties: properties ?? this.properties,
      sizes: sizes ?? this.sizes,
    );
  }

  @override
  SelenicTextInputTheme lerp(
      ThemeExtension<SelenicTextInputTheme>? other, double t) {
    if (other is! SelenicTextInputTheme) return this;

    return SelenicTextInputTheme(
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
      ..add(
        DiagnosticsProperty("type", "SelenicTextInputTheme"),
      )
      ..add(
        DiagnosticsProperty<SelenicTokens>("tokens", tokens),
      )
      ..add(
        DiagnosticsProperty<SelenicTextInputColors>("colors", colors),
      )
      ..add(
        DiagnosticsProperty<SelenicTextInputProperties>(
            "properties", properties),
      )
      ..add(
        DiagnosticsProperty<SelenicTextInputSizes>("sizes", sizes),
      );
  }
}
