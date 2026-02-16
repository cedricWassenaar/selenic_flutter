import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:selenic_design/src/theme/loaders/linear_loader/linear_loader_size_properties.dart';
import 'package:selenic_design/src/theme/tokens/tokens.dart';

@immutable
class SelenicLinearLoaderSizes extends ThemeExtension<SelenicLinearLoaderSizes>
    with DiagnosticableTreeMixin {
  /// The tokens of the Selenic Design System.
  final SelenicTokens tokens;

  /// The properties of the (6x) extra small SelenicLinearLoader.
  final SelenicLinearLoaderSizeProperties x6s;

  /// The properties of the (5x) extra small SelenicLinearLoader.
  final SelenicLinearLoaderSizeProperties x5s;

  /// The properties of the (4x) extra small SelenicLinearLoader.
  final SelenicLinearLoaderSizeProperties x4s;

  /// The properties of the (3x) extra small SelenicLinearLoader.
  final SelenicLinearLoaderSizeProperties x3s;

  /// The properties of the (2x) extra small SelenicLinearLoader.
  final SelenicLinearLoaderSizeProperties x2s;

  SelenicLinearLoaderSizes({
    required this.tokens,
    SelenicLinearLoaderSizeProperties? x6s,
    SelenicLinearLoaderSizeProperties? x5s,
    SelenicLinearLoaderSizeProperties? x4s,
    SelenicLinearLoaderSizeProperties? x3s,
    SelenicLinearLoaderSizeProperties? x2s,
  })  : x6s = x6s ??
            SelenicLinearLoaderSizeProperties(
              borderRadius: tokens.borders.surfaceXs,
              loaderHeight: tokens.sizes.x6s,
            ),
        x5s = x5s ??
            SelenicLinearLoaderSizeProperties(
              borderRadius: tokens.borders.surfaceXs,
              loaderHeight: tokens.sizes.x5s,
            ),
        x4s = x4s ??
            SelenicLinearLoaderSizeProperties(
              borderRadius: tokens.borders.surfaceSm,
              loaderHeight: tokens.sizes.x4s,
            ),
        x3s = x3s ??
            SelenicLinearLoaderSizeProperties(
              borderRadius: tokens.borders.surfaceMd,
              loaderHeight: tokens.sizes.x3s,
            ),
        x2s = x2s ??
            SelenicLinearLoaderSizeProperties(
              borderRadius: tokens.borders.surfaceLg,
              loaderHeight: tokens.sizes.x2s,
            );

  @override
  SelenicLinearLoaderSizes copyWith({
    SelenicTokens? tokens,
    SelenicLinearLoaderSizeProperties? x6s,
    SelenicLinearLoaderSizeProperties? x5s,
    SelenicLinearLoaderSizeProperties? x4s,
    SelenicLinearLoaderSizeProperties? x3s,
    SelenicLinearLoaderSizeProperties? x2s,
  }) {
    return SelenicLinearLoaderSizes(
      tokens: tokens ?? this.tokens,
      x6s: x6s ?? this.x6s,
      x5s: x5s ?? this.x5s,
      x4s: x4s ?? this.x4s,
      x3s: x3s ?? this.x3s,
      x2s: x2s ?? this.x2s,
    );
  }

  @override
  SelenicLinearLoaderSizes lerp(
    ThemeExtension<SelenicLinearLoaderSizes>? other,
    double t,
  ) {
    if (other is! SelenicLinearLoaderSizes) return this;

    return SelenicLinearLoaderSizes(
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
      ..add(DiagnosticsProperty("type", "SelenicLinearLoaderSizes"))
      ..add(DiagnosticsProperty<SelenicTokens>("tokens", tokens))
      ..add(DiagnosticsProperty<SelenicLinearLoaderSizeProperties>("x6s", x6s))
      ..add(DiagnosticsProperty<SelenicLinearLoaderSizeProperties>("x5s", x5s))
      ..add(DiagnosticsProperty<SelenicLinearLoaderSizeProperties>("x4s", x4s))
      ..add(DiagnosticsProperty<SelenicLinearLoaderSizeProperties>("x3s", x3s))
      ..add(DiagnosticsProperty<SelenicLinearLoaderSizeProperties>("x2s", x2s));
  }
}
