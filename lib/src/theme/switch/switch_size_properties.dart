import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

@immutable
class SelenicSwitchSizeProperties
    extends ThemeExtension<SelenicSwitchSizeProperties>
    with DiagnosticableTreeMixin {
  /// The height of the SelenicSwitch.
  final double height;

  /// The width of the SelenicSwitch.
  final double width;

  /// The size value of the SelenicSwitch thumb.
  final double thumbSizeValue;

  /// The size value of the SelenicSwitch icon.
  final double iconSizeValue;

  /// The padding of the SelenicSwitch.
  final EdgeInsetsGeometry padding;

  /// The text style of the SelenicSwitch.
  final TextStyle textStyle;

  const SelenicSwitchSizeProperties({
    required this.height,
    required this.width,
    required this.thumbSizeValue,
    required this.iconSizeValue,
    required this.padding,
    required this.textStyle,
  });

  @override
  SelenicSwitchSizeProperties copyWith({
    double? height,
    double? width,
    double? thumbSizeValue,
    double? iconSizeValue,
    EdgeInsetsGeometry? padding,
    TextStyle? textStyle,
  }) {
    return SelenicSwitchSizeProperties(
      height: height ?? this.height,
      width: width ?? this.width,
      thumbSizeValue: thumbSizeValue ?? this.thumbSizeValue,
      iconSizeValue: iconSizeValue ?? this.iconSizeValue,
      padding: padding ?? this.padding,
      textStyle: textStyle ?? this.textStyle,
    );
  }

  @override
  SelenicSwitchSizeProperties lerp(
    ThemeExtension<SelenicSwitchSizeProperties>? other,
    double t,
  ) {
    if (other is! SelenicSwitchSizeProperties) return this;

    return SelenicSwitchSizeProperties(
      height: lerpDouble(height, other.height, t)!,
      width: lerpDouble(width, other.width, t)!,
      thumbSizeValue: lerpDouble(thumbSizeValue, other.thumbSizeValue, t)!,
      iconSizeValue: lerpDouble(iconSizeValue, other.iconSizeValue, t)!,
      padding: EdgeInsetsGeometry.lerp(padding, other.padding, t)!,
      textStyle: TextStyle.lerp(textStyle, other.textStyle, t)!,
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty("type", "SelenicSwitchSizeProperties"))
      ..add(DoubleProperty("height", height))
      ..add(DoubleProperty("width", width))
      ..add(DoubleProperty("thumbSizeValue", thumbSizeValue))
      ..add(DoubleProperty("iconSizeValue", iconSizeValue))
      ..add(DiagnosticsProperty<EdgeInsetsGeometry>("padding", padding))
      ..add(DiagnosticsProperty<TextStyle>("textStyle", textStyle));
  }
}
