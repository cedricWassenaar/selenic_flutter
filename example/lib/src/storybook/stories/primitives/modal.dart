import 'package:example/src/storybook/common/color_options.dart';
import 'package:flutter/material.dart';
import 'package:selenic_design/selenic_design.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

class ModalStory extends StatelessWidget {
  static const path = '/primitives/modal';

  const ModalStory({super.key});

  @override
  Widget build(BuildContext context) {
    final textColorKnob = context.knobs.nullable.options(
      label: "Text color",
      description: "SelenicColors variants for SelenicModal text.",
      enabled: false,
      initial: 0,
      options: colorOptions,
    );

    final textColor = colorTable(context)[textColorKnob ?? 40];

    final backgroundColorKnob = context.knobs.nullable.options(
      label: "backgroundColor",
      description: "SelenicColors variants for SelenicModal background.",
      enabled: false,
      initial: 0,
      options: colorOptions,
    );

    final backgroundColor = colorTable(context)[backgroundColorKnob ?? 40];

    final barrierColorKnob = context.knobs.nullable.options(
      label: "barrierColor",
      description: "SelenicColors variants for SelenicModal barrier.",
      enabled: false,
      initial: 0,
      options: colorOptions,
    );

    final barrierColor = colorTable(context)[barrierColorKnob ?? 40];

    final borderRadiusKnob = context.knobs.nullable.sliderInt(
      label: "borderRadius",
      description: "Border radius for SelenicModal.",
      enabled: false,
      initial: 8,
      max: 32,
    );

    Future<void> modalBuilder(BuildContext context) {
      return showSelenicModal<void>(
        context: context,
        useRootNavigator: false,
        barrierColor: barrierColor,
        builder: (BuildContext context) {
          return Directionality(
            textDirection: Directionality.of(context),
            child: SelenicModal(
              backgroundColor: backgroundColor,
              borderRadius: borderRadiusKnob != null
                  ? BorderRadius.circular(borderRadiusKnob.toDouble())
                  : null,
              child: SizedBox(
                width: 300,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(24, 20, 24, 16),
                      child: Text(
                        "SelenicModal title",
                        style: context.selenicTypography!.heading.text18
                            .copyWith(color: textColor),
                      ),
                    ),
                    Divider(
                      height: 1,
                      color: context.selenicColors!.bodyTextSecondary,
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(24, 16, 24, 16),
                      child: Text(
                        "Re-open the SelenicModal to view the updated knob value.",
                        style: context.selenicTypography!.body.text14
                            .copyWith(color: textColor),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(24, 16, 24, 24),
                      child: SelenicFilledButton(
                        label: const Text("Okay"),
                        isFullWidth: true,
                        onTap: () => Navigator.of(context).pop(),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      );
    }

    return Center(
      child: Builder(
        builder: (BuildContext context) {
          return SelenicFilledButton(
            label: const Text("Tap me"),
            onTap: () => modalBuilder(context),
          );
        },
      ),
    );
  }
}
