import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:selenic_design/src/theme/text_input/text_input_size_properties.dart';
import 'package:selenic_design/src/theme/tokens/tokens.dart';

@immutable
class SelenicTextInputSizes extends ThemeExtension<SelenicTextInputSizes>
    with DiagnosticableTreeMixin {
  /// The tokens of the Selenic Design System.
  final SelenicTokens tokens;

  /// The properties of the small SelenicTextInput.
  final SelenicTextInputSizeProperties sm;

  /// The properties of the medium SelenicTextInput.
  final SelenicTextInputSizeProperties md;

  /// The properties of the large SelenicTextInput.
  final SelenicTextInputSizeProperties lg;

  /// The properties of the extra large SelenicTextInput.
  final SelenicTextInputSizeProperties xl;

  SelenicTextInputSizes({
    required this.tokens,
    SelenicTextInputSizeProperties? sm,
    SelenicTextInputSizeProperties? md,
    SelenicTextInputSizeProperties? lg,
    SelenicTextInputSizeProperties? xl,
  })  : sm = sm ??
            SelenicTextInputSizeProperties(
              borderRadius: tokens.borders.interactiveXs,
              height: tokens.sizes.sm,
              gap: tokens.sizes.x4s,
              iconSizeValue: tokens.sizes.xs,
              padding: EdgeInsets.symmetric(
                horizontal: tokens.sizes.x4s,
                vertical: tokens.sizes.x6s,
              ),
              textStyle: tokens.typography.body.textDefault,
            ),
        md = md ??
            SelenicTextInputSizeProperties(
              borderRadius: tokens.borders.interactiveSm,
              height: tokens.sizes.md,
              gap: tokens.sizes.x4s,
              iconSizeValue: tokens.sizes.xs,
              padding: EdgeInsets.symmetric(
                horizontal: tokens.sizes.x3s,
                vertical: tokens.sizes.x5s,
              ),
              textStyle: tokens.typography.body.textDefault,
            ),
        lg = lg ??
            SelenicTextInputSizeProperties(
              borderRadius: tokens.borders.interactiveSm,
              height: tokens.sizes.lg,
              gap: tokens.sizes.x4s,
              iconSizeValue: tokens.sizes.xs,
              padding: EdgeInsets.symmetric(
                horizontal: tokens.sizes.x3s,
                vertical: 6,
              ),
              textStyle: tokens.typography.body.text16,
            ),
        xl = xl ??
            SelenicTextInputSizeProperties(
              borderRadius: tokens.borders.interactiveSm,
              height: tokens.sizes.xl,
              gap: tokens.sizes.x2s,
              iconSizeValue: tokens.sizes.xs,
              padding: EdgeInsets.symmetric(
                horizontal: tokens.sizes.x2s,
                vertical: 9,
              ),
              textStyle: tokens.typography.body.text16,
            );

  @override
  SelenicTextInputSizes copyWith({
    SelenicTokens? tokens,
    SelenicTextInputSizeProperties? sm,
    SelenicTextInputSizeProperties? md,
    SelenicTextInputSizeProperties? lg,
    SelenicTextInputSizeProperties? xl,
  }) {
    return SelenicTextInputSizes(
      tokens: tokens ?? this.tokens,
      sm: sm ?? this.sm,
      md: md ?? this.md,
      lg: lg ?? this.lg,
      xl: xl ?? this.xl,
    );
  }

  @override
  SelenicTextInputSizes lerp(
      ThemeExtension<SelenicTextInputSizes>? other, double t) {
    if (other is! SelenicTextInputSizes) return this;

    return SelenicTextInputSizes(
      tokens: tokens.lerp(other.tokens, t),
      sm: sm.lerp(other.sm, t),
      md: md.lerp(other.md, t),
      lg: lg.lerp(other.lg, t),
      xl: xl.lerp(other.xl, t),
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty("type", "SelenicTextInputSizes"))
      ..add(DiagnosticsProperty<SelenicTokens>("tokens", tokens))
      ..add(DiagnosticsProperty<SelenicTextInputSizeProperties>("sm", sm))
      ..add(DiagnosticsProperty<SelenicTextInputSizeProperties>("md", md))
      ..add(DiagnosticsProperty<SelenicTextInputSizeProperties>("lg", lg))
      ..add(DiagnosticsProperty<SelenicTextInputSizeProperties>("xl", xl));
  }
}
