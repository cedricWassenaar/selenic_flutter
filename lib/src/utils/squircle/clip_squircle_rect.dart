import 'package:flutter/widgets.dart';

import 'package:selenic_design/src/utils/squircle/squircle_border.dart';
import 'package:selenic_design/src/utils/squircle/squircle_border_radius.dart';

class MoonClipSquircleRect extends StatelessWidget {
  final SelenicSquircleBorderRadius radius;
  final Clip clipBehavior;
  final Widget? child;

  const MoonClipSquircleRect({
    super.key,
    required this.child,
    this.radius = SelenicSquircleBorderRadius.zero,
    this.clipBehavior = Clip.antiAlias,
  });

  @override
  Widget build(BuildContext context) {
    return ClipPath.shape(
      clipBehavior: clipBehavior,
      shape: SelenicSquircleBorder(
        borderRadius: radius,
      ),
      child: child,
    );
  }
}
