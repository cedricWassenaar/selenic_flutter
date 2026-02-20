import 'package:flutter/material.dart';

import 'package:selenic_design/selenic_design.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

enum SelenicColor {
  accentPrimary,
  accentSecondary,
  lineAccent,
  backgroundPrimary,
  backgroundSecondary,
  textPrimary,
  textSecondary,
  blandPrimary,
  blandSecondary,
  overlayPrimary,
  overlaySecondary,
  overlayTertiary,
  warning,
  warning_60,
  warning_10,
  error,
  error_60,
  error_10,
  success,
  success_60,
  success_10,
  supportive_1,
  supportive_1_60,
  supportive_1_10,
  supportive_2,
  supportive_2_60,
  supportive_2_10,
  supportive_3,
  supportive_3_60,
  supportive_3_10,
  supportive_4,
  supportive_4_60,
  supportive_4_10,
  supportive_5,
  supportive_5_60,
  supportive_5_10,
  supportive_6,
  supportive_6_60,
  supportive_6_10,
}

List<SelenicColor> mainColorsList = [
  SelenicColor.accentPrimary,
  SelenicColor.accentSecondary,
  SelenicColor.lineAccent,
  SelenicColor.backgroundPrimary,
  SelenicColor.backgroundSecondary,
  SelenicColor.textPrimary,
  SelenicColor.textSecondary,
  SelenicColor.blandPrimary,
  SelenicColor.blandSecondary,
  SelenicColor.overlayPrimary,
  SelenicColor.overlaySecondary,
  SelenicColor.overlayTertiary,
];

List<SelenicColor> supportiveColorsList = [
  SelenicColor.warning,
  SelenicColor.warning_60,
  SelenicColor.warning_10,
  SelenicColor.error,
  SelenicColor.error_60,
  SelenicColor.error_10,
  SelenicColor.success,
  SelenicColor.success_60,
  SelenicColor.success_10,
  SelenicColor.supportive_3,
  SelenicColor.supportive_3_60,
  SelenicColor.supportive_3_10,
  SelenicColor.supportive_2,
  SelenicColor.supportive_2_60,
  SelenicColor.supportive_2_10,
  SelenicColor.supportive_1,
  SelenicColor.supportive_1_60,
  SelenicColor.supportive_1_10,
  SelenicColor.supportive_5,
  SelenicColor.supportive_5_60,
  SelenicColor.supportive_5_10,
  SelenicColor.supportive_4,
  SelenicColor.supportive_4_60,
  SelenicColor.supportive_4_10,
  SelenicColor.supportive_6,
  SelenicColor.supportive_6_60,
  SelenicColor.supportive_6_10,
];

Color getColor(BuildContext context, SelenicColor color) => switch (color) {
      SelenicColor.accentPrimary => context.selenicColors!.accentPrimary,
      SelenicColor.accentSecondary => context.selenicColors!.accentSecondary,
      SelenicColor.lineAccent => context.selenicColors!.lineAccent,
      SelenicColor.backgroundPrimary =>
        context.selenicColors!.backgroundPrimary,
      SelenicColor.backgroundSecondary =>
        context.selenicColors!.backgroundSecondary,
      SelenicColor.textPrimary => context.selenicColors!.bodyTextPrimary,
      SelenicColor.textSecondary => context.selenicColors!.bodyTextSecondary,
      SelenicColor.blandPrimary => context.selenicColors!.filledButton,
      SelenicColor.blandSecondary => context.selenicColors!.outlinedButton,
      SelenicColor.overlayPrimary => context.selenicColors!.hoverPrimary,
      SelenicColor.overlaySecondary => context.selenicColors!.hoverSecondary,
      SelenicColor.overlayTertiary => context.selenicColors!.overlayModal,
      SelenicColor.warning => context.selenicColors!.warning,
      SelenicColor.warning_60 => context.selenicColors!.warning_60,
      SelenicColor.warning_10 => context.selenicColors!.warning_10,
      SelenicColor.error => context.selenicColors!.error,
      SelenicColor.error_60 => context.selenicColors!.error_60,
      SelenicColor.error_10 => context.selenicColors!.error_10,
      SelenicColor.success => context.selenicColors!.success,
      SelenicColor.success_60 => context.selenicColors!.success_60,
      SelenicColor.success_10 => context.selenicColors!.success_10,
      SelenicColor.supportive_1 => context.selenicColors!.supportive_1,
      SelenicColor.supportive_1_60 => context.selenicColors!.supportive_1_60,
      SelenicColor.supportive_1_10 => context.selenicColors!.supportive_1_10,
      SelenicColor.supportive_2 => context.selenicColors!.supportive_2,
      SelenicColor.supportive_2_60 => context.selenicColors!.supportive_2_60,
      SelenicColor.supportive_2_10 => context.selenicColors!.supportive_2_10,
      SelenicColor.supportive_3 => context.selenicColors!.supportive_3,
      SelenicColor.supportive_3_60 => context.selenicColors!.supportive_3_60,
      SelenicColor.supportive_3_10 => context.selenicColors!.supportive_3_10,
      SelenicColor.supportive_4 => context.selenicColors!.supportive_4,
      SelenicColor.supportive_4_60 => context.selenicColors!.supportive_4_60,
      SelenicColor.supportive_4_10 => context.selenicColors!.supportive_4_10,
      SelenicColor.supportive_5 => context.selenicColors!.supportive_5,
      SelenicColor.supportive_5_60 => context.selenicColors!.supportive_5_60,
      SelenicColor.supportive_5_10 => context.selenicColors!.supportive_5_10,
      SelenicColor.supportive_6 => context.selenicColors!.supportive_6,
      SelenicColor.supportive_6_60 => context.selenicColors!.supportive_6_60,
      SelenicColor.supportive_6_10 => context.selenicColors!.supportive_6_10,
    };

/// The index of the color options.
List<Option<int>> colorOptions = [
  ...SelenicColor.values.map(
    (SelenicColor color) => Option(label: color.name, value: color.index),
  ),
  Option(label: 'transparent', value: SelenicColor.values.length),
];

// The combination of "indexes" and colors in the colorTable() look-up table
// (LUT) is designed to circumvent the issue of a stale closure that would
// occur with the knob otherwise.

/// The look-up table for the color options.
List<Color?> colorTable(BuildContext context) => [
      ...SelenicColor.values
          .map((SelenicColor color) => getColor(context, color)),
      Colors.transparent,
      null,
    ];
