import 'package:flutter/material.dart';

import 'package:selenic_design/src/widgets/tab_bar/pill_tab.dart';

class SelenicPillTabStyle {
  /// The border radius of the tab.
  final BorderRadiusGeometry? borderRadius;

  /// The color of the tab focus effect.
  final Color? focusEffectColor;

  /// The color of the selected tab.
  final Color? selectedTabColor;

  /// The default text color of the tab.
  final Color? textColor;

  /// The text color of the selected tab.
  final Color? selectedTextColor;

  /// The custom decoration of the tab.
  final Decoration? decoration;

  /// The gap between the [SelenicPillTab.leading], [SelenicPillTab.label] and
  /// [SelenicPillTab.trailing] widgets of the tab.
  final double? tabGap;

  /// The padding of the tab.
  final EdgeInsetsGeometry? tabPadding;

  /// The text style of the tab.
  ///
  /// If [TextStyle] color is used, then it overrides the [textColor] and
  /// [selectedTextColor].
  final TextStyle? textStyle;

  /// Defines a Selenic Design pill tab style.
  const SelenicPillTabStyle({
    this.borderRadius,
    this.focusEffectColor,
    this.selectedTabColor,
    this.textColor,
    this.selectedTextColor,
    this.decoration,
    this.tabGap,
    this.tabPadding,
    this.textStyle,
  });
}
