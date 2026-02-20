import 'package:example/src/storybook/common/color_options.dart';
import 'package:example/src/storybook/common/widgets/text_divider.dart';
import 'package:flutter/material.dart';
import 'package:selenic_design/selenic_design.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

enum AccordionItems { first, second }

class AccordionStory extends StatefulWidget {
  static const path = '/primitives/accordion';

  const AccordionStory({super.key});

  @override
  State<AccordionStory> createState() => _AccordionStoryState();
}

class _AccordionStoryState extends State<AccordionStory> {
  AccordionItems? _currentlyOpenAccordionItem = AccordionItems.first;

  @override
  Widget build(BuildContext context) {
    final accordionSizeKnob = context.knobs.nullable.options(
      label: "accordionSize",
      description: "Size variants for SelenicAccordion.",
      enabled: false,
      initial: SelenicAccordionSize.md,
      options: const [
        Option(label: "sm", value: SelenicAccordionSize.sm),
        Option(label: "md", value: SelenicAccordionSize.md),
        Option(label: "lg", value: SelenicAccordionSize.lg),
        Option(label: "xl", value: SelenicAccordionSize.xl),
      ],
    );

    final textColorKnob = context.knobs.nullable.options(
      label: "textColor",
      description: "SelenicColors variants for SelenicAccordion header text.",
      enabled: false,
      initial: 0,
      options: colorOptions,
    );

    final textColor = colorTable(context)[textColorKnob ?? 40];

    final expandedTextColorKnob = context.knobs.nullable.options(
      label: "expandedTextColor",
      description:
          "SelenicColors variants for expanded SelenicAccordion header text.",
      enabled: false,
      initial: 0,
      options: colorOptions,
    );

    final expandedTextColor = colorTable(context)[expandedTextColorKnob ?? 40];

    final contentTextColorKnob = context.knobs.nullable.options(
      label: "Content text color",
      description: "SelenicColors variants for SelenicAccordion content text.",
      enabled: false,
      initial: 0,
      options: colorOptions,
    );

    final contentTextColor = colorTable(context)[contentTextColorKnob ?? 40];

    final iconColorKnob = context.knobs.nullable.options(
      label: "iconColor",
      description: "SelenicColors variants for SelenicAccordion icon.",
      enabled: false,
      initial: 0,
      options: colorOptions,
    );

    final iconColor = colorTable(context)[iconColorKnob ?? 40];

    final expandedIconColorKnob = context.knobs.nullable.options(
      label: "expandedIconColor",
      description: "SelenicColors variants for expanded SelenicAccordion icon.",
      enabled: false,
      initial: 0,
      options: colorOptions,
    );

    final expandedIconColor = colorTable(context)[expandedIconColorKnob ?? 40];

    final backgroundColorKnob = context.knobs.nullable.options(
      label: "backgroundColor",
      description: "SelenicColors variants for SelenicAccordion background.",
      enabled: false,
      initial: 0,
      options: colorOptions,
    );

    final backgroundColor = colorTable(context)[backgroundColorKnob ?? 40];

    final expandedBackgroundColorKnob = context.knobs.nullable.options(
      label: "expandedBackgroundColor",
      description:
          "SelenicColors variants for expanded SelenicAccordion background.",
      enabled: false,
      initial: 0,
      options: colorOptions,
    );

    final expandedBackgroundColor =
        colorTable(context)[expandedBackgroundColorKnob ?? 40];

    final borderColorKnob = context.knobs.nullable.options(
      label: "borderColor",
      description: "SelenicColors variants for SelenicAccordion border.",
      enabled: false,
      initial: 0,
      options: colorOptions,
    );

    final borderColor = colorTable(context)[borderColorKnob ?? 40];

    final dividerColorKnob = context.knobs.nullable.options(
      label: "dividerColor",
      description:
          "SelenicColors variants for expanded SelenicAccordion divider.",
      enabled: false,
      initial: 0,
      options: colorOptions,
    );

    final dividerColor = colorTable(context)[dividerColorKnob ?? 40];

    final borderRadiusKnob = context.knobs.nullable.sliderInt(
      label: "borderRadius",
      description: "Border radius for SelenicAccordion.",
      enabled: false,
      initial: 8,
      max: 32,
    );

    final showBorderKnob = context.knobs.boolean(
      label: "showBorder",
      description: "Show border for SelenicAccordion.",
    );

    final showDividerKnob = context.knobs.boolean(
      label: "showDivider",
      description: "Show divider between SelenicAccordion header and body.",
      initial: true,
    );

    final showShadowKnob = context.knobs.boolean(
      label: "Show shadows",
      description: "Show shadows for SelenicAccordion.",
      initial: true,
    );

    const String contentText =
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do "
        "eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim "
        "ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut "
        "aliquip ex ea commodo consequat. Duis aute irure dolor in "
        "reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla "
        "pariatur. Excepteur sint occaecat cupidatat non proident, sunt in "
        "culpa qui officia deserunt mollit anim id est laborum.";

    final BorderRadiusGeometry? borderRadius = borderRadiusKnob != null
        ? BorderRadius.circular(borderRadiusKnob.toDouble())
        : null;

    return ListView(
      clipBehavior: Clip.none,
      padding: const EdgeInsets.symmetric(vertical: 64.0, horizontal: 16.0),
      children: [
        const TextDivider(
          text: "Grouped SelenicAccordion",
          paddingTop: 0,
        ),
        SelenicAccordion<AccordionItems>(
          identityValue: AccordionItems.first,
          groupIdentityValue: _currentlyOpenAccordionItem,
          accordionSize: accordionSizeKnob,
          textColor: textColor,
          expandedTextColor: expandedTextColor,
          iconColor: iconColor,
          expandedIconColor: expandedIconColor,
          borderColor: borderColor,
          backgroundColor: backgroundColor,
          expandedBackgroundColor: expandedBackgroundColor,
          dividerColor: dividerColor,
          borderRadius: borderRadius,
          showBorder: showBorderKnob,
          showDivider: showDividerKnob,
          shadows: showShadowKnob == true ? null : [],
          childrenPadding: const EdgeInsets.all(12),
          onExpansionChanged: (AccordionItems? value) =>
              setState(() => _currentlyOpenAccordionItem = value),
          leading: const Icon(MoonIcons.other_frame_24_light),
          label: const Text("Grouped SelenicAccordion item #1"),
          children: [
            Text(
              contentText,
              style: TextStyle(color: contentTextColor),
            ),
          ],
        ),
        const SizedBox(height: 8),
        SelenicAccordion<AccordionItems>(
          identityValue: AccordionItems.second,
          groupIdentityValue: _currentlyOpenAccordionItem,
          accordionSize: accordionSizeKnob,
          textColor: textColor,
          expandedTextColor: expandedTextColor,
          iconColor: iconColor,
          expandedIconColor: expandedIconColor,
          borderColor: borderColor,
          backgroundColor: backgroundColor,
          expandedBackgroundColor: expandedBackgroundColor,
          dividerColor: dividerColor,
          borderRadius: borderRadius,
          showBorder: showBorderKnob,
          showDivider: showDividerKnob,
          shadows: showShadowKnob == true ? null : [],
          childrenPadding: const EdgeInsets.all(12),
          onExpansionChanged: (AccordionItems? value) =>
              setState(() => _currentlyOpenAccordionItem = value),
          leading: const Icon(MoonIcons.other_frame_24_light),
          label: const Text("Grouped SelenicAccordion item #2"),
          children: [
            Text(
              contentText,
              style: TextStyle(color: contentTextColor),
            ),
          ],
        ),
        const TextDivider(
            text: "Ungrouped SelenicAccordion with content outside"),
        SelenicAccordion<AccordionItems>(
          accordionSize: accordionSizeKnob,
          initiallyExpanded: true,
          hasContentOutside: true,
          textColor: textColor,
          expandedTextColor: expandedTextColor,
          iconColor: iconColor,
          expandedIconColor: expandedIconColor,
          borderColor: borderColor,
          backgroundColor: backgroundColor,
          expandedBackgroundColor: expandedBackgroundColor,
          borderRadius: borderRadius,
          showBorder: showBorderKnob,
          shadows: showShadowKnob == true ? null : [],
          childrenPadding: const EdgeInsets.symmetric(vertical: 12),
          label: const Text("Ungrouped SelenicAccordion item #1"),
          children: [
            Text(
              contentText,
              style: TextStyle(color: contentTextColor),
            ),
          ],
        ),
        const SizedBox(height: 8),
        SelenicAccordion<AccordionItems>(
          accordionSize: accordionSizeKnob,
          hasContentOutside: true,
          textColor: textColor,
          expandedTextColor: expandedTextColor,
          iconColor: iconColor,
          expandedIconColor: expandedIconColor,
          borderColor: borderColor,
          backgroundColor: backgroundColor,
          expandedBackgroundColor: expandedBackgroundColor,
          dividerColor: dividerColor,
          borderRadius: borderRadius,
          showBorder: showBorderKnob,
          shadows: showShadowKnob == true ? null : [],
          childrenPadding: const EdgeInsets.symmetric(vertical: 12),
          label: const Text("Ungrouped SelenicAccordion item #2"),
          children: [
            Text(
              contentText,
              style: TextStyle(color: contentTextColor),
            ),
          ],
        ),
      ],
    );
  }
}
