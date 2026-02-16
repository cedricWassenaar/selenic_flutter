import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

@immutable
class SelenicMenuItemProperties
    extends ThemeExtension<SelenicMenuItemProperties>
    with DiagnosticableTreeMixin {
  /// The border radius of the SelenicMenuItem.
  final BorderRadiusGeometry borderRadius;

  /// The vertical gap between the label and content widgets of the SelenicMenuItem.
  final double verticalGap;

  /// The minimum height of the SelenicMenuItem.
  final double minimumHeight;

  /// The padding of the SelenicMenuItem.
  final EdgeInsetsGeometry padding;

  /// The text style of the SelenicMenuItem label.
  final TextStyle labelTextStyle;

  /// The text style of the SelenicMenuItem content.
  final TextStyle contentTextStyle;

  const SelenicMenuItemProperties({
    required this.borderRadius,
    required this.verticalGap,
    required this.minimumHeight,
    required this.padding,
    required this.labelTextStyle,
    required this.contentTextStyle,
  });

  @override
  SelenicMenuItemProperties copyWith({
    BorderRadiusGeometry? borderRadius,
    double? verticalGap,
    double? minimumHeight,
    EdgeInsetsGeometry? padding,
    TextStyle? labelTextStyle,
    TextStyle? contentTextStyle,
  }) {
    return SelenicMenuItemProperties(
      borderRadius: borderRadius ?? this.borderRadius,
      verticalGap: verticalGap ?? this.verticalGap,
      minimumHeight: minimumHeight ?? this.minimumHeight,
      padding: padding ?? this.padding,
      labelTextStyle: labelTextStyle ?? this.labelTextStyle,
      contentTextStyle: contentTextStyle ?? this.contentTextStyle,
    );
  }

  @override
  SelenicMenuItemProperties lerp(
    ThemeExtension<SelenicMenuItemProperties>? other,
    double t,
  ) {
    if (other is! SelenicMenuItemProperties) return this;

    return SelenicMenuItemProperties(
      borderRadius:
          BorderRadiusGeometry.lerp(borderRadius, other.borderRadius, t)!,
      verticalGap: lerpDouble(verticalGap, other.verticalGap, t)!,
      minimumHeight: lerpDouble(minimumHeight, other.minimumHeight, t)!,
      padding: EdgeInsetsGeometry.lerp(padding, other.padding, t)!,
      labelTextStyle: TextStyle.lerp(labelTextStyle, other.labelTextStyle, t)!,
      contentTextStyle:
          TextStyle.lerp(contentTextStyle, other.contentTextStyle, t)!,
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(
        DiagnosticsProperty("type", "SelenicMenuItemProperties"),
      )
      ..add(
        DiagnosticsProperty<BorderRadiusGeometry>("borderRadius", borderRadius),
      )
      ..add(
        DoubleProperty("verticalGap", verticalGap),
      )
      ..add(
        DoubleProperty("minimumHeight", minimumHeight),
      )
      ..add(
        DiagnosticsProperty<EdgeInsetsGeometry>("padding", padding),
      )
      ..add(
        DiagnosticsProperty<TextStyle>("labelTextStyle", labelTextStyle),
      )
      ..add(
        DiagnosticsProperty<TextStyle>("contentTextStyle", contentTextStyle),
      );
  }
}
