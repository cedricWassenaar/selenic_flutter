import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

@immutable
class SelenicAvatarSizeProperties
    extends ThemeExtension<SelenicAvatarSizeProperties>
    with DiagnosticableTreeMixin {
  /// The border radius of the SelenicAvatar.
  final BorderRadiusGeometry borderRadius;

  /// The size value of the SelenicAvatar.
  final double avatarSizeValue;

  /// The margin value of the SelenicAvatar badge.
  final double badgeMarginValue;

  /// The size value of the SelenicAvatar badge.
  final double badgeSizeValue;

  /// The text style of the SelenicAvatar.
  final TextStyle textStyle;

  const SelenicAvatarSizeProperties({
    required this.avatarSizeValue,
    required this.badgeSizeValue,
    required this.badgeMarginValue,
    required this.borderRadius,
    required this.textStyle,
  });

  @override
  SelenicAvatarSizeProperties copyWith({
    BorderRadiusGeometry? borderRadius,
    double? avatarSizeValue,
    double? badgeMarginValue,
    double? badgeSizeValue,
    TextStyle? textStyle,
  }) {
    return SelenicAvatarSizeProperties(
      borderRadius: borderRadius ?? this.borderRadius,
      avatarSizeValue: avatarSizeValue ?? this.avatarSizeValue,
      badgeMarginValue: badgeMarginValue ?? this.badgeMarginValue,
      badgeSizeValue: badgeSizeValue ?? this.badgeSizeValue,
      textStyle: textStyle ?? this.textStyle,
    );
  }

  @override
  SelenicAvatarSizeProperties lerp(
    ThemeExtension<SelenicAvatarSizeProperties>? other,
    double t,
  ) {
    if (other is! SelenicAvatarSizeProperties) return this;

    return SelenicAvatarSizeProperties(
      borderRadius:
          BorderRadiusGeometry.lerp(borderRadius, other.borderRadius, t)!,
      avatarSizeValue: lerpDouble(avatarSizeValue, other.avatarSizeValue, t)!,
      badgeMarginValue:
          lerpDouble(badgeMarginValue, other.badgeMarginValue, t)!,
      badgeSizeValue: lerpDouble(badgeSizeValue, other.badgeSizeValue, t)!,
      textStyle: TextStyle.lerp(textStyle, other.textStyle, t)!,
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(
        DiagnosticsProperty("type", "SelenicAvatarSizeProperties"),
      )
      ..add(
        DiagnosticsProperty<BorderRadiusGeometry>("borderRadius", borderRadius),
      )
      ..add(DoubleProperty("avatarSizeValue", avatarSizeValue))
      ..add(DoubleProperty("badgeMarginValue", badgeMarginValue))
      ..add(DoubleProperty("badgeSizeValue", badgeSizeValue))
      ..add(DiagnosticsProperty<TextStyle>("textStyle", textStyle));
  }
}
