import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

@immutable
class SelenicSegmentedControlSizeProperties
    extends ThemeExtension<SelenicSegmentedControlSizeProperties>
    with DiagnosticableTreeMixin {
  /// The border radius of the SelenicSegmentedControl segment.
  final BorderRadiusGeometry segmentBorderRadius;

  /// The horizontal gap between the leading, label and trailing widgets of the
  /// SelenicSegmentedControl segment.
  final double segmentGap;

  /// The height of the SelenicSegmentedControl.
  final double height;

  /// The size value of the SelenicSegmentedControl icon.
  final double iconSizeValue;

  /// The padding of the SelenicSegmentedControl segment.
  final EdgeInsetsGeometry segmentPadding;

  /// The text style of the SelenicSegmentedControl.
  final TextStyle textStyle;

  const SelenicSegmentedControlSizeProperties({
    required this.segmentBorderRadius,
    required this.segmentGap,
    required this.height,
    required this.iconSizeValue,
    required this.segmentPadding,
    required this.textStyle,
  });

  @override
  SelenicSegmentedControlSizeProperties copyWith({
    BorderRadiusGeometry? segmentBorderRadius,
    double? segmentGap,
    double? height,
    double? iconSizeValue,
    EdgeInsetsGeometry? segmentPadding,
    TextStyle? textStyle,
  }) {
    return SelenicSegmentedControlSizeProperties(
      segmentBorderRadius: segmentBorderRadius ?? this.segmentBorderRadius,
      segmentGap: segmentGap ?? this.segmentGap,
      height: height ?? this.height,
      iconSizeValue: iconSizeValue ?? this.iconSizeValue,
      segmentPadding: segmentPadding ?? this.segmentPadding,
      textStyle: textStyle ?? this.textStyle,
    );
  }

  @override
  SelenicSegmentedControlSizeProperties lerp(
    ThemeExtension<SelenicSegmentedControlSizeProperties>? other,
    double t,
  ) {
    if (other is! SelenicSegmentedControlSizeProperties) return this;

    return SelenicSegmentedControlSizeProperties(
      segmentBorderRadius: BorderRadiusGeometry.lerp(
        segmentBorderRadius,
        other.segmentBorderRadius,
        t,
      )!,
      segmentGap: lerpDouble(segmentGap, other.segmentGap, t)!,
      height: lerpDouble(height, other.height, t)!,
      iconSizeValue: lerpDouble(iconSizeValue, other.iconSizeValue, t)!,
      segmentPadding:
          EdgeInsetsGeometry.lerp(segmentPadding, other.segmentPadding, t)!,
      textStyle: TextStyle.lerp(textStyle, other.textStyle, t)!,
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(
        DiagnosticsProperty(
          "type",
          "SelenicSegmentedControlSizeProperties",
        ),
      )
      ..add(
        DiagnosticsProperty<BorderRadiusGeometry>(
          "segmentBorderRadius",
          segmentBorderRadius,
        ),
      )
      ..add(
        DoubleProperty(
          "segmentGap",
          segmentGap,
        ),
      )
      ..add(
        DoubleProperty(
          "height",
          height,
        ),
      )
      ..add(
        DoubleProperty(
          "iconSizeValue",
          iconSizeValue,
        ),
      )
      ..add(
        DiagnosticsProperty<EdgeInsetsGeometry>(
          "segmentPadding",
          segmentPadding,
        ),
      )
      ..add(
        DiagnosticsProperty<TextStyle>(
          "textStyle",
          textStyle,
        ),
      );
  }
}
