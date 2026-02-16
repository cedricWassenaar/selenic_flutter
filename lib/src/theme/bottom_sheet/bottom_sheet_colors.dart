import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:selenic_design/src/utils/color_premul_lerp.dart';

@immutable
class SelenicBottomSheetColors extends ThemeExtension<SelenicBottomSheetColors>
    with DiagnosticableTreeMixin {
  /// The text color of the SelenicBottomSheet.
  final Color textColor;

  /// The icon color of the SelenicBottomSheet.
  final Color iconColor;

  /// The background color of the SelenicBottomSheet.
  final Color backgroundColor;

  /// The color of the SelenicBottomSheet barrier.
  final Color barrierColor;

  const SelenicBottomSheetColors({
    required this.textColor,
    required this.iconColor,
    required this.backgroundColor,
    required this.barrierColor,
  });

  @override
  SelenicBottomSheetColors copyWith({
    Color? textColor,
    Color? iconColor,
    Color? backgroundColor,
    Color? barrierColor,
  }) {
    return SelenicBottomSheetColors(
      textColor: textColor ?? this.textColor,
      iconColor: iconColor ?? this.iconColor,
      backgroundColor: backgroundColor ?? this.backgroundColor,
      barrierColor: barrierColor ?? this.barrierColor,
    );
  }

  @override
  SelenicBottomSheetColors lerp(
    ThemeExtension<SelenicBottomSheetColors>? other,
    double t,
  ) {
    if (other is! SelenicBottomSheetColors) return this;

    return SelenicBottomSheetColors(
      textColor: colorPremulLerp(textColor, other.textColor, t)!,
      iconColor: colorPremulLerp(iconColor, other.iconColor, t)!,
      backgroundColor:
          colorPremulLerp(backgroundColor, other.backgroundColor, t)!,
      barrierColor: colorPremulLerp(barrierColor, other.barrierColor, t)!,
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty("type", "SelenicBottomSheetColors"))
      ..add(ColorProperty("textColor", textColor))
      ..add(ColorProperty("iconColor", iconColor))
      ..add(ColorProperty("backgroundColor", backgroundColor))
      ..add(ColorProperty("barrierColor", barrierColor));
  }
}
