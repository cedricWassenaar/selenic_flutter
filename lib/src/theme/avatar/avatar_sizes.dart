import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:selenic_design/src/theme/avatar/avatar_size_properties.dart';
import 'package:selenic_design/src/theme/tokens/tokens.dart';

@immutable
class SelenicAvatarSizes extends ThemeExtension<SelenicAvatarSizes>
    with DiagnosticableTreeMixin {
  /// The tokens of the Selenic Design System.
  final SelenicTokens tokens;

  /// The properties of the extra small SelenicAvatar.
  final SelenicAvatarSizeProperties xs;

  /// The properties of the small SelenicAvatar.
  final SelenicAvatarSizeProperties sm;

  /// The properties of the medium SelenicAvatar.
  final SelenicAvatarSizeProperties md;

  /// The properties of the large SelenicAvatar.
  final SelenicAvatarSizeProperties lg;

  /// The properties of the extra large SelenicAvatar.
  final SelenicAvatarSizeProperties xl;

  /// The properties of the (2x) extra large SelenicAvatar.
  final SelenicAvatarSizeProperties x2l;

  SelenicAvatarSizes({
    required this.tokens,
    SelenicAvatarSizeProperties? xs,
    SelenicAvatarSizeProperties? sm,
    SelenicAvatarSizeProperties? md,
    SelenicAvatarSizeProperties? lg,
    SelenicAvatarSizeProperties? xl,
    SelenicAvatarSizeProperties? x2l,
  })  : xs = xs ??
            SelenicAvatarSizeProperties(
              borderRadius: tokens.borders.interactiveXs,
              avatarSizeValue: tokens.sizes.xs,
              badgeMarginValue:
                  tokens.sizes.xs * tokens.sizes.x5s / tokens.sizes.x2l,
              badgeSizeValue:
                  tokens.sizes.xs * tokens.sizes.x3s / tokens.sizes.x2l,
              textStyle: tokens.typography.heading.text10,
            ),
        sm = sm ??
            SelenicAvatarSizeProperties(
              borderRadius: tokens.borders.interactiveSm,
              avatarSizeValue: tokens.sizes.sm,
              badgeMarginValue:
                  tokens.sizes.sm * tokens.sizes.x5s / tokens.sizes.x2l,
              badgeSizeValue:
                  tokens.sizes.sm * tokens.sizes.x3s / tokens.sizes.x2l,
              textStyle: tokens.typography.heading.text12,
            ),
        md = md ??
            SelenicAvatarSizeProperties(
              borderRadius: tokens.borders.interactiveSm,
              avatarSizeValue: tokens.sizes.md,
              badgeMarginValue:
                  tokens.sizes.md * tokens.sizes.x5s / tokens.sizes.x2l,
              badgeSizeValue:
                  tokens.sizes.md * tokens.sizes.x3s / tokens.sizes.x2l,
              textStyle: tokens.typography.heading.textDefault,
            ),
        lg = lg ??
            SelenicAvatarSizeProperties(
              borderRadius: tokens.borders.interactiveSm,
              avatarSizeValue: tokens.sizes.lg,
              badgeMarginValue:
                  tokens.sizes.lg * tokens.sizes.x5s / tokens.sizes.x2l,
              badgeSizeValue:
                  tokens.sizes.lg * tokens.sizes.x3s / tokens.sizes.x2l,
              textStyle: tokens.typography.heading.text16,
            ),
        xl = xl ??
            SelenicAvatarSizeProperties(
              borderRadius: tokens.borders.interactiveMd,
              avatarSizeValue: tokens.sizes.xl,
              badgeMarginValue:
                  tokens.sizes.xl * tokens.sizes.x5s / tokens.sizes.x2l,
              badgeSizeValue:
                  tokens.sizes.xl * tokens.sizes.x3s / tokens.sizes.x2l,
              textStyle: tokens.typography.heading.text16,
            ),
        x2l = x2l ??
            SelenicAvatarSizeProperties(
              borderRadius: tokens.borders.interactiveMd,
              avatarSizeValue: tokens.sizes.x2l,
              badgeMarginValue:
                  tokens.sizes.x2l * tokens.sizes.x5s / tokens.sizes.x2l,
              badgeSizeValue:
                  tokens.sizes.x2l * tokens.sizes.x3s / tokens.sizes.x2l,
              textStyle: tokens.typography.heading.text20,
            );

  @override
  SelenicAvatarSizes copyWith({
    SelenicTokens? tokens,
    SelenicAvatarSizeProperties? xs,
    SelenicAvatarSizeProperties? sm,
    SelenicAvatarSizeProperties? md,
    SelenicAvatarSizeProperties? lg,
    SelenicAvatarSizeProperties? xl,
    SelenicAvatarSizeProperties? x2l,
  }) {
    return SelenicAvatarSizes(
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
  SelenicAvatarSizes lerp(ThemeExtension<SelenicAvatarSizes>? other, double t) {
    if (other is! SelenicAvatarSizes) return this;

    return SelenicAvatarSizes(
      tokens: tokens,
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
      ..add(DiagnosticsProperty("type", "SelenicAvatarSizes"))
      ..add(DiagnosticsProperty<SelenicTokens>("tokens", tokens))
      ..add(DiagnosticsProperty<SelenicAvatarSizeProperties>("xs", xs))
      ..add(DiagnosticsProperty<SelenicAvatarSizeProperties>("sm", sm))
      ..add(DiagnosticsProperty<SelenicAvatarSizeProperties>("md", md))
      ..add(DiagnosticsProperty<SelenicAvatarSizeProperties>("lg", lg))
      ..add(DiagnosticsProperty<SelenicAvatarSizeProperties>("xl", xl))
      ..add(DiagnosticsProperty<SelenicAvatarSizeProperties>("x2l", x2l));
  }
}
