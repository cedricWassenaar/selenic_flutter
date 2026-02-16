import 'package:flutter/material.dart';
import 'package:selenic_design/selenic_design.dart';

class Tag extends StatelessWidget {
  const Tag({super.key});

  @override
  Widget build(BuildContext context) {
    return SelenicTag(
      tagSize: SelenicTagSize.sm,
      onTap: () {},
      leading: const Icon(MoonIcons.controls_close_small_16_light),
      label: const Text('This is SelenicTag'),
      trailing: const Icon(MoonIcons.controls_close_small_16_light),
    );
  }
}
