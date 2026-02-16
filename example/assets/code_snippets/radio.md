import 'package:flutter/material.dart';
import 'package:selenic_design/selenic_design.dart';

enum RadioSelection { first, second }

class Radio extends StatefulWidget {
  const Radio({super.key});

  @override
  State<Radio> createState() => _RadioState();
}

class _RadioState extends State<Radio> {
  RadioSelection? radioSelection = RadioSelection.first;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SelenicRadio(
          value: RadioSelection.first,
          groupValue: radioSelection,
          onChanged: (RadioSelection? selection) => setState(() => radioSelection = selection),
        ),
        SelenicMenuItem(
          absorbGestures: true,
          onTap: () => setState(() => radioSelection = RadioSelection.second),
          label: const Text("SelenicRadio with label"),
          trailing: SelenicRadio(
            value: RadioSelection.second,
            groupValue: radioSelection,
            tapAreaSizeValue: 0,
            onChanged: (_) {},
          ),
        ),
      ],
    );
  }
}