import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:selenic_design/src/theme/accordion/accordion_size_properties.dart';
import 'package:selenic_design/src/theme/tokens/tokens.dart';

@immutable
class SelenicAccordionSizes extends ThemeExtension<SelenicAccordionSizes>
    with DiagnosticableTreeMixin {
  /// The tokens of the Selenic Design System.
  final SelenicTokens tokens;

  /// The properties of the small SelenicAccordion.
  final SelenicAccordionSizeProperties sm;

  /// The properties of the medium SelenicAccordion.
  final SelenicAccordionSizeProperties md;

  /// The properties of the large SelenicAccordion.
  final SelenicAccordionSizeProperties lg;

  /// The properties of the extra large SelenicAccordion.
  final SelenicAccordionSizeProperties xl;

  SelenicAccordionSizes({
    required this.tokens,
    SelenicAccordionSizeProperties? sm,
    SelenicAccordionSizeProperties? md,
    SelenicAccordionSizeProperties? lg,
    SelenicAccordionSizeProperties? xl,
  })  : sm = sm ??
            SelenicAccordionSizeProperties(
              borderRadius: tokens.borders.interactiveSm,
              headerHeight: tokens.sizes.sm,
              iconSizeValue: tokens.sizes.x2s,
              headerPadding: EdgeInsets.symmetric(horizontal: tokens.sizes.x4s),
              headerTextStyle: tokens.typography.heading.text12,
              contentTextStyle: tokens.typography.body.text12,
            ),
        md = md ??
            SelenicAccordionSizeProperties(
              borderRadius: tokens.borders.interactiveSm,
              headerHeight: tokens.sizes.md,
              iconSizeValue: tokens.sizes.xs,
              headerPadding: EdgeInsets.symmetric(horizontal: tokens.sizes.x3s),
              headerTextStyle: tokens.typography.heading.textDefault,
              contentTextStyle: tokens.typography.body.textDefault,
            ),
        lg = lg ??
            SelenicAccordionSizeProperties(
              borderRadius: tokens.borders.interactiveSm,
              headerHeight: tokens.sizes.lg,
              iconSizeValue: tokens.sizes.xs,
              headerPadding: EdgeInsets.symmetric(horizontal: tokens.sizes.x3s),
              headerTextStyle: tokens.typography.heading.textDefault,
              contentTextStyle: tokens.typography.body.textDefault,
            ),
        xl = xl ??
            SelenicAccordionSizeProperties(
              borderRadius: tokens.borders.interactiveSm,
              headerHeight: tokens.sizes.xl,
              iconSizeValue: tokens.sizes.xs,
              headerPadding: EdgeInsets.symmetric(horizontal: tokens.sizes.x2s),
              headerTextStyle: tokens.typography.heading.text16,
              contentTextStyle: tokens.typography.body.textDefault,
            );

  @override
  SelenicAccordionSizes copyWith({
    SelenicTokens? tokens,
    SelenicAccordionSizeProperties? sm,
    SelenicAccordionSizeProperties? md,
    SelenicAccordionSizeProperties? lg,
    SelenicAccordionSizeProperties? xl,
  }) {
    return SelenicAccordionSizes(
      tokens: tokens ?? this.tokens,
      sm: sm ?? this.sm,
      md: md ?? this.md,
      lg: lg ?? this.lg,
      xl: xl ?? this.xl,
    );
  }

  @override
  SelenicAccordionSizes lerp(
      ThemeExtension<SelenicAccordionSizes>? other, double t) {
    if (other is! SelenicAccordionSizes) return this;

    return SelenicAccordionSizes(
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
      ..add(DiagnosticsProperty("type", "SelenicAccordionSizes"))
      ..add(DiagnosticsProperty<SelenicTokens>("tokens", tokens))
      ..add(DiagnosticsProperty<SelenicAccordionSizeProperties>("sm", sm))
      ..add(DiagnosticsProperty<SelenicAccordionSizeProperties>("md", md))
      ..add(DiagnosticsProperty<SelenicAccordionSizeProperties>("lg", lg))
      ..add(DiagnosticsProperty<SelenicAccordionSizeProperties>("xl", xl));
  }
}
