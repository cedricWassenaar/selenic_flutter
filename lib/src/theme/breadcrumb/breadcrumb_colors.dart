import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:selenic_design/src/utils/color_premul_lerp.dart';

@immutable
class SelenicBreadcrumbColors extends ThemeExtension<SelenicBreadcrumbColors>
    with DiagnosticableTreeMixin {
  /// The icon and text color of the SelenicBreadcrumb item.
  final Color itemColor;

  /// The icon and text color of the current SelenicBreadcrumb item.
  final Color? currentItemColor;

  /// The icon and text color of the SelenicBreadcrumb item on hover.
  final Color? hoverEffectColor;

  const SelenicBreadcrumbColors({
    required this.itemColor,
    required this.currentItemColor,
    required this.hoverEffectColor,
  });

  @override
  SelenicBreadcrumbColors copyWith({
    Color? itemColor,
    Color? currentItemColor,
    Color? hoverEffectColor,
  }) {
    return SelenicBreadcrumbColors(
      itemColor: itemColor ?? this.itemColor,
      currentItemColor: currentItemColor ?? this.currentItemColor,
      hoverEffectColor: hoverEffectColor ?? this.hoverEffectColor,
    );
  }

  @override
  SelenicBreadcrumbColors lerp(
    ThemeExtension<SelenicBreadcrumbColors>? other,
    double t,
  ) {
    if (other is! SelenicBreadcrumbColors) return this;

    return SelenicBreadcrumbColors(
      itemColor: colorPremulLerp(itemColor, other.itemColor, t)!,
      currentItemColor:
          colorPremulLerp(currentItemColor, other.currentItemColor, t),
      hoverEffectColor:
          colorPremulLerp(hoverEffectColor, other.hoverEffectColor, t),
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty("type", "SelenicBreadcrumbColors"))
      ..add(ColorProperty("itemColor", itemColor))
      ..add(ColorProperty("currentItemColor", currentItemColor))
      ..add(ColorProperty("hoverEffectColor", hoverEffectColor));
  }
}
