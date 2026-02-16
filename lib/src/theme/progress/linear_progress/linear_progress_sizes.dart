import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:selenic_design/src/theme/progress/linear_progress/linear_progress_size_properties.dart';
import 'package:selenic_design/src/theme/tokens/tokens.dart';

@immutable
class SelenicLinearProgressSizes
    extends ThemeExtension<SelenicLinearProgressSizes>
    with DiagnosticableTreeMixin {
  /// The tokens of the Selenic Design System.
  final SelenicTokens tokens;

  /// The properties of the (6x) extra small SelenicLinearProgress.
  final SelenicLinearProgressSizeProperties x6s;

  /// The properties of the (5x) extra small SelenicLinearProgress.
  final SelenicLinearProgressSizeProperties x5s;

  /// The properties of the (4x) extra small SelenicLinearProgress.
  final SelenicLinearProgressSizeProperties x4s;

  /// The properties of the (3x) extra small SelenicLinearProgress.
  final SelenicLinearProgressSizeProperties x3s;

  /// The properties of the (2x) extra small SelenicLinearProgress.
  final SelenicLinearProgressSizeProperties x2s;

  SelenicLinearProgressSizes({
    required this.tokens,
    SelenicLinearProgressSizeProperties? x6s,
    SelenicLinearProgressSizeProperties? x5s,
    SelenicLinearProgressSizeProperties? x4s,
    SelenicLinearProgressSizeProperties? x3s,
    SelenicLinearProgressSizeProperties? x2s,
  })  : x6s = x6s ??
            SelenicLinearProgressSizeProperties(
              borderRadius: tokens.borders.surfaceXs,
              progressHeight: tokens.sizes.x6s,
              thumbSizeValue: tokens.sizes.x3s,
              verticalGap: tokens.sizes.x4s,
              textStyle: tokens.typography.body.text10,
            ),
        x5s = x5s ??
            SelenicLinearProgressSizeProperties(
              borderRadius: tokens.borders.surfaceXs,
              progressHeight: tokens.sizes.x5s,
              thumbSizeValue: tokens.sizes.x3s,
              verticalGap: tokens.sizes.x4s,
              textStyle: tokens.typography.body.text10,
            ),
        x4s = x4s ??
            SelenicLinearProgressSizeProperties(
              borderRadius: tokens.borders.surfaceSm,
              progressHeight: tokens.sizes.x4s,
              thumbSizeValue: tokens.sizes.x3s,
              verticalGap: 6,
              textStyle: tokens.typography.body.text10,
            ),
        x3s = x3s ??
            SelenicLinearProgressSizeProperties(
              borderRadius: tokens.borders.surfaceMd,
              progressHeight: tokens.sizes.x3s,
              thumbSizeValue: tokens.sizes.x2s,
              verticalGap: 6,
              textStyle: tokens.typography.body.text10,
            ),
        x2s = x2s ??
            SelenicLinearProgressSizeProperties(
              borderRadius: tokens.borders.surfaceLg,
              progressHeight: tokens.sizes.x2s,
              thumbSizeValue: tokens.sizes.x2s,
              verticalGap: tokens.sizes.x5s,
              textStyle: tokens.typography.body.text10,
            );

  @override
  SelenicLinearProgressSizes copyWith({
    SelenicTokens? tokens,
    SelenicLinearProgressSizeProperties? x6s,
    SelenicLinearProgressSizeProperties? x5s,
    SelenicLinearProgressSizeProperties? x4s,
    SelenicLinearProgressSizeProperties? x3s,
    SelenicLinearProgressSizeProperties? x2s,
  }) {
    return SelenicLinearProgressSizes(
      tokens: tokens ?? this.tokens,
      x6s: x6s ?? this.x6s,
      x5s: x5s ?? this.x5s,
      x4s: x4s ?? this.x4s,
      x3s: x3s ?? this.x3s,
      x2s: x2s ?? this.x2s,
    );
  }

  @override
  SelenicLinearProgressSizes lerp(
    ThemeExtension<SelenicLinearProgressSizes>? other,
    double t,
  ) {
    if (other is! SelenicLinearProgressSizes) return this;

    return SelenicLinearProgressSizes(
      tokens: tokens.lerp(other.tokens, t),
      x6s: x6s.lerp(other.x6s, t),
      x5s: x5s.lerp(other.x5s, t),
      x4s: x4s.lerp(other.x4s, t),
      x3s: x3s.lerp(other.x3s, t),
      x2s: x2s.lerp(other.x2s, t),
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty("type", "SelenicLinearProgressSizes"))
      ..add(DiagnosticsProperty<SelenicTokens>("tokens", tokens))
      ..add(
          DiagnosticsProperty<SelenicLinearProgressSizeProperties>("x6s", x6s))
      ..add(
          DiagnosticsProperty<SelenicLinearProgressSizeProperties>("x5s", x5s))
      ..add(
          DiagnosticsProperty<SelenicLinearProgressSizeProperties>("x4s", x4s))
      ..add(
          DiagnosticsProperty<SelenicLinearProgressSizeProperties>("x3s", x3s))
      ..add(
          DiagnosticsProperty<SelenicLinearProgressSizeProperties>("x2s", x2s));
  }
}
