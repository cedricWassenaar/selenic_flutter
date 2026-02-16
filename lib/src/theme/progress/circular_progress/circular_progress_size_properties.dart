import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

@immutable
class SelenicCircularProgressSizeProperties
    extends ThemeExtension<SelenicCircularProgressSizeProperties>
    with DiagnosticableTreeMixin {
  /// The size value of the SelenicCircularProgress.
  final double progressSizeValue;

  /// The stroke width of the SelenicCircularProgress.
  final double progressStrokeWidth;

  const SelenicCircularProgressSizeProperties({
    required this.progressSizeValue,
    required this.progressStrokeWidth,
  });

  @override
  SelenicCircularProgressSizeProperties copyWith({
    double? progressSizeValue,
    double? progressStrokeWidth,
  }) {
    return SelenicCircularProgressSizeProperties(
      progressSizeValue: progressSizeValue ?? this.progressSizeValue,
      progressStrokeWidth: progressStrokeWidth ?? this.progressStrokeWidth,
    );
  }

  @override
  SelenicCircularProgressSizeProperties lerp(
    ThemeExtension<SelenicCircularProgressSizeProperties>? other,
    double t,
  ) {
    if (other is! SelenicCircularProgressSizeProperties) return this;

    return SelenicCircularProgressSizeProperties(
      progressSizeValue:
          lerpDouble(progressSizeValue, other.progressSizeValue, t)!,
      progressStrokeWidth:
          lerpDouble(progressStrokeWidth, other.progressStrokeWidth, t)!,
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(
          DiagnosticsProperty("type", "SelenicCircularProgressSizeProperties"))
      ..add(DoubleProperty("progressSizeValue", progressSizeValue))
      ..add(DoubleProperty("progressStrokeWidth", progressStrokeWidth));
  }
}
