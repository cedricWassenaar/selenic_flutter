import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:selenic_design/src/theme/table/table_size_properties.dart';
import 'package:selenic_design/src/theme/tokens/tokens.dart';

@immutable
class SelenicTableSizes extends ThemeExtension<SelenicTableSizes>
    with DiagnosticableTreeMixin {
  /// The tokens of the Selenic Design System.
  final SelenicTokens tokens;

  /// The properties of the extra small SelenicTable.
  final SelenicTableSizeProperties xs;

  /// The properties of the small SelenicTable.
  final SelenicTableSizeProperties sm;

  /// The properties of the medium SelenicTable.
  final SelenicTableSizeProperties md;

  /// The properties of the large SelenicTable.
  final SelenicTableSizeProperties lg;

  /// The properties of the extra large SelenicTable.
  final SelenicTableSizeProperties xl;

  /// The properties of the (2x) extra large SelenicTable.
  final SelenicTableSizeProperties x2l;

  SelenicTableSizes({
    required this.tokens,
    SelenicTableSizeProperties? xs,
    SelenicTableSizeProperties? sm,
    SelenicTableSizeProperties? md,
    SelenicTableSizeProperties? lg,
    SelenicTableSizeProperties? xl,
    SelenicTableSizeProperties? x2l,
  })  : xs = xs ??
            SelenicTableSizeProperties(
              rowBorderRadius: tokens.borders.interactiveXs,
              rowGap: tokens.sizes.x5s,
              rowHeight: tokens.sizes.xs,
              sortIconSizeValue: tokens.sizes.x2s,
              sortIconGap: tokens.sizes.x5s,
              cellPadding: EdgeInsets.symmetric(horizontal: tokens.sizes.x4s),
              rowLabelPadding:
                  EdgeInsets.symmetric(horizontal: tokens.sizes.x4s),
              columnTextStyle: tokens.typography.heading.text12,
              rowTextStyle: tokens.typography.body.text12,
              rowLabelTextStyle: tokens.typography.body.text12,
              rowPinnedAnimatedLabelTextStyle: tokens.typography.body.text12,
            ),
        sm = sm ??
            SelenicTableSizeProperties(
              rowBorderRadius: tokens.borders.interactiveXs,
              rowGap: tokens.sizes.x5s,
              rowHeight: tokens.sizes.sm,
              sortIconSizeValue: tokens.sizes.x2s,
              sortIconGap: tokens.sizes.x5s,
              cellPadding: EdgeInsets.symmetric(horizontal: tokens.sizes.x3s),
              rowLabelPadding:
                  EdgeInsets.symmetric(horizontal: tokens.sizes.x3s),
              columnTextStyle: tokens.typography.heading.textDefault,
              rowTextStyle: tokens.typography.body.textDefault,
              rowLabelTextStyle: tokens.typography.body.textDefault,
              rowPinnedAnimatedLabelTextStyle:
                  tokens.typography.body.textDefault,
            ),
        md = md ??
            SelenicTableSizeProperties(
              rowBorderRadius: tokens.borders.interactiveSm,
              rowGap: tokens.sizes.x5s,
              rowHeight: tokens.sizes.md,
              sortIconSizeValue: tokens.sizes.x2s,
              sortIconGap: tokens.sizes.x5s,
              cellPadding: EdgeInsets.symmetric(horizontal: tokens.sizes.x3s),
              rowLabelPadding:
                  EdgeInsets.symmetric(horizontal: tokens.sizes.x3s),
              columnTextStyle: tokens.typography.heading.textDefault,
              rowTextStyle: tokens.typography.body.textDefault,
              rowLabelTextStyle: tokens.typography.body.textDefault,
              rowPinnedAnimatedLabelTextStyle:
                  tokens.typography.body.textDefault,
            ),
        lg = lg ??
            SelenicTableSizeProperties(
              rowBorderRadius: tokens.borders.interactiveSm,
              rowGap: tokens.sizes.x5s,
              rowHeight: tokens.sizes.lg,
              sortIconSizeValue: tokens.sizes.x2s,
              sortIconGap: tokens.sizes.x5s,
              cellPadding: EdgeInsets.symmetric(horizontal: tokens.sizes.x3s),
              rowLabelPadding:
                  EdgeInsets.symmetric(horizontal: tokens.sizes.x3s),
              columnTextStyle: tokens.typography.heading.textDefault,
              rowTextStyle: tokens.typography.body.textDefault,
              rowLabelTextStyle: tokens.typography.body.textDefault,
              rowPinnedAnimatedLabelTextStyle:
                  tokens.typography.body.textDefault,
            ),
        xl = xl ??
            SelenicTableSizeProperties(
              rowBorderRadius: tokens.borders.interactiveMd,
              rowGap: tokens.sizes.x5s,
              rowHeight: tokens.sizes.xl,
              sortIconSizeValue: tokens.sizes.x2s,
              sortIconGap: tokens.sizes.x5s,
              cellPadding: EdgeInsets.symmetric(horizontal: tokens.sizes.x3s),
              rowLabelPadding:
                  EdgeInsets.symmetric(horizontal: tokens.sizes.x3s),
              columnTextStyle: tokens.typography.heading.textDefault,
              rowTextStyle: tokens.typography.body.textDefault,
              rowLabelTextStyle: tokens.typography.body.textDefault,
              rowPinnedAnimatedLabelTextStyle:
                  tokens.typography.body.textDefault,
            ),
        x2l = x2l ??
            SelenicTableSizeProperties(
              rowBorderRadius: tokens.borders.interactiveMd,
              rowGap: tokens.sizes.x5s,
              rowHeight: tokens.sizes.x2l,
              sortIconSizeValue: tokens.sizes.x2s,
              sortIconGap: tokens.sizes.x5s,
              cellPadding: EdgeInsets.symmetric(horizontal: tokens.sizes.x3s),
              rowLabelPadding:
                  EdgeInsets.symmetric(horizontal: tokens.sizes.x3s),
              columnTextStyle: tokens.typography.heading.textDefault,
              rowTextStyle: tokens.typography.body.textDefault,
              rowLabelTextStyle: tokens.typography.body.textDefault,
              rowPinnedAnimatedLabelTextStyle:
                  tokens.typography.body.textDefault,
            );

  @override
  SelenicTableSizes copyWith({
    SelenicTokens? tokens,
    SelenicTableSizeProperties? xs,
    SelenicTableSizeProperties? sm,
    SelenicTableSizeProperties? md,
    SelenicTableSizeProperties? lg,
    SelenicTableSizeProperties? xl,
    SelenicTableSizeProperties? x2l,
  }) {
    return SelenicTableSizes(
      tokens: tokens ?? this.tokens,
      xs: xs ?? this.xs,
      sm: sm ?? this.sm,
      md: md ?? this.md,
      lg: lg ?? this.lg,
      xl: xl ?? this.xl,
      x2l: x2l ?? this.x2l,
    );
  }

  @override
  SelenicTableSizes lerp(ThemeExtension<SelenicTableSizes>? other, double t) {
    if (other is! SelenicTableSizes) return this;

    return SelenicTableSizes(
      tokens: tokens.lerp(other.tokens, t),
      xs: xs.lerp(other.xs, t),
      sm: sm.lerp(other.sm, t),
      md: md.lerp(other.md, t),
      lg: lg.lerp(other.lg, t),
      xl: xl.lerp(other.xl, t),
      x2l: x2l.lerp(other.x2l, t),
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty("type", "SelenicTableSizes"))
      ..add(DiagnosticsProperty<SelenicTokens>("tokens", tokens))
      ..add(DiagnosticsProperty<SelenicTableSizeProperties>("xs", xs))
      ..add(DiagnosticsProperty<SelenicTableSizeProperties>("sm", sm))
      ..add(DiagnosticsProperty<SelenicTableSizeProperties>("md", md))
      ..add(DiagnosticsProperty<SelenicTableSizeProperties>("lg", lg))
      ..add(DiagnosticsProperty<SelenicTableSizeProperties>("xl", xl))
      ..add(DiagnosticsProperty<SelenicTableSizeProperties>("x2l", x2l));
  }
}
