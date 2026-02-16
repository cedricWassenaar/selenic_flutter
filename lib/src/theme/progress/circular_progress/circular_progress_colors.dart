import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:selenic_design/src/utils/color_premul_lerp.dart';

@immutable
class SelenicCircularProgressColors
    extends ThemeExtension<SelenicCircularProgressColors>
    with DiagnosticableTreeMixin {
  /// The color of the SelenicCircularProgress.
  final Color color;

  /// The background color of the SelenicCircularProgress.
  final Color backgroundColor;

  const SelenicCircularProgressColors({
    required this.color,
    required this.backgroundColor,
  });

  @override
  SelenicCircularProgressColors copyWith({
    Color? color,
    Color? backgroundColor,
  }) {
    return SelenicCircularProgressColors(
      color: color ?? this.color,
      backgroundColor: backgroundColor ?? this.backgroundColor,
    );
  }

  @override
  SelenicCircularProgressColors lerp(
    ThemeExtension<SelenicCircularProgressColors>? other,
    double t,
  ) {
    if (other is! SelenicCircularProgressColors) return this;

    return SelenicCircularProgressColors(
      color: colorPremulLerp(color, other.color, t)!,
      backgroundColor:
          colorPremulLerp(backgroundColor, other.backgroundColor, t)!,
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty("type", "SelenicCircularProgressColors"))
      ..add(ColorProperty("color", color))
      ..add(ColorProperty("backgroundColor", backgroundColor));
  }
}
