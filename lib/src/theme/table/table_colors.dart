import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:selenic_design/src/utils/color_premul_lerp.dart';

@immutable
class SelenicTableColors extends ThemeExtension<SelenicTableColors>
    with DiagnosticableTreeMixin {
  /// The text color of the SelenicTable column.
  final Color columnTextColor;

  /// The text color of the SelenicTable row.
  final Color rowTextColor;

  /// The text color of the SelenicTable row label.
  final Color rowLabelTextColor;

  /// The text color of the SelenicTable row pinned and animated label.
  final Color rowPinnedAnimatedLabelTextColor;

  /// The icon color of the SelenicTable.
  final Color iconColor;

  /// The background color of the SelenicTable row.
  final Color rowBackgroundColor;

  const SelenicTableColors({
    required this.columnTextColor,
    required this.rowTextColor,
    required this.rowLabelTextColor,
    required this.rowPinnedAnimatedLabelTextColor,
    required this.iconColor,
    required this.rowBackgroundColor,
  });

  @override
  SelenicTableColors copyWith({
    Color? columnTextColor,
    Color? rowTextColor,
    Color? rowLabelTextColor,
    Color? rowPinnedAnimatedLabelTextColor,
    Color? iconColor,
    Color? rowBackgroundColor,
  }) {
    return SelenicTableColors(
      columnTextColor: columnTextColor ?? this.columnTextColor,
      rowTextColor: rowTextColor ?? this.rowTextColor,
      rowLabelTextColor: rowLabelTextColor ?? this.rowLabelTextColor,
      rowPinnedAnimatedLabelTextColor: rowPinnedAnimatedLabelTextColor ??
          this.rowPinnedAnimatedLabelTextColor,
      iconColor: iconColor ?? this.iconColor,
      rowBackgroundColor: rowBackgroundColor ?? this.rowBackgroundColor,
    );
  }

  @override
  SelenicTableColors lerp(ThemeExtension<SelenicTableColors>? other, double t) {
    if (other is! SelenicTableColors) return this;

    return SelenicTableColors(
      columnTextColor:
          colorPremulLerp(columnTextColor, other.columnTextColor, t)!,
      rowTextColor: colorPremulLerp(rowTextColor, other.rowTextColor, t)!,
      rowLabelTextColor:
          colorPremulLerp(rowLabelTextColor, other.rowLabelTextColor, t)!,
      rowPinnedAnimatedLabelTextColor: colorPremulLerp(
        rowPinnedAnimatedLabelTextColor,
        other.rowPinnedAnimatedLabelTextColor,
        t,
      )!,
      iconColor: colorPremulLerp(
        iconColor,
        other.iconColor,
        t,
      )!,
      rowBackgroundColor: colorPremulLerp(
        rowBackgroundColor,
        other.rowBackgroundColor,
        t,
      )!,
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty("type", "SelenicTableColors"))
      ..add(ColorProperty("columnTextColor", columnTextColor))
      ..add(ColorProperty("rowTextColor", rowTextColor))
      ..add(ColorProperty("rowLabelTextColor", rowLabelTextColor))
      ..add(
        ColorProperty(
          "rowPinnedAnimatedLabelTextColor",
          rowPinnedAnimatedLabelTextColor,
        ),
      )
      ..add(
        ColorProperty(
          "iconColor",
          iconColor,
        ),
      )
      ..add(
        ColorProperty(
          "rowBackgroundColor",
          rowBackgroundColor,
        ),
      );
  }
}
