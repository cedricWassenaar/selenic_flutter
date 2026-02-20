import 'package:example/src/storybook/common/color_options.dart';
import 'package:example/src/storybook/common/widgets/text_divider.dart';
import 'package:flutter/material.dart';
import 'package:selenic_design/selenic_design.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

class SegmentedControlStory extends StatelessWidget {
  static const path = '/primitives/segmented_control';

  const SegmentedControlStory({super.key});

  @override
  Widget build(BuildContext context) {
    final segmentedControlSizeKnob = context.knobs.nullable.options(
      label: "segmentedControlSize",
      description: "Size variants for SelenicSegmentedControl.",
      enabled: false,
      initial: SelenicSegmentedControlSize.md,
      options: const [
        Option(label: "sm", value: SelenicSegmentedControlSize.sm),
        Option(label: "md", value: SelenicSegmentedControlSize.md),
      ],
    );

    final backgroundColorKnob = context.knobs.nullable.options(
      label: "backgroundColor",
      description:
          "SelenicColors variants for SelenicSegmentedControl background.",
      enabled: false,
      initial: 0,
      options: colorOptions,
    );

    final backgroundColor = colorTable(context)[backgroundColorKnob ?? 40];

    final selectedSegmentColorKnob = context.knobs.nullable.options(
      label: "selectedSegmentColor",
      description:
          "SelenicColors variants for SelenicSegmentedControl selected segment.",
      enabled: false,
      initial: 0,
      options: colorOptions,
    );

    final selectedSegmentColor =
        colorTable(context)[selectedSegmentColorKnob ?? 40];

    final textColorKnob = context.knobs.nullable.options(
      label: "textColor",
      description:
          "SelenicColors variants for SelenicSegmentedControl default text.",
      enabled: false,
      initial: 0,
      options: colorOptions,
    );

    final textColor = colorTable(context)[textColorKnob ?? 40];

    final selectedTextColorKnob = context.knobs.nullable.options(
      label: "selectedTextColor",
      description:
          "SelenicColors variants for SelenicSegmentedControl selected segment text.",
      enabled: false,
      initial: 0,
      options: colorOptions,
    );

    final selectedTextColor = colorTable(context)[selectedTextColorKnob ?? 40];

    final borderRadiusKnob = context.knobs.nullable.sliderInt(
      label: "borderRadius",
      description: "Border radius for SelenicSegmentedControl.",
      enabled: false,
      initial: 12,
      max: 32,
    );

    final segmentBorderRadiusKnob = context.knobs.nullable.sliderInt(
      label: "segmentBorderRadius",
      description: "Border radius for SelenicSegmentedControl segments.",
      enabled: false,
      initial: 8,
      max: 32,
    );

    final gapKnob = context.knobs.nullable.sliderInt(
      label: "gap",
      description: "Gap between SelenicSegmentedControl segments.",
      enabled: false,
      initial: 4,
      max: 12,
    );

    final showLeadingKnob = context.knobs.boolean(
      label: "leading",
      description: "Show widget in SelenicSegmentedControl leading slot.",
    );

    final showLabelKnob = context.knobs.boolean(
      label: "label",
      description: "Show widget in SelenicSegmentedControl label slot.",
      initial: true,
    );

    final showTrailingKnob = context.knobs.boolean(
      label: "trailing",
      description: "Show widget in SelenicSegmentedControl trailing slot.",
    );

    final isExpandedKnob = context.knobs.boolean(
      label: "isExpanded",
      description: "Expand SelenicSegmentControl horizontally.",
    );

    final isDisabledKnob = context.knobs.boolean(
      label: "isDisabled",
      description: "Disable SelenicSegmentedControl.",
    );

    final SegmentStyle segmentStyle = SegmentStyle(
      textColor: textColor,
      selectedTextColor: selectedTextColor,
      selectedSegmentColor: selectedSegmentColor,
      segmentBorderRadius: segmentBorderRadiusKnob != null
          ? BorderRadius.circular(segmentBorderRadiusKnob.toDouble())
          : null,
    );

    final BorderRadiusGeometry? borderRadius = borderRadiusKnob != null
        ? BorderRadius.circular(borderRadiusKnob.toDouble())
        : null;

    return Center(
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 64.0, horizontal: 16.0),
        child: Column(
          children: [
            const TextDivider(
              text: "SelenicSegmentedControl",
              paddingTop: 0,
            ),
            Column(
              children: [
                SelenicSegmentedControl(
                  isDisabled: isDisabledKnob,
                  isExpanded: isExpandedKnob,
                  gap: gapKnob?.toDouble(),
                  segmentedControlSize: segmentedControlSizeKnob,
                  backgroundColor: backgroundColor,
                  borderRadius: borderRadius,
                  segments: List.generate(
                    3,
                    (int index) => Segment(
                      leading: showLeadingKnob
                          ? const Icon(MoonIcons.other_frame_24_light)
                          : null,
                      label: showLabelKnob ? Text('Tab${index + 1}') : null,
                      trailing: showTrailingKnob
                          ? const Icon(MoonIcons.other_frame_24_light)
                          : null,
                      segmentStyle: segmentStyle,
                    ),
                  ),
                ),
                const TextDivider(text: "SelenicSegmentedControl with icons"),
                SelenicSegmentedControl(
                  isDisabled: isDisabledKnob,
                  isExpanded: isExpandedKnob,
                  gap: gapKnob?.toDouble(),
                  segmentedControlSize: segmentedControlSizeKnob,
                  backgroundColor: backgroundColor,
                  borderRadius: borderRadius,
                  segments: List.generate(
                    4,
                    (int index) => Segment(
                      trailing: const Icon(MoonIcons.other_frame_24_light),
                      segmentStyle: segmentStyle,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
