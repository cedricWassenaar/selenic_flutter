import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

@immutable
class SelenicLinearProgressSizeProperties
    extends ThemeExtension<SelenicLinearProgressSizeProperties>
    with DiagnosticableTreeMixin {
  /// The border radius of the SelenicLinearProgress.
  final BorderRadiusGeometry borderRadius;

  /// The height of the SelenicLinearProgress.
  final double progressHeight;

  /// The size value of the SelenicLinearProgress thumb.
  final double thumbSizeValue;

  /// The vertical gap between the SelenicLinearProgress and the minLabel and
  /// maxLabel widgets.
  final double verticalGap;

  /// The text style of the SelenicLinearProgress minLabel and maxLabel widgets.
  final TextStyle textStyle;

  const SelenicLinearProgressSizeProperties({
    required this.borderRadius,
    required this.progressHeight,
    required this.thumbSizeValue,
    required this.verticalGap,
    required this.textStyle,
  });

  @override
  SelenicLinearProgressSizeProperties copyWith({
    BorderRadiusGeometry? borderRadius,
    double? progressHeight,
    double? thumbSizeValue,
    double? verticalGap,
    TextStyle? textStyle,
  }) {
    return SelenicLinearProgressSizeProperties(
      borderRadius: borderRadius ?? this.borderRadius,
      progressHeight: progressHeight ?? this.progressHeight,
      thumbSizeValue: thumbSizeValue ?? this.thumbSizeValue,
      verticalGap: verticalGap ?? this.verticalGap,
      textStyle: textStyle ?? this.textStyle,
    );
  }

  @override
  SelenicLinearProgressSizeProperties lerp(
    ThemeExtension<SelenicLinearProgressSizeProperties>? other,
    double t,
  ) {
    if (other is! SelenicLinearProgressSizeProperties) return this;

    return SelenicLinearProgressSizeProperties(
      borderRadius:
          BorderRadiusGeometry.lerp(borderRadius, other.borderRadius, t)!,
      progressHeight: lerpDouble(progressHeight, other.progressHeight, t)!,
      thumbSizeValue: lerpDouble(thumbSizeValue, other.thumbSizeValue, t)!,
      verticalGap: lerpDouble(verticalGap, other.verticalGap, t)!,
      textStyle: TextStyle.lerp(textStyle, other.textStyle, t)!,
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(
        DiagnosticsProperty("type", "SelenicLinearProgressSizeProperties"),
      )
      ..add(
        DiagnosticsProperty<BorderRadiusGeometry>("borderRadius", borderRadius),
      )
      ..add(
        DoubleProperty("progressHeight", progressHeight),
      )
      ..add(
        DoubleProperty("thumbSizeValue", thumbSizeValue),
      )
      ..add(
        DoubleProperty("verticalGap", verticalGap),
      )
      ..add(
        DiagnosticsProperty<TextStyle>("textStyle", textStyle),
      );
  }
}
