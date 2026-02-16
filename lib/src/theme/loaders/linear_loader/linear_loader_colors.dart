import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:selenic_design/src/utils/color_premul_lerp.dart';

@immutable
class SelenicLinearLoaderColors
    extends ThemeExtension<SelenicLinearLoaderColors>
    with DiagnosticableTreeMixin {
  /// The color of the SelenicLinearLoader.
  final Color color;

  /// The background color of the SelenicLinearLoader.
  final Color backgroundColor;

  const SelenicLinearLoaderColors({
    required this.color,
    required this.backgroundColor,
  });

  @override
  SelenicLinearLoaderColors copyWith({
    Color? color,
    Color? backgroundColor,
  }) {
    return SelenicLinearLoaderColors(
      color: color ?? this.color,
      backgroundColor: backgroundColor ?? this.backgroundColor,
    );
  }

  @override
  SelenicLinearLoaderColors lerp(
    ThemeExtension<SelenicLinearLoaderColors>? other,
    double t,
  ) {
    if (other is! SelenicLinearLoaderColors) return this;

    return SelenicLinearLoaderColors(
      color: colorPremulLerp(color, other.color, t)!,
      backgroundColor:
          colorPremulLerp(backgroundColor, other.backgroundColor, t)!,
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty("type", "SelenicLinearLoaderColors"))
      ..add(ColorProperty("color", color))
      ..add(ColorProperty("backgroundColor", backgroundColor));
  }
}
