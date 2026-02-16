import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

@immutable
class SelenicLinearLoaderSizeProperties
    extends ThemeExtension<SelenicLinearLoaderSizeProperties>
    with DiagnosticableTreeMixin {
  /// The border radius of the SelenicLinearLoader.
  final BorderRadiusGeometry borderRadius;

  /// The height of the SelenicLinearLoader.
  final double loaderHeight;

  const SelenicLinearLoaderSizeProperties({
    required this.borderRadius,
    required this.loaderHeight,
  });

  @override
  SelenicLinearLoaderSizeProperties copyWith({
    BorderRadiusGeometry? borderRadius,
    double? loaderHeight,
  }) {
    return SelenicLinearLoaderSizeProperties(
      borderRadius: borderRadius ?? this.borderRadius,
      loaderHeight: loaderHeight ?? this.loaderHeight,
    );
  }

  @override
  SelenicLinearLoaderSizeProperties lerp(
    ThemeExtension<SelenicLinearLoaderSizeProperties>? other,
    double t,
  ) {
    if (other is! SelenicLinearLoaderSizeProperties) return this;

    return SelenicLinearLoaderSizeProperties(
      borderRadius:
          BorderRadiusGeometry.lerp(borderRadius, other.borderRadius, t)!,
      loaderHeight: lerpDouble(loaderHeight, other.loaderHeight, t)!,
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(
        DiagnosticsProperty("type", "SelenicLinearLoaderSizeProperties"),
      )
      ..add(
        DiagnosticsProperty<BorderRadiusGeometry>("borderRadius", borderRadius),
      )
      ..add(
        DoubleProperty("loaderHeight", loaderHeight),
      );
  }
}
