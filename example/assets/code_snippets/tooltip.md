import 'package:flutter/material.dart';
import 'package:selenic_design/selenic_design.dart';

class Tooltip extends StatefulWidget {
  const Tooltip({super.key});

  @override
  State<Tooltip> createState() => _TooltipState();
}

class _TooltipState extends State<Tooltip> {
  bool showOnTap = false;

  @override
  Widget build(BuildContext context) {
    return SelenicTooltip(
      show: showOnTap,
      content: const Text('This is SelenicTooltip'),
      child: SelenicFilledButton(
        buttonSize: SelenicButtonSize.sm,
        onTap: () => setState(() => showOnTap = true),
        label: const Text("Show SelenicTooltip"),
      ),
    );
  }
}