import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

@immutable
class SelenicAccordionSizeProperties
    extends ThemeExtension<SelenicAccordionSizeProperties>
    with DiagnosticableTreeMixin {
  /// The border radius of the SelenicAccordion.
  final BorderRadiusGeometry borderRadius;

  /// The height of the SelenicAccordion header.
  final double headerHeight;

  /// The size value of the SelenicAccordion icon.
  final double iconSizeValue;

  /// The padding of the SelenicAccordion header.
  final EdgeInsetsGeometry headerPadding;

  /// The text style of the SelenicAccordion header.
  final TextStyle headerTextStyle;

  /// The text style of the SelenicAccordion content.
  final TextStyle contentTextStyle;

  const SelenicAccordionSizeProperties({
    required this.borderRadius,
    required this.headerHeight,
    required this.iconSizeValue,
    required this.headerPadding,
    required this.headerTextStyle,
    required this.contentTextStyle,
  });

  @override
  SelenicAccordionSizeProperties copyWith({
    BorderRadiusGeometry? borderRadius,
    double? headerHeight,
    double? iconSizeValue,
    EdgeInsetsGeometry? headerPadding,
    TextStyle? headerTextStyle,
    TextStyle? contentTextStyle,
  }) {
    return SelenicAccordionSizeProperties(
      borderRadius: borderRadius ?? this.borderRadius,
      headerHeight: headerHeight ?? this.headerHeight,
      iconSizeValue: iconSizeValue ?? this.iconSizeValue,
      headerPadding: headerPadding ?? this.headerPadding,
      headerTextStyle: headerTextStyle ?? this.headerTextStyle,
      contentTextStyle: contentTextStyle ?? this.contentTextStyle,
    );
  }

  @override
  SelenicAccordionSizeProperties lerp(
    ThemeExtension<SelenicAccordionSizeProperties>? other,
    double t,
  ) {
    if (other is! SelenicAccordionSizeProperties) return this;

    return SelenicAccordionSizeProperties(
      borderRadius:
          BorderRadiusGeometry.lerp(borderRadius, other.borderRadius, t)!,
      headerHeight: lerpDouble(headerHeight, other.headerHeight, t)!,
      iconSizeValue: lerpDouble(iconSizeValue, other.iconSizeValue, t)!,
      headerPadding:
          EdgeInsetsGeometry.lerp(headerPadding, other.headerPadding, t)!,
      headerTextStyle:
          TextStyle.lerp(headerTextStyle, other.headerTextStyle, t)!,
      contentTextStyle:
          TextStyle.lerp(contentTextStyle, other.contentTextStyle, t)!,
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(
        DiagnosticsProperty("type", "SelenicAccordionSizeProperties"),
      )
      ..add(
        DiagnosticsProperty<BorderRadiusGeometry>("borderRadius", borderRadius),
      )
      ..add(
        DoubleProperty("headerHeight", headerHeight),
      )
      ..add(
        DoubleProperty("iconSizeValue", iconSizeValue),
      )
      ..add(
        DiagnosticsProperty<EdgeInsetsGeometry>("headerPadding", headerPadding),
      )
      ..add(
        DiagnosticsProperty<TextStyle>("headerTextStyle", headerTextStyle),
      )
      ..add(
        DiagnosticsProperty<TextStyle>("contentTextStyle", contentTextStyle),
      );
  }
}
