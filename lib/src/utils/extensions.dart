import 'package:flutter/widgets.dart';

import 'package:selenic_design/src/utils/squircle/squircle_border_radius.dart';
import 'package:selenic_design/src/utils/squircle/squircle_radius.dart';

extension BuildContextX on BuildContext {
  /// Whether the dark mode is currently active.
  bool get isDarkMode {
    final brightness = MediaQuery.of(this).platformBrightness;
    return brightness == Brightness.dark;
  }
}

extension BorderRadiusGeometryX on BorderRadiusGeometry {
  /// Returns the SelenicSquircleBorderRadius.
  SelenicSquircleBorderRadius squircleBorderRadius(BuildContext context) {
    final borderRadius = resolve(Directionality.of(context));

    return SelenicSquircleBorderRadius.only(
      topLeft: SelenicSquircleRadius(cornerRadius: borderRadius.topLeft.x),
      topRight: SelenicSquircleRadius(cornerRadius: borderRadius.topRight.x),
      bottomLeft:
          SelenicSquircleRadius(cornerRadius: borderRadius.bottomLeft.x),
      bottomRight:
          SelenicSquircleRadius(cornerRadius: borderRadius.bottomRight.x),
    );
  }
}
