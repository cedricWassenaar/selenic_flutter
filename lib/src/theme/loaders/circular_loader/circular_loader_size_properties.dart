import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

@immutable
class SelenicCircularLoaderSizeProperties
    extends ThemeExtension<SelenicCircularLoaderSizeProperties>
    with DiagnosticableTreeMixin {
  /// The size value of the SelenicCircularLoader.
  final double loaderSizeValue;

  /// The stroke width of the SelenicCircularLoader.
  final double loaderStrokeWidth;

  const SelenicCircularLoaderSizeProperties({
    required this.loaderSizeValue,
    required this.loaderStrokeWidth,
  });

  @override
  SelenicCircularLoaderSizeProperties copyWith({
    double? loaderSizeValue,
    double? loaderStrokeWidth,
  }) {
    return SelenicCircularLoaderSizeProperties(
      loaderSizeValue: loaderSizeValue ?? this.loaderSizeValue,
      loaderStrokeWidth: loaderStrokeWidth ?? this.loaderStrokeWidth,
    );
  }

  @override
  SelenicCircularLoaderSizeProperties lerp(
    ThemeExtension<SelenicCircularLoaderSizeProperties>? other,
    double t,
  ) {
    if (other is! SelenicCircularLoaderSizeProperties) return this;

    return SelenicCircularLoaderSizeProperties(
      loaderSizeValue: lerpDouble(loaderSizeValue, other.loaderSizeValue, t)!,
      loaderStrokeWidth:
          lerpDouble(loaderStrokeWidth, other.loaderStrokeWidth, t)!,
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty("type", "SelenicCircularLoaderSizeProperties"))
      ..add(DoubleProperty("loaderSizeValue", loaderSizeValue))
      ..add(DoubleProperty("loaderStrokeWidth", loaderStrokeWidth));
  }
}
