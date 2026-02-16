import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:selenic_design/src/theme/switch/switch_size_properties.dart';
import 'package:selenic_design/src/theme/tokens/tokens.dart';

@immutable
class SelenicSwitchSizes extends ThemeExtension<SelenicSwitchSizes>
    with DiagnosticableTreeMixin {
  /// The tokens of the Selenic Design System.
  final SelenicTokens tokens;

  /// The properties of the (2x) extra small SelenicSwitch.
  final SelenicSwitchSizeProperties x2s;

  /// The properties of the extra small SelenicSwitch.
  final SelenicSwitchSizeProperties xs;

  /// The properties of the small SelenicSwitch.
  final SelenicSwitchSizeProperties sm;

  SelenicSwitchSizes({
    required this.tokens,
    SelenicSwitchSizeProperties? x2s,
    SelenicSwitchSizeProperties? xs,
    SelenicSwitchSizeProperties? sm,
  })  : x2s = x2s ??
            SelenicSwitchSizeProperties(
              height: tokens.sizes.x2s,
              width: 2 * tokens.sizes.x3s + 2 * tokens.sizes.x5s,
              thumbSizeValue: tokens.sizes.x3s,
              iconSizeValue: tokens.sizes.x3s,
              padding: EdgeInsets.all(tokens.sizes.x6s),
              textStyle:
                  tokens.typography.body.text6.copyWith(letterSpacing: 0),
            ),
        xs = xs ??
            SelenicSwitchSizeProperties(
              height: tokens.sizes.xs,
              width: 2 * tokens.sizes.x2s + 3 * tokens.sizes.x5s,
              thumbSizeValue: tokens.sizes.x2s,
              iconSizeValue: tokens.sizes.x2s,
              padding: EdgeInsets.all(tokens.sizes.x5s),
              textStyle:
                  tokens.typography.body.text8.copyWith(letterSpacing: 0.1),
            ),
        sm = sm ??
            SelenicSwitchSizeProperties(
              height: tokens.sizes.sm,
              width: 2 * tokens.sizes.xs + 3 * tokens.sizes.x5s,
              thumbSizeValue: tokens.sizes.xs,
              iconSizeValue: tokens.sizes.xs,
              padding: EdgeInsets.all(tokens.sizes.x5s),
              textStyle:
                  tokens.typography.body.text10.copyWith(letterSpacing: 0.1),
            );

  @override
  SelenicSwitchSizes copyWith({
    SelenicTokens? tokens,
    SelenicSwitchSizeProperties? x2s,
    SelenicSwitchSizeProperties? xs,
    SelenicSwitchSizeProperties? sm,
  }) {
    return SelenicSwitchSizes(
      tokens: tokens ?? this.tokens,
      x2s: x2s ?? this.x2s,
      xs: xs ?? this.xs,
      sm: sm ?? this.sm,
    );
  }

  @override
  SelenicSwitchSizes lerp(ThemeExtension<SelenicSwitchSizes>? other, double t) {
    if (other is! SelenicSwitchSizes) return this;

    return SelenicSwitchSizes(
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
      ..add(DiagnosticsProperty("type", "SelenicSwitchSizes"))
      ..add(DiagnosticsProperty<SelenicTokens>("tokens", tokens))
      ..add(DiagnosticsProperty<SelenicSwitchSizeProperties>("x2s", x2s))
      ..add(DiagnosticsProperty<SelenicSwitchSizeProperties>("xs", xs))
      ..add(DiagnosticsProperty<SelenicSwitchSizeProperties>("sm", sm));
  }
}
