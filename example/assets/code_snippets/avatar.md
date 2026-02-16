import 'package:flutter/material.dart';
import 'package:selenic_design/selenic_design.dart';

class Avatar extends StatelessWidget {
  const Avatar({super.key});

  @override
  Widget build(BuildContext context) {
    return const SelenicAvatar(
      avatarSize: SelenicAvatarSize.sm,
      showBadge: true,
      content: Text('MD'),
    );
  }
}