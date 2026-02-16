import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:selenic_design/src/theme/loaders/circular_loader/circular_loader_size_properties.dart';
import 'package:selenic_design/src/theme/tokens/tokens.dart';

@immutable
class SelenicCircularLoaderSizes
    extends ThemeExtension<SelenicCircularLoaderSizes>
    with DiagnosticableTreeMixin {
  /// The tokens of the Selenic Design System.
  final SelenicTokens tokens;

  /// The properties of the (2x) extra small SelenicCircularLoader.
  final SelenicCircularLoaderSizeProperties x2s;

  /// The properties of the extra small SelenicCircularLoader.
  final SelenicCircularLoaderSizeProperties xs;

  /// The properties of the small SelenicCircularLoader.
  final SelenicCircularLoaderSizeProperties sm;

  /// The properties of the medium SelenicCircularLoader.
  final SelenicCircularLoaderSizeProperties md;

  /// The properties of the large SelenicCircularLoader.
  final SelenicCircularLoaderSizeProperties lg;

  SelenicCircularLoaderSizes({
    required this.tokens,
    SelenicCircularLoaderSizeProperties? x2s,
    SelenicCircularLoaderSizeProperties? xs,
    SelenicCircularLoaderSizeProperties? sm,
    SelenicCircularLoaderSizeProperties? md,
    SelenicCircularLoaderSizeProperties? lg,
  })  : x2s = x2s ??
            SelenicCircularLoaderSizeProperties(
              loaderSizeValue: tokens.sizes.x2s,
              loaderStrokeWidth: tokens.sizes.x6s,
            ),
        xs = xs ??
            SelenicCircularLoaderSizeProperties(
              loaderSizeValue: tokens.sizes.xs,
              loaderStrokeWidth: tokens.sizes.x6s,
            ),
        sm = sm ??
            SelenicCircularLoaderSizeProperties(
              loaderSizeValue: tokens.sizes.sm,
              loaderStrokeWidth: tokens.sizes.x6s,
            ),
        md = md ??
            SelenicCircularLoaderSizeProperties(
              loaderSizeValue: tokens.sizes.md,
              loaderStrokeWidth: tokens.sizes.x5s,
            ),
        lg = lg ??
            SelenicCircularLoaderSizeProperties(
              loaderSizeValue: tokens.sizes.lg,
              loaderStrokeWidth: tokens.sizes.x5s,
            );

  @override
  SelenicCircularLoaderSizes copyWith({
    SelenicTokens? tokens,
    SelenicCircularLoaderSizeProperties? x2s,
    SelenicCircularLoaderSizeProperties? xs,
    SelenicCircularLoaderSizeProperties? sm,
    SelenicCircularLoaderSizeProperties? md,
    SelenicCircularLoaderSizeProperties? lg,
  }) {
    return SelenicCircularLoaderSizes(
      tokens: tokens ?? this.tokens,
      x2s: x2s ?? this.x2s,
      xs: xs ?? this.xs,
      sm: sm ?? this.sm,
      md: md ?? this.md,
      lg: lg ?? this.lg,
    );
  }

  @override
  SelenicCircularLoaderSizes lerp(
    ThemeExtension<SelenicCircularLoaderSizes>? other,
    double t,
  ) {
    if (other is! SelenicCircularLoaderSizes) return this;

    return SelenicCircularLoaderSizes(
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
      ..add(DiagnosticsProperty("type", "SelenicCircularLoaderSizes"))
      ..add(DiagnosticsProperty<SelenicTokens>("tokens", tokens))
      ..add(
          DiagnosticsProperty<SelenicCircularLoaderSizeProperties>("x2s", x2s))
      ..add(DiagnosticsProperty<SelenicCircularLoaderSizeProperties>("xs", xs))
      ..add(DiagnosticsProperty<SelenicCircularLoaderSizeProperties>("sm", sm))
      ..add(DiagnosticsProperty<SelenicCircularLoaderSizeProperties>("md", md))
      ..add(DiagnosticsProperty<SelenicCircularLoaderSizeProperties>("lg", lg));
  }
}
