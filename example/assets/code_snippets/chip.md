import 'package:flutter/material.dart';
import 'package:selenic_design/selenic_design.dart';

class Chip extends StatelessWidget {
  const Chip({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        SelenicChip(
          chipSize: SelenicChipSize.sm,
          leading: Icon(MoonIcons.other_frame_24_light),
          label: Text('SelenicChip'),
          trailing: Icon(MoonIcons.other_frame_24_light),
        ),
        SelenicChip.text(
          chipSize: SelenicChipSize.sm,
          leading: Icon(MoonIcons.other_frame_24_light),
          label: Text('SelenicChip with text'),
          trailing: Icon(MoonIcons.other_frame_24_light),
        ),
      ],
    );
  }
}