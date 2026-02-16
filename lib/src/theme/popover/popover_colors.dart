import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:selenic_design/src/utils/color_premul_lerp.dart';

@immutable
class SelenicPopoverColors extends ThemeExtension<SelenicPopoverColors>
    with DiagnosticableTreeMixin {
  /// The text color of the SelenicPopover.
  final Color textColor;

  /// The icon color of the SelenicPopover.
  final Color iconColor;

  /// The background color of the SelenicPopover.
  final Color backgroundColor;

  const SelenicPopoverColors({
    required this.textColor,
    required this.iconColor,
    required this.backgroundColor,
  });

  @override
  SelenicPopoverColors copyWith({
    Color? textColor,
    Color? iconColor,
    Color? backgroundColor,
  }) {
    return SelenicPopoverColors(
      textColor: textColor ?? this.textColor,
      iconColor: iconColor ?? this.iconColor,
      backgroundColor: backgroundColor ?? this.backgroundColor,
    );
  }

  @override
  SelenicPopoverColors lerp(
      ThemeExtension<SelenicPopoverColors>? other, double t) {
    if (other is! SelenicPopoverColors) return this;

    return SelenicPopoverColors(
      textColor: colorPremulLerp(textColor, other.textColor, t)!,
      iconColor: colorPremulLerp(iconColor, other.iconColor, t)!,
      backgroundColor:
          colorPremulLerp(backgroundColor, other.backgroundColor, t)!,
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty("type", "SelenicPopoverColors"))
      ..add(ColorProperty("textColor", textColor))
      ..add(ColorProperty("iconColor", iconColor))
      ..add(ColorProperty("backgroundColor", backgroundColor));
  }
}
