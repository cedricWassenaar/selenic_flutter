import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:selenic_design/src/utils/color_premul_lerp.dart';

@immutable
class SelenicSwitchColors extends ThemeExtension<SelenicSwitchColors>
    with DiagnosticableTreeMixin {
  /// The background color of the active (on) SelenicSwitch track.
  final Color activeTrackColor;

  /// The background color of the inactive (off) SelenicSwitch track.
  final Color inactiveTrackColor;

  /// The text color of the active (on) SelenicSwitch.
  final Color activeTextColor;

  /// The text color of the inactive (off) SelenicSwitch.
  final Color inactiveTextColor;

  /// The icon color of the active (on) SelenicSwitch.
  final Color activeIconColor;

  /// The icon color of the inactive (off) SelenicSwitch.
  final Color inactiveIconColor;

  /// The icon color of the SelenicSwitch thumb.
  final Color thumbIconColor;

  /// The color of the SelenicSwitch thumb.
  final Color thumbColor;

  const SelenicSwitchColors({
    required this.activeTrackColor,
    required this.inactiveTrackColor,
    required this.activeTextColor,
    required this.inactiveTextColor,
    required this.activeIconColor,
    required this.inactiveIconColor,
    required this.thumbIconColor,
    required this.thumbColor,
  });

  @override
  SelenicSwitchColors copyWith({
    Color? activeTrackColor,
    Color? inactiveTrackColor,
    Color? activeTextColor,
    Color? inactiveTextColor,
    Color? activeIconColor,
    Color? inactiveIconColor,
    Color? thumbIconColor,
    Color? thumbColor,
  }) {
    return SelenicSwitchColors(
      activeTrackColor: activeTrackColor ?? this.activeTrackColor,
      inactiveTrackColor: inactiveTrackColor ?? this.inactiveTrackColor,
      activeTextColor: activeTextColor ?? this.activeTextColor,
      inactiveTextColor: inactiveTextColor ?? this.inactiveTextColor,
      activeIconColor: activeIconColor ?? this.activeIconColor,
      inactiveIconColor: inactiveIconColor ?? this.inactiveIconColor,
      thumbIconColor: thumbIconColor ?? this.thumbIconColor,
      thumbColor: thumbColor ?? this.thumbColor,
    );
  }

  @override
  SelenicSwitchColors lerp(
      ThemeExtension<SelenicSwitchColors>? other, double t) {
    if (other is! SelenicSwitchColors) return this;

    return SelenicSwitchColors(
      activeTrackColor:
          colorPremulLerp(activeTrackColor, other.activeTrackColor, t)!,
      inactiveTrackColor:
          colorPremulLerp(inactiveTrackColor, other.inactiveTrackColor, t)!,
      activeTextColor:
          colorPremulLerp(activeTextColor, other.activeTextColor, t)!,
      inactiveTextColor:
          colorPremulLerp(inactiveTextColor, other.inactiveTextColor, t)!,
      activeIconColor:
          colorPremulLerp(activeIconColor, other.activeIconColor, t)!,
      inactiveIconColor:
          colorPremulLerp(inactiveIconColor, other.inactiveIconColor, t)!,
      thumbIconColor: colorPremulLerp(thumbIconColor, other.thumbIconColor, t)!,
      thumbColor: colorPremulLerp(thumbColor, other.thumbColor, t)!,
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty("type", "SelenicSwitchColors"))
      ..add(ColorProperty("activeTrackColor", activeTrackColor))
      ..add(ColorProperty("inactiveTrackColor", inactiveTrackColor))
      ..add(ColorProperty("activeTextColor", activeTextColor))
      ..add(ColorProperty("inactiveTextColor", inactiveTextColor))
      ..add(ColorProperty("activeIconColor", activeIconColor))
      ..add(ColorProperty("inactiveIconColor", inactiveIconColor))
      ..add(ColorProperty("thumbIconColor", thumbIconColor))
      ..add(ColorProperty("thumbColor", thumbColor));
  }
}
