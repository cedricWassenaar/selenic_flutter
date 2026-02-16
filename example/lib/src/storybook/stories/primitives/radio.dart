import 'package:example/src/storybook/common/color_options.dart';
import 'package:example/src/storybook/common/widgets/text_divider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:selenic_design/selenic_design.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

enum ChoiceCustom { first, second }

enum ChoiceLabel { first, second }

class RadioStory extends StatefulWidget {
  static const path = '/primitives/radio';

  const RadioStory({super.key});

  @override
  State<RadioStory> createState() => _RadioStoryState();
}

class _RadioStoryState extends State<RadioStory> {
  ChoiceCustom? valueCustom = ChoiceCustom.first;
  ChoiceLabel? valueLabel = ChoiceLabel.first;

  @override
  Widget build(BuildContext context) {
    final activeColorKnob = context.knobs.nullable.options(
      label: "activeColor",
      description: "MoonColors variants for checked SelenicRadio.",
      enabled: false,
      initial: 0,
      // piccolo
      options: colorOptions,
    );

    final activeColor = colorTable(context)[activeColorKnob ?? 40];

    final inactiveColorKnob = context.knobs.nullable.options(
      label: "inactiveColor",
      description: "MoonColors variants for unchecked SelenicRadio.",
      enabled: false,
      initial: 0,
      // piccolo
      options: colorOptions,
    );

    final inactiveColor = colorTable(context)[inactiveColorKnob ?? 40];

    final isToggleableKnob = context.knobs.boolean(
      label: "toggleable",
      description: "Whether selected SelenicRadio can be unselected.",
    );

    final isDisabledKnob = context.knobs.boolean(
      label: "Disabled",
      description: "SelenicRadio onChanged() is null.",
    );

    return Center(
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 64.0, horizontal: 16.0),
        child: Column(
          children: [
            const TextDivider(
              text: "SelenicRadio",
              paddingTop: 0,
            ),
            ...List.generate(
              2,
              (int index) => SelenicRadio(
                value: ChoiceCustom.values[index],
                groupValue: valueCustom,
                activeColor: activeColor,
                inactiveColor: inactiveColor,
                toggleable: isToggleableKnob,
                onChanged: isDisabledKnob
                    ? null
                    : (ChoiceCustom? choice) =>
                        setState(() => valueCustom = choice),
              ),
            ),
            const TextDivider(text: "SelenicRadio with label"),
            ...List.generate(
              2,
              (int index) => SelenicMenuItem(
                absorbGestures: true,
                onTap: isDisabledKnob
                    ? null
                    : () => setState(
                          () {
                            if (isToggleableKnob &&
                                valueLabel == ChoiceLabel.values[index]) {
                              valueLabel = null;
                            } else {
                              valueLabel = ChoiceLabel.values[index];
                            }
                          },
                        ),
                label: Text("With label #${index + 1}"),
                trailing: SelenicRadio(
                  value: ChoiceLabel.values[index],
                  groupValue: valueLabel,
                  toggleable: isToggleableKnob,
                  tapAreaSizeValue: 0,
                  onChanged: isDisabledKnob ? null : (_) {},
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
