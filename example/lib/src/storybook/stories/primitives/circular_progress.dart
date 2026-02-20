import 'package:example/src/storybook/common/color_options.dart';
import 'package:flutter/material.dart';
import 'package:selenic_design/selenic_design.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

class CircularProgressStory extends StatelessWidget {
  static const subdirectory = '/progress';
  static const path = '/primitives/progress/circular_progress';

  const CircularProgressStory({super.key});

  @override
  Widget build(BuildContext context) {
    final circularProgressSizeKnob = context.knobs.nullable.options(
      label: "circularProgressSize",
      description: "Size variants for CircularProgress.",
      enabled: false,
      initial: SelenicCircularProgressSize.md,
      options: const [
        Option(label: "x2s", value: SelenicCircularProgressSize.x2s),
        Option(label: "xs", value: SelenicCircularProgressSize.xs),
        Option(label: "sm", value: SelenicCircularProgressSize.sm),
        Option(label: "md", value: SelenicCircularProgressSize.md),
        Option(label: "lg", value: SelenicCircularProgressSize.lg),
      ],
    );

    final circularProgressColorKnob = context.knobs.nullable.options(
      label: "color",
      description: "SelenicColors variants for CircularProgress.",
      enabled: false,
      initial: 0,
      options: colorOptions,
    );

    final color = colorTable(context)[circularProgressColorKnob ?? 40];

    final circularProgressBackgroundColorKnob = context.knobs.nullable.options(
      label: "backgroundColor",
      description: "SelenicColors variants for CircularProgress background.",
      enabled: false,
      initial: 0,
      options: colorOptions,
    );

    final backgroundColor =
        colorTable(context)[circularProgressBackgroundColorKnob ?? 40];

    final circularProgressStrokeCapKnob = context.knobs.nullable.options(
      label: "strokeCap",
      description: "Stroke gap for CircularProgress.",
      enabled: false,
      initial: StrokeCap.round,
      options: const [
        Option(label: "round", value: StrokeCap.round),
        Option(label: "square", value: StrokeCap.square),
        Option(label: "butt", value: StrokeCap.butt),
      ],
    );

    final circularProgressValueKnob = context.knobs.slider(
      label: "value",
      description: "Value for CircularProgress.",
      initial: 0.75,
    );

    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 64.0, horizontal: 16.0),
        child: SelenicCircularProgress(
          value: circularProgressValueKnob,
          color: color,
          backgroundColor: backgroundColor,
          circularProgressSize: circularProgressSizeKnob,
          strokeCap: circularProgressStrokeCapKnob,
        ),
      ),
    );
  }
}
