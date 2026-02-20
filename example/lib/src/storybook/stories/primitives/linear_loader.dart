import 'package:example/src/storybook/common/color_options.dart';
import 'package:flutter/material.dart';
import 'package:selenic_design/selenic_design.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

class LinearLoaderStory extends StatelessWidget {
  static const path = '/primitives/loader/linear_loader';

  const LinearLoaderStory({super.key});

  @override
  Widget build(BuildContext context) {
    final linearLoaderSizeKnob = context.knobs.nullable.options(
      label: "linearLoaderSize",
      description: "Size variants for SelenicLinearLoader.",
      enabled: false,
      initial: SelenicLinearLoaderSize.x4s,
      options: const [
        Option(label: "x6s", value: SelenicLinearLoaderSize.x6s),
        Option(label: "x5s", value: SelenicLinearLoaderSize.x5s),
        Option(label: "x4s", value: SelenicLinearLoaderSize.x4s),
        Option(label: "x3s", value: SelenicLinearLoaderSize.x3s),
        Option(label: "x2s", value: SelenicLinearLoaderSize.x2s),
      ],
    );

    final loaderColorKnob = context.knobs.nullable.options(
      label: "color",
      description: "SelenicColors variants for SelenicLinearLoader.",
      enabled: false,
      initial: 0,
      options: colorOptions,
    );

    final color = colorTable(context)[loaderColorKnob ?? 40];

    final loaderBackgroundColorKnob = context.knobs.nullable.options(
      label: "backgroundColor",
      description: "SelenicColors variants for SelenicLinearLoader background.",
      enabled: false,
      initial: 0,
      options: colorOptions,
    );

    final backgroundColor =
        colorTable(context)[loaderBackgroundColorKnob ?? 40];

    final borderRadiusKnob = context.knobs.nullable.sliderInt(
      label: "borderRadius",
      description: "Border radius for SelenicLinearLoader.",
      enabled: false,
      initial: 8,
      max: 32,
    );

    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 64.0, horizontal: 16.0),
        child: SelenicLinearLoader(
          linearLoaderSize: linearLoaderSizeKnob,
          color: color,
          backgroundColor: backgroundColor,
          borderRadius: borderRadiusKnob != null
              ? BorderRadius.circular(borderRadiusKnob.toDouble())
              : null,
        ),
      ),
    );
  }
}
