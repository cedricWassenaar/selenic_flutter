import 'package:example/src/storybook/common/color_options.dart';
import 'package:example/src/storybook/common/widgets/text_divider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:selenic_design/selenic_design.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

class CheckboxStory extends StatefulWidget {
  static const path = '/primitives/checkbox';

  const CheckboxStory({super.key});

  @override
  State<CheckboxStory> createState() => _CheckboxStoryState();
}

class _CheckboxStoryState extends State<CheckboxStory> {
  bool? checkboxValue = false;
  bool? checkboxWithLabelValue = false;

  @override
  Widget build(BuildContext context) {
    final checkColorKnob = context.knobs.nullable.options(
      label: "checkColor",
      description: "SelenicColors variants for SelenicCheckbox check icon.",
      enabled: false,
      initial: 0,
      options: colorOptions,
    );

    final checkColor = colorTable(context)[checkColorKnob ?? 40];

    final activeColorKnob = context.knobs.nullable.options(
      label: "activeColor",
      description: "SelenicColors variants for checked SelenicCheckbox.",
      enabled: false,
      initial: 0,
      options: colorOptions,
    );

    final activeColor = colorTable(context)[activeColorKnob ?? 40];

    final inactiveColorKnob = context.knobs.nullable.options(
      label: "inactiveColor",
      description: "SelenicColors variants for unchecked SelenicCheckbox.",
      enabled: false,
      initial: 0,
      options: colorOptions,
    );

    final inactiveColor = colorTable(context)[inactiveColorKnob ?? 40];

    final borderColorKnob = context.knobs.nullable.options(
      label: "borderColor",
      description:
          "SelenicColors variants for unchecked SelenicCheckbox border.",
      enabled: false,
      initial: 0,
      options: colorOptions,
    );

    final borderColor = colorTable(context)[borderColorKnob ?? 40];

    final isTristateKnob = context.knobs.boolean(
      label: "tristate",
      description: "Whether SelenicCheckbox uses tristate.",
    );

    final isDisabledKnob = context.knobs.boolean(
      label: "Disabled",
      description: "SelenicCheckbox onChanged() is null.",
    );

    return Center(
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 64.0, horizontal: 16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const TextDivider(
              text: "SelenicCheckbox",
              paddingTop: 0,
            ),
            SelenicCheckbox(
              activeColor: activeColor,
              inactiveColor: inactiveColor,
              checkColor: checkColor,
              borderColor: borderColor,
              tristate: isTristateKnob,
              value: checkboxValue,
              onChanged: isDisabledKnob
                  ? null
                  : (bool? newValue) =>
                      setState(() => checkboxValue = newValue),
            ),
            const TextDivider(text: "SelenicCheckbox with label"),
            SelenicMenuItem(
              absorbGestures: true,
              onTap: isDisabledKnob
                  ? null
                  : () => setState(
                        () => switch (checkboxWithLabelValue) {
                          true when isTristateKnob => checkboxWithLabelValue =
                              null,
                          false when isTristateKnob => checkboxWithLabelValue =
                              true,
                          null => checkboxWithLabelValue = false,
                          _ => checkboxWithLabelValue =
                              !checkboxWithLabelValue!,
                        },
                      ),
              label: const Text("With label"),
              trailing: SelenicCheckbox(
                activeColor: activeColor,
                inactiveColor: inactiveColor,
                checkColor: checkColor,
                tristate: isTristateKnob,
                value: checkboxWithLabelValue,
                tapAreaSizeValue: 0,
                onChanged: isDisabledKnob ? null : (_) {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
