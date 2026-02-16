import 'package:flutter/material.dart';
import 'package:selenic_design/selenic_design.dart';

class Popover extends StatefulWidget {
  const Popover({super.key});

  @override
  State<Popover> createState() => _PopoverState();
}

class _PopoverState extends State<Popover> {
  bool show = false;

  @override
  Widget build(BuildContext context) {
    return SelenicPopover(
      show: show,
      onTapOutside: () => setState(() => show = false),
      content: const Text('This is SelenicPopover'),
      child: SelenicFilledButton(
        onTap: () => setState(() => show = !show),
        label: const Text("Show SelenicPopover"),
      ),
    );
  }
}