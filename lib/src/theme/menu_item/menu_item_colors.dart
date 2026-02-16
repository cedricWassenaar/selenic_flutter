import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:selenic_design/src/utils/color_premul_lerp.dart';

@immutable
class SelenicMenuItemColors extends ThemeExtension<SelenicMenuItemColors>
    with DiagnosticableTreeMixin {
  /// The background color of the SelenicMenuItem.
  final Color backgroundColor;

  /// The color of the SelenicMenuItem divider.
  final Color dividerColor;

  /// The icon color of the SelenicMenuItem.
  final Color iconColor;

  /// The text color of the SelenicMenuItem label.
  final Color labelTextColor;

  /// The text color of the SelenicMenuItem content.
  final Color contentTextColor;

  const SelenicMenuItemColors({
    required this.backgroundColor,
    required this.dividerColor,
    required this.iconColor,
    required this.labelTextColor,
    required this.contentTextColor,
  });

  @override
  SelenicMenuItemColors copyWith({
    Color? backgroundColor,
    Color? dividerColor,
    Color? iconColor,
    Color? labelTextColor,
    Color? contentTextColor,
  }) {
    return SelenicMenuItemColors(
      backgroundColor: backgroundColor ?? this.backgroundColor,
      dividerColor: dividerColor ?? this.dividerColor,
      iconColor: iconColor ?? this.iconColor,
      labelTextColor: labelTextColor ?? this.labelTextColor,
      contentTextColor: contentTextColor ?? this.contentTextColor,
    );
  }

  @override
  SelenicMenuItemColors lerp(
      ThemeExtension<SelenicMenuItemColors>? other, double t) {
    if (other is! SelenicMenuItemColors) return this;

    return SelenicMenuItemColors(
      backgroundColor:
          colorPremulLerp(backgroundColor, other.backgroundColor, t)!,
      dividerColor: colorPremulLerp(dividerColor, other.dividerColor, t)!,
      iconColor: colorPremulLerp(iconColor, other.iconColor, t)!,
      labelTextColor: colorPremulLerp(labelTextColor, other.labelTextColor, t)!,
      contentTextColor:
          colorPremulLerp(contentTextColor, other.contentTextColor, t)!,
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty("type", "SelenicMenuItemColors"))
      ..add(ColorProperty("backgroundColor", backgroundColor))
      ..add(ColorProperty("dividerColor", dividerColor))
      ..add(ColorProperty("iconColor", iconColor))
      ..add(ColorProperty("labelTextColor", labelTextColor))
      ..add(ColorProperty("contentTextColor", contentTextColor));
  }
}
