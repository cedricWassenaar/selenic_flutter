import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:selenic_design/src/theme/button/button_size_properties.dart';
import 'package:selenic_design/src/theme/tokens/tokens.dart';

@immutable
class SelenicButtonSizes extends ThemeExtension<SelenicButtonSizes>
    with DiagnosticableTreeMixin {
  /// The tokens of the Selenic Design System.
  final SelenicTokens tokens;

  /// The properties of the extra small SelenicButton.
  final SelenicButtonSizeProperties xs;

  /// The properties of the small SelenicButton.
  final SelenicButtonSizeProperties sm;

  /// The properties of the medium SelenicButton.
  final SelenicButtonSizeProperties md;

  /// The properties of the large SelenicButton.
  final SelenicButtonSizeProperties lg;

  /// The properties of the extra large SelenicButton.
  final SelenicButtonSizeProperties xl;

  SelenicButtonSizes({
    required this.tokens,
    SelenicButtonSizeProperties? xs,
    SelenicButtonSizeProperties? sm,
    SelenicButtonSizeProperties? md,
    SelenicButtonSizeProperties? lg,
    SelenicButtonSizeProperties? xl,
  })  : xs = xs ??
            SelenicButtonSizeProperties(
              borderRadius: tokens.borders.interactiveXs,
              gap: tokens.sizes.x5s,
              height: tokens.sizes.xs,
              iconSizeValue: tokens.sizes.x2s,
              padding: EdgeInsets.symmetric(horizontal: tokens.sizes.x4s),
              textStyle: tokens.typography.heading.text12,
            ),
        sm = sm ??
            SelenicButtonSizeProperties(
              borderRadius: tokens.borders.interactiveSm,
              gap: tokens.sizes.x5s,
              height: tokens.sizes.sm,
              iconSizeValue: tokens.sizes.xs,
              padding: EdgeInsets.symmetric(horizontal: tokens.sizes.x3s),
              textStyle: tokens.typography.heading.textDefault,
            ),
        md = md ??
            SelenicButtonSizeProperties(
              borderRadius: tokens.borders.interactiveSm,
              gap: tokens.sizes.x4s,
              height: tokens.sizes.md,
              iconSizeValue: tokens.sizes.xs,
              padding: EdgeInsets.symmetric(horizontal: tokens.sizes.x2s),
              textStyle: tokens.typography.heading.textDefault,
            ),
        lg = lg ??
            SelenicButtonSizeProperties(
              borderRadius: tokens.borders.interactiveSm,
              gap: tokens.sizes.x3s,
              height: tokens.sizes.lg,
              iconSizeValue: tokens.sizes.xs,
              padding: EdgeInsets.symmetric(horizontal: tokens.sizes.x2s),
              textStyle: tokens.typography.heading.text16,
            ),
        xl = xl ??
            SelenicButtonSizeProperties(
              borderRadius: tokens.borders.interactiveMd,
              gap: tokens.sizes.x2s,
              height: tokens.sizes.xl,
              iconSizeValue: tokens.sizes.xs,
              padding: EdgeInsets.symmetric(horizontal: tokens.sizes.xs),
              textStyle: tokens.typography.heading.text16,
            );

  @override
  SelenicButtonSizes copyWith({
    SelenicTokens? tokens,
    SelenicButtonSizeProperties? xs,
    SelenicButtonSizeProperties? sm,
    SelenicButtonSizeProperties? md,
    SelenicButtonSizeProperties? lg,
    SelenicButtonSizeProperties? xl,
  }) {
    return SelenicButtonSizes(
      tokens: tokens ?? this.tokens,
      xs: xs ?? this.xs,
      sm: sm ?? this.sm,
      md: md ?? this.md,
      lg: lg ?? this.lg,
      xl: xl ?? this.xl,
    );
  }

  @override
  SelenicButtonSizes lerp(ThemeExtension<SelenicButtonSizes>? other, double t) {
    if (other is! SelenicButtonSizes) return this;

    return SelenicButtonSizes(
      tokens: tokens.lerp(other.tokens, t),
      xs: xs.lerp(other.xs, t),
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
      ..add(DiagnosticsProperty("type", "SelenicButtonSizes"))
      ..add(DiagnosticsProperty<SelenicTokens>("tokens", tokens))
      ..add(DiagnosticsProperty<SelenicButtonSizeProperties>("xs", xs))
      ..add(DiagnosticsProperty<SelenicButtonSizeProperties>("sm", sm))
      ..add(DiagnosticsProperty<SelenicButtonSizeProperties>("md", md))
      ..add(DiagnosticsProperty<SelenicButtonSizeProperties>("lg", lg))
      ..add(DiagnosticsProperty<SelenicButtonSizeProperties>("xl", xl));
  }
}
