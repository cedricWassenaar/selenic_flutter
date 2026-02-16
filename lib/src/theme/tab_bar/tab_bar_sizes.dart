import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:selenic_design/src/theme/tab_bar/tab_bar_size_properties.dart';
import 'package:selenic_design/src/theme/tokens/tokens.dart';

@immutable
class SelenicTabBarSizes extends ThemeExtension<SelenicTabBarSizes>
    with DiagnosticableTreeMixin {
  /// The tokens of the Selenic Design System.
  final SelenicTokens tokens;

  /// The properties of the small SelenicTabBar.
  final SelenicTabBarSizeProperties sm;

  /// The properties of the medium SelenicTabBar.
  final SelenicTabBarSizeProperties md;

  SelenicTabBarSizes({
    required this.tokens,
    SelenicTabBarSizeProperties? sm,
    SelenicTabBarSizeProperties? md,
  })  : sm = sm ??
            SelenicTabBarSizeProperties(
              borderRadius: tokens.borders.interactiveXs,
              tabGap: tokens.sizes.x5s,
              height: tokens.sizes.sm,
              iconSizeValue: tokens.sizes.xs,
              indicatorHeight: tokens.sizes.x6s,
              tabPadding: EdgeInsets.symmetric(horizontal: tokens.sizes.x3s),
              textStyle: tokens.typography.heading.textDefault,
            ),
        md = md ??
            SelenicTabBarSizeProperties(
              borderRadius: tokens.borders.interactiveSm,
              tabGap: tokens.sizes.x4s,
              height: tokens.sizes.md,
              iconSizeValue: tokens.sizes.xs,
              indicatorHeight: tokens.sizes.x6s,
              tabPadding: EdgeInsets.symmetric(horizontal: tokens.sizes.x2s),
              textStyle: tokens.typography.heading.textDefault,
            );

  @override
  SelenicTabBarSizes copyWith({
    SelenicTokens? tokens,
    SelenicTabBarSizeProperties? sm,
    SelenicTabBarSizeProperties? md,
  }) {
    return SelenicTabBarSizes(
      tokens: tokens ?? this.tokens,
      sm: sm ?? this.sm,
      md: md ?? this.md,
    );
  }

  @override
  SelenicTabBarSizes lerp(ThemeExtension<SelenicTabBarSizes>? other, double t) {
    if (other is! SelenicTabBarSizes) return this;

    return SelenicTabBarSizes(
      tokens: tokens.lerp(other.tokens, t),
      sm: sm.lerp(other.sm, t),
      md: md.lerp(other.md, t),
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty("type", "SelenicTabBarSizes"))
      ..add(DiagnosticsProperty<SelenicTabBarSizeProperties>("sm", sm))
      ..add(DiagnosticsProperty<SelenicTabBarSizeProperties>("md", md));
  }
}
