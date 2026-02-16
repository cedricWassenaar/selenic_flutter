import 'package:flutter/material.dart';
import 'package:selenic_design/selenic_design.dart';

class Switch extends StatefulWidget {
  const Switch({super.key});

  @override
  State<Switch> createState() => _SwitchState();
}

class _SwitchState extends State<Switch> {
  bool switchValue = false;

  @override
  Widget build(BuildContext context) {
    return SelenicSwitch(
      value: switchValue,
      switchSize: SelenicSwitchSize.sm,
      onChanged: (bool newValue) => setState(() => switchValue = newValue),
    );
  }
}