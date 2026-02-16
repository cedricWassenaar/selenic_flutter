import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:selenic_design/src/theme/progress/circular_progress/circular_progress_size_properties.dart';
import 'package:selenic_design/src/theme/tokens/tokens.dart';

@immutable
class SelenicCircularProgressSizes
    extends ThemeExtension<SelenicCircularProgressSizes>
    with DiagnosticableTreeMixin {
  /// The tokens of the Selenic Design System.
  final SelenicTokens tokens;

  /// The properties of the (2x) extra small SelenicCircularProgress.
  final SelenicCircularProgressSizeProperties x2s;

  /// The properties of the extra small SelenicCircularProgress.
  final SelenicCircularProgressSizeProperties xs;

  /// The properties of the small SelenicCircularProgress.
  final SelenicCircularProgressSizeProperties sm;

  /// The properties of the medium SelenicCircularProgress.
  final SelenicCircularProgressSizeProperties md;

  /// The properties of the large SelenicCircularProgress.
  final SelenicCircularProgressSizeProperties lg;

  SelenicCircularProgressSizes({
    required this.tokens,
    SelenicCircularProgressSizeProperties? x2s,
    SelenicCircularProgressSizeProperties? xs,
    SelenicCircularProgressSizeProperties? sm,
    SelenicCircularProgressSizeProperties? md,
    SelenicCircularProgressSizeProperties? lg,
  })  : x2s = x2s ??
            SelenicCircularProgressSizeProperties(
              progressSizeValue: tokens.sizes.x2s,
              progressStrokeWidth: tokens.sizes.x6s,
            ),
        xs = xs ??
            SelenicCircularProgressSizeProperties(
              progressSizeValue: tokens.sizes.xs,
              progressStrokeWidth: tokens.sizes.x6s,
            ),
        sm = sm ??
            SelenicCircularProgressSizeProperties(
              progressSizeValue: tokens.sizes.sm,
              progressStrokeWidth: tokens.sizes.x6s,
            ),
        md = md ??
            SelenicCircularProgressSizeProperties(
              progressSizeValue: tokens.sizes.md,
              progressStrokeWidth: tokens.sizes.x5s,
            ),
        lg = lg ??
            SelenicCircularProgressSizeProperties(
              progressSizeValue: tokens.sizes.lg,
              progressStrokeWidth: tokens.sizes.x5s,
            );

  @override
  SelenicCircularProgressSizes copyWith({
    SelenicTokens? tokens,
    SelenicCircularProgressSizeProperties? x2s,
    SelenicCircularProgressSizeProperties? xs,
    SelenicCircularProgressSizeProperties? sm,
    SelenicCircularProgressSizeProperties? md,
    SelenicCircularProgressSizeProperties? lg,
  }) {
    return SelenicCircularProgressSizes(
      tokens: tokens ?? this.tokens,
      x2s: x2s ?? this.x2s,
      xs: xs ?? this.xs,
      sm: sm ?? this.sm,
      md: md ?? this.md,
      lg: lg ?? this.lg,
    );
  }

  @override
  SelenicCircularProgressSizes lerp(
    ThemeExtension<SelenicCircularProgressSizes>? other,
    double t,
  ) {
    if (other is! SelenicCircularProgressSizes) return this;

    return SelenicCircularProgressSizes(
      tokens: tokens.lerp(other.tokens, t),
      x2s: x2s.lerp(other.x2s, t),
      xs: xs.lerp(other.xs, t),
      sm: sm.lerp(other.sm, t),
      md: md.lerp(other.md, t),
      lg: lg.lerp(other.lg, t),
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty("type", "SelenicCircularProgressSizes"))
      ..add(DiagnosticsProperty<SelenicTokens>("tokens", tokens))
      ..add(DiagnosticsProperty<SelenicCircularProgressSizeProperties>(
          "x2s", x2s))
      ..add(
          DiagnosticsProperty<SelenicCircularProgressSizeProperties>("xs", xs))
      ..add(
          DiagnosticsProperty<SelenicCircularProgressSizeProperties>("sm", sm))
      ..add(
          DiagnosticsProperty<SelenicCircularProgressSizeProperties>("md", md))
      ..add(
          DiagnosticsProperty<SelenicCircularProgressSizeProperties>("lg", lg));
  }
}
