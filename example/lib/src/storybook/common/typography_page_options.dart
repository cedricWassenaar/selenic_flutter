import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:selenic_design/selenic_design.dart';

enum SelenicTextStyle {
  body,
  heading,
}

enum SelenicTextSize {
  size6,
  size8,
  size9,
  size10,
  size12,
  size14,
  size16,
  size18,
  size20,
  size24,
  size32,
  size40,
  size48,
  size56,
  size64,
  size72;

  String get name {
    final String rawName = toString().split('.').last;
    return rawName.replaceFirst('size', 'Size ');
  }
}

TextStyle getBodyTextStyle(BuildContext context, SelenicTextSize textSize) =>
    switch (textSize) {
      SelenicTextSize.size6 => context.selenicTypography!.body.text6,
      SelenicTextSize.size8 => context.selenicTypography!.body.text8,
      SelenicTextSize.size9 => context.selenicTypography!.body.text9,
      SelenicTextSize.size10 => context.selenicTypography!.body.text10,
      SelenicTextSize.size12 => context.selenicTypography!.body.text12,
      SelenicTextSize.size14 => context.selenicTypography!.body.text14,
      SelenicTextSize.size16 => context.selenicTypography!.body.text16,
      SelenicTextSize.size18 => context.selenicTypography!.body.text18,
      SelenicTextSize.size20 => context.selenicTypography!.body.text20,
      SelenicTextSize.size24 => context.selenicTypography!.body.text24,
      SelenicTextSize.size32 => context.selenicTypography!.body.text32,
      SelenicTextSize.size40 => context.selenicTypography!.body.text40,
      SelenicTextSize.size48 => context.selenicTypography!.body.text48,
      SelenicTextSize.size56 => context.selenicTypography!.body.text56,
      SelenicTextSize.size64 => context.selenicTypography!.body.text64,
      SelenicTextSize.size72 => context.selenicTypography!.body.text72,
    };

TextStyle getHeadingTextStyle(BuildContext context, SelenicTextSize textSize) =>
    switch (textSize) {
      SelenicTextSize.size6 => context.selenicTypography!.heading.text6,
      SelenicTextSize.size8 => context.selenicTypography!.heading.text8,
      SelenicTextSize.size9 => context.selenicTypography!.heading.text9,
      SelenicTextSize.size10 => context.selenicTypography!.heading.text10,
      SelenicTextSize.size12 => context.selenicTypography!.heading.text12,
      SelenicTextSize.size14 => context.selenicTypography!.heading.text14,
      SelenicTextSize.size16 => context.selenicTypography!.heading.text16,
      SelenicTextSize.size18 => context.selenicTypography!.heading.text18,
      SelenicTextSize.size20 => context.selenicTypography!.heading.text20,
      SelenicTextSize.size24 => context.selenicTypography!.heading.text24,
      SelenicTextSize.size32 => context.selenicTypography!.heading.text32,
      SelenicTextSize.size40 => context.selenicTypography!.heading.text40,
      SelenicTextSize.size48 => context.selenicTypography!.heading.text48,
      SelenicTextSize.size56 => context.selenicTypography!.heading.text56,
      SelenicTextSize.size64 => context.selenicTypography!.heading.text64,
      SelenicTextSize.size72 => context.selenicTypography!.heading.text72,
    };

enum TypographyPageSection {
  typography,
  body,
  heading;

  String get titleText => switch (this) {
        typography => 'Typography',
        body => 'Body',
        heading => 'Heading',
      };

  String get bodyText => switch (this) {
        typography => 'Moon typography includes body and heading text styles. '
            'The body and header text styles have a set font size, while the '
            'heading text style also includes a semibold font weight.',
        _ => '',
      };
}
