import 'package:flutter/material.dart';
import 'package:selenic_design/selenic_design.dart';

class Checkbox extends StatefulWidget {
  const Checkbox({super.key});

  @override
  State<Checkbox> createState() => _CheckboxState();
}

class _CheckboxState extends State<Checkbox> {
  bool? checkboxValue = false;
  bool checkboxWithLabelValue = false;
  bool? tristateCheckboxWithLabelValue = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SelenicCheckbox(
          value: checkboxValue,
          onChanged: (bool? newValue) => setState(() => checkboxValue = newValue),
        ),
        SelenicMenuItem(
          absorbGestures: true,
          onTap: () => setState(() => checkboxWithLabelValue = !checkboxWithLabelValue),
          label: const Text("SelenicCheckbox with label"),
          trailing: SelenicCheckbox(
            value: checkboxWithLabelValue,
            tapAreaSizeValue: 0,
            onChanged: (_) => {},
          ),
        ),
        SelenicMenuItem(
          absorbGestures: true,
          onTap: () => setState(
            () => switch (tristateCheckboxWithLabelValue) {
              true => tristateCheckboxWithLabelValue = null,
              null => tristateCheckboxWithLabelValue = false,
              false => tristateCheckboxWithLabelValue = true,
            },
          ),
          label: const Text("Tristate SelenicCheckbox with label"),
          trailing: SelenicCheckbox(
            value: tristateCheckboxWithLabelValue,
            tapAreaSizeValue: 0,
            onChanged: (_) => {},
          ),
        ),
      ],
    );
  }
}