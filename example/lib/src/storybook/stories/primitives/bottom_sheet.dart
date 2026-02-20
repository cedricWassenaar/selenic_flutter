import 'package:example/src/storybook/common/color_options.dart';
import 'package:flutter/material.dart';
import 'package:selenic_design/selenic_design.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

class BottomSheetStory extends StatelessWidget {
  static const path = '/primitives/bottom_sheet';

  const BottomSheetStory({super.key});

  @override
  Widget build(BuildContext context) {
    final backgroundColorKnob = context.knobs.nullable.options(
      label: "backgroundColor",
      description: "SelenicColors variants for SelenicBottomSheet background.",
      enabled: false,
      initial: 0,
      options: colorOptions,
    );

    final backgroundColor = colorTable(context)[backgroundColorKnob ?? 40];

    final barrierColorKnob = context.knobs.nullable.options(
      label: "barrierColor",
      description: "SelenicColors variants for SelenicBottomSheet barrier.",
      enabled: false,
      initial: 0,
      options: colorOptions,
    );

    final barrierColor = colorTable(context)[barrierColorKnob ?? 40];

    final borderRadiusKnob = context.knobs.nullable.sliderInt(
      label: "borderRadius",
      description: "Border radius for SelenicBottomSheet.",
      enabled: false,
      initial: 8,
      max: 32,
    );

    final heightKnob = context.knobs.nullable.slider(
      label: "height",
      description: "Height of SelenicBottomSheet.",
      enabled: false,
      initial: 0.64,
      min: 0.1,
    );

    final closeProgressThresholdKnob = context.knobs.nullable.slider(
      label: "closeProgressThreshold",
      description: "Close progress threshold for SelenicBottomSheet.",
      enabled: false,
      initial: 0.6,
    );

    Future<dynamic> bottomSheetBuilder(BuildContext context) {
      return showSelenicModalBottomSheet(
        context: context,
        backgroundColor: backgroundColor,
        barrierColor: barrierColor,
        height: heightKnob != null
            ? MediaQuery.of(context).size.height * heightKnob
            : MediaQuery.of(context).size.height * 0.7,
        closeProgressThreshold: closeProgressThresholdKnob,
        borderRadius: borderRadiusKnob != null
            ? BorderRadius.circular(borderRadiusKnob.toDouble())
            : null,
        builder: (BuildContext context) => Column(
          children: [
            Container(
              height: 4,
              width: 40,
              margin: const EdgeInsets.symmetric(vertical: 8),
              decoration: ShapeDecoration(
                color: context.selenicColors!.lineAccent,
                shape: const StadiumBorder(),
              ),
            ),
            Row(
              children: [
                const SizedBox(width: 48),
                Expanded(
                  child: Center(
                    child: Text(
                      'Pick your choice!',
                      style: SelenicTypography.typography.body.text16,
                    ),
                  ),
                ),
                SizedBox(
                  width: 48,
                  height: 48,
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: SelenicButton.icon(
                      icon: const Icon(MoonIcons.controls_close_small_16_light),
                      buttonSize: SelenicButtonSize.sm,
                      backgroundColor: context.selenicColors!.lineAccent,
                      borderRadius: BorderRadius.circular(24),
                      onTap: () => Navigator.of(context).pop(),
                    ),
                  ),
                ),
              ],
            ),
            Divider(
              height: 0,
              thickness: 1,
              color: context.selenicColors!.lineAccent,
            ),
            Expanded(
              child: ListView.builder(
                primary: true,
                itemCount: 100,
                padding: EdgeInsets.zero,
                itemBuilder: (BuildContext _, int index) => Padding(
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text("Item nr:"),
                      Text("$index"),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    }

    return Center(
      child: Builder(
        builder: (BuildContext context) {
          return SelenicFilledButton(
            label: const Text("Tap me"),
            onTap: () => bottomSheetBuilder(context),
          );
        },
      ),
    );
  }
}
