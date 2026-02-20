import 'package:example/src/storybook/common/color_options.dart';
import 'package:example/src/storybook/common/widgets/text_divider.dart';
import 'package:flutter/material.dart';
import 'package:selenic_design/selenic_design.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

class ChipStory extends StatelessWidget {
  static const path = '/primitives/chip';

  const ChipStory({super.key});

  @override
  Widget build(BuildContext context) {
    final customLabelTextKnob = context.knobs.text(
      label: "Label text",
      initial: "SelenicChip",
    );

    final chipSizeKnob = context.knobs.nullable.options(
      label: "chipSize",
      description: "Size variants for SelenicChip.",
      enabled: false,
      initial: SelenicChipSize.md,
      options: const [
        Option(label: "sm", value: SelenicChipSize.sm),
        Option(label: "md", value: SelenicChipSize.md),
      ],
    );

    final textColorKnob = context.knobs.nullable.options(
      label: "textColor",
      description: "SelenicColors variants for SelenicChip text.",
      enabled: false,
      initial: 0,
      options: colorOptions,
    );

    final textColor = colorTable(context)[textColorKnob ?? 40];

    final activeColorKnob = context.knobs.nullable.options(
      label: "activeColor",
      description: "SelenicColors variants for active SelenicChip.",
      enabled: false,
      initial: 0,
      options: colorOptions,
    );

    final activeColor = colorTable(context)[activeColorKnob ?? 40];

    final backgroundColorKnob = context.knobs.nullable.options(
      label: "backgroundColor",
      description: "SelenicColors variants for SelenicChip background.",
      enabled: false,
      initial: 0,
      options: colorOptions,
    );

    final backgroundColor = colorTable(context)[backgroundColorKnob ?? 40];

    final activeBackgroundColorKnob = context.knobs.nullable.options(
      label: "activeBackgroundColor",
      description: "SelenicColors variants for active SelenicChip background.",
      enabled: false,
      initial: 0,
      options: colorOptions,
    );

    final activeBackgroundColor =
        colorTable(context)[activeBackgroundColorKnob ?? 40];

    final borderColorKnob = context.knobs.nullable.options(
      label: "borderColor",
      description: "SelenicColors variants for SelenicChip border.",
      enabled: false,
      initial: 0,
      options: colorOptions,
    );

    final borderColor = colorTable(context)[borderColorKnob ?? 40];

    final borderRadiusKnob = context.knobs.nullable.sliderInt(
      label: "borderRadius",
      description: "Border radius for SelenicChip.",
      enabled: false,
      initial: 8,
      max: 32,
    );

    final showBorderKnob = context.knobs.boolean(
      label: "showBorder",
      description: "Show border when hovered, focused or isActive is true.",
    );

    final isActiveKnob = context.knobs.boolean(
      label: "isActive",
      description: "Whether SelenicChip is active/selected.",
    );

    final showLeadingKnob = context.knobs.boolean(
      label: "leading",
      description: "Show widget in SelenicChip leading slot.",
      initial: true,
    );

    final showLabelKnob = context.knobs.boolean(
      label: "label",
      description: "Show widget in SelenicChip label slot.",
      initial: true,
    );

    final showTrailingKnob = context.knobs.boolean(
      label: "trailing",
      description: "Show widget in SelenicChip trailing slot.",
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
              text: "SelenicChip",
              paddingTop: 0,
            ),
            SelenicChip(
              activeColor: activeColor,
              borderColor: borderColor,
              backgroundColor: backgroundColor,
              activeBackgroundColor: activeBackgroundColor,
              textColor: textColor,
              isActive: isActiveKnob,
              borderRadius: borderRadius,
              showBorder: showBorderKnob,
              chipSize: chipSizeKnob,
              leading: showLeadingKnob
                  ? const Icon(MoonIcons.other_frame_24_light)
                  : null,
              label: showLabelKnob ? Text(customLabelTextKnob) : null,
              trailing: showTrailingKnob
                  ? const Icon(MoonIcons.other_frame_24_light)
                  : null,
            ),
            const TextDivider(text: "Text SelenicChip"),
            SelenicChip.text(
              activeBackgroundColor: activeBackgroundColor,
              borderColor: borderColor,
              textColor: textColor,
              isActive: isActiveKnob,
              borderRadius: borderRadius,
              showBorder: showBorderKnob,
              chipSize: chipSizeKnob,
              leading: showLeadingKnob
                  ? const Icon(MoonIcons.other_frame_24_light)
                  : null,
              label: showLabelKnob ? Text(customLabelTextKnob) : null,
              trailing: showTrailingKnob
                  ? const Icon(MoonIcons.other_frame_24_light)
                  : null,
            ),
            const TextDivider(text: "Custom SelenicChip"),
            SelenicChip(
              isActive: isActiveKnob,
              activeColor: context.selenicColors!.supportive_2,
              backgroundColor: context.selenicColors!.warning,
              activeBackgroundColor: context.selenicColors!.error_10,
              textColor: context.selenicColors!.filledButton,
              borderWidth: 2,
              showBorder: showBorderKnob,
              chipSize: chipSizeKnob,
              leading: showLeadingKnob
                  ? const Icon(MoonIcons.other_frame_24_light)
                  : null,
              label: showLabelKnob ? Text(customLabelTextKnob) : null,
              trailing: showTrailingKnob
                  ? const Icon(MoonIcons.other_frame_24_light)
                  : null,
            ),
          ],
        ),
      ),
    );
  }
}
