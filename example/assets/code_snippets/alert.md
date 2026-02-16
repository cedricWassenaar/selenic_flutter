import 'package:flutter/material.dart';
import 'package:selenic_design/selenic_design.dart';

class Alert extends StatelessWidget {
  const Alert({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SelenicAlert(
          show: true,
          leading: const Icon(MoonIcons.other_frame_24_light),
          label: const Text("Base SelenicAlert"),
          trailing: SelenicButton.icon(
            buttonSize: SelenicButtonSize.xs,
            onTap: () => {},
            icon: const Icon(MoonIcons.controls_close_24_light),
          ),
          content: const Text("Here goes SelenicAlert content"),
        ),
        SelenicAlert.filled(
          show: true,
          color: context.selenicColors!.chichi,
          backgroundColor: context.selenicColors!.chichi10,
          leading: const Icon(MoonIcons.notifications_alert_24_light),
          label: const Text("Filled error SelenicAlert"),
          trailing: SelenicButton.icon(
            buttonSize: SelenicButtonSize.xs,
            onTap: () {},
            icon: Icon(
              MoonIcons.controls_close_small_24_light,
              color: context.selenicColors!.chichi,
            ),
          ),
        ),
        SelenicAlert.outlined(
          show: true,
          color: context.selenicColors!.roshi,
          borderColor: context.selenicColors!.roshi,
          leading: const Icon(MoonIcons.generic_check_rounded_24_light),
          label: const Text("Outlined success SelenicAlert"),
          trailing: SelenicButton.icon(
            buttonSize: SelenicButtonSize.xs,
            onTap: () {},
            icon: Icon(
              MoonIcons.controls_close_small_24_light,
              color: context.selenicColors!.roshi,
            ),
          ),
        ),
      ],
    );
  }
}