import 'package:example/src/storybook/common/color_options.dart';
import 'package:flutter/material.dart';
import 'package:selenic_design/selenic_design.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

class TagStory extends StatelessWidget {
  static const path = '/primitives/tag';

  const TagStory({super.key});

  @override
  Widget build(BuildContext context) {
    final customLabelTextKnob = context.knobs.text(
      label: "Tag label text",
      initial: "SelenicTag",
    );

    final tagSizeKnob = context.knobs.nullable.options(
      label: "tagSize",
      description: "Size variants for SelenicTag.",
      enabled: false,
      initial: SelenicTagSize.xs,
      options: const [
        Option(label: "x2s", value: SelenicTagSize.x2s),
        Option(label: "xs", value: SelenicTagSize.xs),
        Option(label: "sm", value: SelenicTagSize.sm),
      ],
    );

    final textColorKnob = context.knobs.nullable.options(
      label: "Text color",
      description: "SelenicColors variants for SelenicTag text.",
      enabled: false,
      initial: 0,
      options: colorOptions,
    );

    final textColor = colorTable(context)[textColorKnob ?? 40];

    final iconColorKnob = context.knobs.nullable.options(
      label: "Icon color",
      description: "SelenicColors variants for SelenicTag icon.",
      enabled: false,
      initial: 0,
      options: colorOptions,
    );

    final iconColor = colorTable(context)[iconColorKnob ?? 40];

    final backgroundColorKnob = context.knobs.nullable.options(
      label: "backgroundColor",
      description: "SelenicColors variants for SelenicTag background.",
      enabled: false,
      initial: 0,
      options: colorOptions,
    );

    final backgroundColor = colorTable(context)[backgroundColorKnob ?? 40];

    final borderRadiusKnob = context.knobs.nullable.sliderInt(
      label: "borderRadius",
      description: "Border radius for SelenicTag.",
      enabled: false,
      initial: 4,
      max: 32,
    );

    final showLeadingKnob = context.knobs.boolean(
      label: "leading",
      description: "Show widget in SelenicTag leading slot.",
    );

    final showLabelKnob = context.knobs.boolean(
      label: "label",
      description: "Show widget in SelenicTag label slot.",
      initial: true,
    );

    final showTrailingKnob = context.knobs.boolean(
      label: "trailing",
      description: "Show widget in SelenicTag trailing slot.",
      initial: true,
    );

    return Center(
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 64.0, horizontal: 16.0),
        child: SelenicTag(
          borderRadius: borderRadiusKnob != null
              ? BorderRadius.circular(borderRadiusKnob.toDouble())
              : null,
          onTap: () {},
          tagSize: tagSizeKnob,
          backgroundColor: backgroundColor,
          leading: showLeadingKnob
              ? Icon(
                  MoonIcons.controls_close_small_16_light,
                  color: iconColor,
                )
              : null,
          label: showLabelKnob
              ? Text(
                  customLabelTextKnob,
                  style: TextStyle(color: textColor),
                )
              : null,
          trailing: showTrailingKnob
              ? Icon(
                  MoonIcons.controls_close_small_16_light,
                  color: iconColor,
                )
              : null,
        ),
      ),
    );
  }
}
