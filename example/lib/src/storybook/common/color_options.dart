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
  krillin,
  krillin60,
  krillin10,
  chichi,
  chichi60,
  chichi10,
  roshi,
  roshi60,
  roshi10,
  frieza,
  frieza60,
  frieza10,
  dodoria,
  dodoria60,
  dodoria10,
  cell,
  cell60,
  cell10,
  raditz,
  raditz60,
  raditz10,
  nappa,
  nappa60,
  nappa10,
  whis,
  whis60,
  whis10,
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
  SelenicColor.krillin,
  SelenicColor.krillin60,
  SelenicColor.krillin10,
  SelenicColor.chichi,
  SelenicColor.chichi60,
  SelenicColor.chichi10,
  SelenicColor.roshi,
  SelenicColor.roshi60,
  SelenicColor.roshi10,
  SelenicColor.cell,
  SelenicColor.cell60,
  SelenicColor.cell10,
  SelenicColor.dodoria,
  SelenicColor.dodoria60,
  SelenicColor.dodoria10,
  SelenicColor.frieza,
  SelenicColor.frieza60,
  SelenicColor.frieza10,
  SelenicColor.nappa,
  SelenicColor.nappa60,
  SelenicColor.nappa10,
  SelenicColor.raditz,
  SelenicColor.raditz60,
  SelenicColor.raditz10,
  SelenicColor.whis,
  SelenicColor.whis60,
  SelenicColor.whis10,
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
      SelenicColor.krillin => context.selenicColors!.warning,
      SelenicColor.krillin60 => context.selenicColors!.warning60,
      SelenicColor.krillin10 => context.selenicColors!.warning10,
      SelenicColor.chichi => context.selenicColors!.error,
      SelenicColor.chichi60 => context.selenicColors!.error60,
      SelenicColor.chichi10 => context.selenicColors!.error10,
      SelenicColor.roshi => context.selenicColors!.success,
      SelenicColor.roshi60 => context.selenicColors!.success60,
      SelenicColor.roshi10 => context.selenicColors!.success10,
      SelenicColor.frieza => context.selenicColors!.supportive_1,
      SelenicColor.frieza60 => context.selenicColors!.supportive_1_60,
      SelenicColor.frieza10 => context.selenicColors!.supportive_1_10,
      SelenicColor.dodoria => context.selenicColors!.supportive_2,
      SelenicColor.dodoria60 => context.selenicColors!.supportive_2_60,
      SelenicColor.dodoria10 => context.selenicColors!.supportive_2_10,
      SelenicColor.cell => context.selenicColors!.supportive_3,
      SelenicColor.cell60 => context.selenicColors!.supportive_3_60,
      SelenicColor.cell10 => context.selenicColors!.supportive_3_10,
      SelenicColor.raditz => context.selenicColors!.supportive_4,
      SelenicColor.raditz60 => context.selenicColors!.supportive_4_60,
      SelenicColor.raditz10 => context.selenicColors!.supportive_4_10,
      SelenicColor.nappa => context.selenicColors!.supportive_5,
      SelenicColor.nappa60 => context.selenicColors!.supportive_5_60,
      SelenicColor.nappa10 => context.selenicColors!.supportive_5_10,
      SelenicColor.whis => context.selenicColors!.supportive_6,
      SelenicColor.whis60 => context.selenicColors!.supportive_6_60,
      SelenicColor.whis10 => context.selenicColors!.supportive_6_10,
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
