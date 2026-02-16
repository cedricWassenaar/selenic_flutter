import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:selenic_design/src/theme/chip/chip_size_properties.dart';
import 'package:selenic_design/src/theme/tokens/tokens.dart';

@immutable
class SelenicChipSizes extends ThemeExtension<SelenicChipSizes>
    with DiagnosticableTreeMixin {
  /// The tokens of the Selenic Design System.
  final SelenicTokens tokens;

  /// The properties of the small SelenicChip.
  final SelenicChipSizeProperties sm;

  /// The properties of the medium SelenicChip.
  final SelenicChipSizeProperties md;

  SelenicChipSizes({
    required this.tokens,
    SelenicChipSizeProperties? sm,
    SelenicChipSizeProperties? md,
  })  : sm = sm ??
            SelenicChipSizeProperties(
              borderRadius: tokens.borders.interactiveXs,
              gap: tokens.sizes.x4s,
              height: tokens.sizes.sm,
              iconSizeValue: tokens.sizes.xs,
              padding: EdgeInsets.symmetric(horizontal: tokens.sizes.x3s),
              textStyle: tokens.typography.body.textDefault,
            ),
        md = md ??
            SelenicChipSizeProperties(
              borderRadius: tokens.borders.interactiveSm,
              gap: tokens.sizes.x4s,
              height: tokens.sizes.md,
              iconSizeValue: tokens.sizes.xs,
              padding: EdgeInsets.symmetric(horizontal: tokens.sizes.x2s),
              textStyle: tokens.typography.body.textDefault,
            );

  @override
  SelenicChipSizes copyWith({
    SelenicTokens? tokens,
    SelenicChipSizeProperties? sm,
    SelenicChipSizeProperties? md,
  }) {
    return SelenicChipSizes(
      tokens: tokens ?? this.tokens,
      sm: sm ?? this.sm,
      md: md ?? this.md,
    );
  }

  @override
  SelenicChipSizes lerp(ThemeExtension<SelenicChipSizes>? other, double t) {
    if (other is! SelenicChipSizes) return this;

    return SelenicChipSizes(
      tokens: tokens.lerp(other.tokens, t),
      sm: sm.lerp(other.sm, t),
      md: md.lerp(other.md, t),
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty("type", "SelenicChipSizes"))
      ..add(DiagnosticsProperty<SelenicTokens>("tokens", tokens))
      ..add(DiagnosticsProperty<SelenicChipSizeProperties>("sm", sm))
      ..add(DiagnosticsProperty<SelenicChipSizeProperties>("md", md));
  }
}
