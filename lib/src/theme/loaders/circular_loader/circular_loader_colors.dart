import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:selenic_design/src/utils/color_premul_lerp.dart';

@immutable
class SelenicCircularLoaderColors
    extends ThemeExtension<SelenicCircularLoaderColors>
    with DiagnosticableTreeMixin {
  /// The color of the SelenicCircularLoader.
  final Color color;

  /// The background color of the SelenicCircularLoader.
  final Color backgroundColor;

  const SelenicCircularLoaderColors({
    required this.color,
    required this.backgroundColor,
  });

  @override
  SelenicCircularLoaderColors copyWith({
    Color? color,
    Color? backgroundColor,
  }) {
    return SelenicCircularLoaderColors(
      color: color ?? this.color,
      backgroundColor: backgroundColor ?? this.backgroundColor,
    );
  }

  @override
  SelenicCircularLoaderColors lerp(
    ThemeExtension<SelenicCircularLoaderColors>? other,
    double t,
  ) {
    if (other is! SelenicCircularLoaderColors) return this;

    return SelenicCircularLoaderColors(
      color: colorPremulLerp(color, other.color, t)!,
      backgroundColor:
          colorPremulLerp(backgroundColor, other.backgroundColor, t)!,
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty("type", "SelenicCircularLoaderColors"))
      ..add(ColorProperty("color", color))
      ..add(ColorProperty("backgroundColor", backgroundColor));
  }
}
