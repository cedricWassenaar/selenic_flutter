import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:selenic_design/src/theme/tag/tag_size_properties.dart';
import 'package:selenic_design/src/theme/tokens/tokens.dart';

@immutable
class SelenicTagSizes extends ThemeExtension<SelenicTagSizes>
    with DiagnosticableTreeMixin {
  /// The tokens of the Selenic Design System.
  final SelenicTokens tokens;

  /// The properties of the (2x) extra small SelenicTag.
  final SelenicTagSizeProperties x2s;

  /// The properties of the extra small SelenicTag.
  final SelenicTagSizeProperties xs;

  /// The properties of the small SelenicTag.
  final SelenicTagSizeProperties sm;

  SelenicTagSizes({
    required this.tokens,
    SelenicTagSizeProperties? x2s,
    SelenicTagSizeProperties? xs,
    SelenicTagSizeProperties? sm,
  })  : x2s = x2s ??
            SelenicTagSizeProperties(
              borderRadius: tokens.borders.interactiveXs,
              gap: tokens.sizes.x6s,
              height: tokens.sizes.x2s,
              iconSizeValue: tokens.sizes.x3s,
              padding: EdgeInsets.symmetric(horizontal: tokens.sizes.x4s),
              textStyle: tokens.typography.body.text9,
            ),
        xs = xs ??
            SelenicTagSizeProperties(
              borderRadius: tokens.borders.interactiveXs,
              gap: tokens.sizes.x6s,
              height: tokens.sizes.xs,
              iconSizeValue: tokens.sizes.x2s,
              padding: EdgeInsets.symmetric(horizontal: tokens.sizes.x4s),
              textStyle: tokens.typography.body.text12,
            ),
        sm = sm ??
            SelenicTagSizeProperties(
              borderRadius: tokens.borders.interactiveSm,
              gap: tokens.sizes.x4s,
              height: tokens.sizes.sm,
              iconSizeValue: tokens.sizes.x2s,
              padding: EdgeInsets.symmetric(horizontal: tokens.sizes.x2s),
              textStyle: tokens.typography.body.text12,
            );

  @override
  SelenicTagSizes copyWith({
    SelenicTokens? tokens,
    SelenicTagSizeProperties? x2s,
    SelenicTagSizeProperties? xs,
    SelenicTagSizeProperties? sm,
  }) {
    return SelenicTagSizes(
      tokens: tokens ?? this.tokens,
      x2s: x2s ?? this.x2s,
      xs: xs ?? this.xs,
      sm: sm ?? this.sm,
    );
  }

  @override
  SelenicTagSizes lerp(ThemeExtension<SelenicTagSizes>? other, double t) {
    if (other is! SelenicTagSizes) return this;

    return SelenicTagSizes(
      tokens: tokens.lerp(other.tokens, t),
      x2s: x2s.lerp(other.x2s, t),
      xs: xs.lerp(other.xs, t),
      sm: sm.lerp(other.sm, t),
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty("type", "SelenicTagSizes"))
      ..add(DiagnosticsProperty<SelenicTokens>("tokens", tokens))
      ..add(DiagnosticsProperty<SelenicTagSizeProperties>("x2s", x2s))
      ..add(DiagnosticsProperty<SelenicTagSizeProperties>("xs", xs))
      ..add(DiagnosticsProperty<SelenicTagSizeProperties>("sm", sm));
  }
}
