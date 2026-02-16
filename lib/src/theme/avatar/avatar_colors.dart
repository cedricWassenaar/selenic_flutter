import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:selenic_design/src/utils/color_premul_lerp.dart';

@immutable
class SelenicAvatarColors extends ThemeExtension<SelenicAvatarColors>
    with DiagnosticableTreeMixin {
  /// The background color of the SelenicAvatar.
  final Color backgroundColor;

  /// The color of the SelenicAvatar badge.
  final Color badgeColor;

  /// The icon color of the SelenicAvatar.
  final Color iconColor;

  /// The text color of the SelenicAvatar.
  final Color textColor;

  const SelenicAvatarColors({
    required this.backgroundColor,
    required this.badgeColor,
    required this.iconColor,
    required this.textColor,
  });

  @override
  SelenicAvatarColors copyWith({
    Color? backgroundColor,
    Color? badgeColor,
    Color? iconColor,
    Color? textColor,
  }) {
    return SelenicAvatarColors(
      backgroundColor: backgroundColor ?? this.backgroundColor,
      badgeColor: badgeColor ?? this.badgeColor,
      iconColor: iconColor ?? this.iconColor,
      textColor: textColor ?? this.textColor,
    );
  }

  @override
  SelenicAvatarColors lerp(
      ThemeExtension<SelenicAvatarColors>? other, double t) {
    if (other is! SelenicAvatarColors) return this;

    return SelenicAvatarColors(
      backgroundColor:
          colorPremulLerp(backgroundColor, other.backgroundColor, t)!,
      badgeColor: colorPremulLerp(badgeColor, other.badgeColor, t)!,
      iconColor: colorPremulLerp(iconColor, other.iconColor, t)!,
      textColor: colorPremulLerp(textColor, other.textColor, t)!,
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty("type", "SelenicAvatarColors"))
      ..add(ColorProperty("backgroundColor", backgroundColor))
      ..add(ColorProperty("badgeColor", badgeColor))
      ..add(ColorProperty("iconColor", iconColor))
      ..add(ColorProperty("textColor", textColor));
  }
}
