import 'package:flutter/material.dart';

import 'package:selenic_design/selenic_design.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

enum SelenicColor {
  piccolo,
  hit,
  beerus,
  goku,
  gohan,
  bulma,
  trunks,
  goten,
  popo,
  jiren,
  heles,
  zeno,
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
  SelenicColor.piccolo,
  SelenicColor.hit,
  SelenicColor.beerus,
  SelenicColor.goku,
  SelenicColor.gohan,
  SelenicColor.bulma,
  SelenicColor.trunks,
  SelenicColor.goten,
  SelenicColor.popo,
  SelenicColor.jiren,
  SelenicColor.heles,
  SelenicColor.zeno,
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
      SelenicColor.piccolo => context.selenicColors!.piccolo,
      SelenicColor.hit => context.selenicColors!.hit,
      SelenicColor.beerus => context.selenicColors!.beerus,
      SelenicColor.goku => context.selenicColors!.goku,
      SelenicColor.gohan => context.selenicColors!.gohan,
      SelenicColor.bulma => context.selenicColors!.bulma,
      SelenicColor.trunks => context.selenicColors!.trunks,
      SelenicColor.goten => context.selenicColors!.goten,
      SelenicColor.popo => context.selenicColors!.popo,
      SelenicColor.jiren => context.selenicColors!.jiren,
      SelenicColor.heles => context.selenicColors!.heles,
      SelenicColor.zeno => context.selenicColors!.zeno,
      SelenicColor.krillin => context.selenicColors!.krillin,
      SelenicColor.krillin60 => context.selenicColors!.krillin60,
      SelenicColor.krillin10 => context.selenicColors!.krillin10,
      SelenicColor.chichi => context.selenicColors!.chichi,
      SelenicColor.chichi60 => context.selenicColors!.chichi60,
      SelenicColor.chichi10 => context.selenicColors!.chichi10,
      SelenicColor.roshi => context.selenicColors!.roshi,
      SelenicColor.roshi60 => context.selenicColors!.roshi60,
      SelenicColor.roshi10 => context.selenicColors!.roshi10,
      SelenicColor.frieza => context.selenicColors!.frieza,
      SelenicColor.frieza60 => context.selenicColors!.frieza60,
      SelenicColor.frieza10 => context.selenicColors!.frieza10,
      SelenicColor.dodoria => context.selenicColors!.dodoria,
      SelenicColor.dodoria60 => context.selenicColors!.dodoria60,
      SelenicColor.dodoria10 => context.selenicColors!.dodoria10,
      SelenicColor.cell => context.selenicColors!.cell,
      SelenicColor.cell60 => context.selenicColors!.cell60,
      SelenicColor.cell10 => context.selenicColors!.cell10,
      SelenicColor.raditz => context.selenicColors!.raditz,
      SelenicColor.raditz60 => context.selenicColors!.raditz60,
      SelenicColor.raditz10 => context.selenicColors!.raditz10,
      SelenicColor.nappa => context.selenicColors!.nappa,
      SelenicColor.nappa60 => context.selenicColors!.nappa60,
      SelenicColor.nappa10 => context.selenicColors!.nappa10,
      SelenicColor.whis => context.selenicColors!.whis,
      SelenicColor.whis60 => context.selenicColors!.whis60,
      SelenicColor.whis10 => context.selenicColors!.whis10,
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
