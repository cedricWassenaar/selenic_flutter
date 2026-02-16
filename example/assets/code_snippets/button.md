import 'package:flutter/material.dart';
import 'package:selenic_design/selenic_design.dart';

class Button extends StatelessWidget {
  const Button({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SelenicButton(
          buttonSize: SelenicButtonSize.sm,
          onTap: () {},
          leading: const Icon(MoonIcons.other_frame_24_light),
          label: const Text('SelenicButton'),
          trailing: const Icon(MoonIcons.other_frame_24_light),
        ),
        SelenicButton.icon(
          buttonSize: SelenicButtonSize.sm,
          onTap: () {},
          icon: const Icon(MoonIcons.other_frame_24_light),
        ),
        SelenicFilledButton(
          buttonSize: SelenicButtonSize.sm,
          onTap: () {},
          leading: const Icon(MoonIcons.other_frame_24_light),
          label: const Text("SelenicFilledButton"),
          trailing: const Icon(MoonIcons.other_frame_24_light),
        ),
        SelenicOutlinedButton(
          buttonSize: SelenicButtonSize.sm,
          onTap: () {},
          leading: const Icon(MoonIcons.other_frame_24_light),
          label: const Text("SelenicOutlinedButton"),
          trailing: const Icon(MoonIcons.other_frame_24_light),
        ),
        SelenicTextButton(
          buttonSize: SelenicButtonSize.sm,
          onTap: () {},
          leading: const Icon(MoonIcons.other_frame_24_light),
          label: const Text("SelenicTextButton"),
          trailing: const Icon(MoonIcons.other_frame_24_light),
        ),
      ],
    );
  }
}