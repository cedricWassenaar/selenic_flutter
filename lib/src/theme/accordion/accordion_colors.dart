import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:selenic_design/src/utils/color_premul_lerp.dart';

@immutable
class SelenicAccordionColors extends ThemeExtension<SelenicAccordionColors>
    with DiagnosticableTreeMixin {
  /// The text color of the collapsed SelenicAccordion header.
  final Color textColor;

  /// The text color of the expanded SelenicAccordion header.
  final Color expandedTextColor;

  /// The text and icon color of the expanded SelenicAccordion content.
  final Color contentColor;

  /// The icon color of the collapsed SelenicAccordion header.
  final Color iconColor;

  /// The icon color of the expanded SelenicAccordion header.
  final Color expandedIconColor;

  /// The default trailing icon color of the collapsed SelenicAccordion header.
  final Color trailingIconColor;

  /// The default trailing icon color of the expanded SelenicAccordion header.
  final Color expandedTrailingIconColor;

  /// The background color of the collapsed SelenicAccordion.
  final Color backgroundColor;

  /// The background color of the expanded SelenicAccordion.
  final Color expandedBackgroundColor;

  /// The border color of the SelenicAccordion.
  final Color borderColor;

  /// The color of the line dividing the SelenicAccordion header from the body.
  final Color dividerColor;

  const SelenicAccordionColors({
    required this.textColor,
    required this.expandedTextColor,
    required this.contentColor,
    required this.iconColor,
    required this.expandedIconColor,
    required this.trailingIconColor,
    required this.expandedTrailingIconColor,
    required this.backgroundColor,
    required this.expandedBackgroundColor,
    required this.borderColor,
    required this.dividerColor,
  });

  @override
  SelenicAccordionColors copyWith({
    Color? textColor,
    Color? expandedTextColor,
    Color? contentColor,
    Color? iconColor,
    Color? expandedIconColor,
    Color? trailingIconColor,
    Color? expandedTrailingIconColor,
    Color? backgroundColor,
    Color? expandedBackgroundColor,
    Color? borderColor,
    Color? dividerColor,
  }) {
    return SelenicAccordionColors(
      textColor: textColor ?? this.textColor,
      expandedTextColor: expandedTextColor ?? this.expandedTextColor,
      contentColor: contentColor ?? this.contentColor,
      iconColor: iconColor ?? this.iconColor,
      expandedIconColor: expandedIconColor ?? this.expandedIconColor,
      trailingIconColor: trailingIconColor ?? this.trailingIconColor,
      expandedTrailingIconColor:
          expandedTrailingIconColor ?? this.expandedTrailingIconColor,
      backgroundColor: backgroundColor ?? this.backgroundColor,
      expandedBackgroundColor:
          expandedBackgroundColor ?? this.expandedBackgroundColor,
      borderColor: borderColor ?? this.borderColor,
      dividerColor: dividerColor ?? this.dividerColor,
    );
  }

  @override
  SelenicAccordionColors lerp(
    ThemeExtension<SelenicAccordionColors>? other,
    double t,
  ) {
    if (other is! SelenicAccordionColors) return this;

    return SelenicAccordionColors(
      textColor: colorPremulLerp(textColor, other.textColor, t)!,
      expandedTextColor:
          colorPremulLerp(expandedTextColor, other.expandedTextColor, t)!,
      contentColor: colorPremulLerp(contentColor, other.contentColor, t)!,
      iconColor: colorPremulLerp(iconColor, other.iconColor, t)!,
      expandedIconColor:
          colorPremulLerp(expandedIconColor, other.expandedIconColor, t)!,
      trailingIconColor:
          colorPremulLerp(trailingIconColor, other.trailingIconColor, t)!,
      expandedTrailingIconColor: colorPremulLerp(
        expandedTrailingIconColor,
        other.expandedTrailingIconColor,
        t,
      )!,
      backgroundColor:
          colorPremulLerp(backgroundColor, other.backgroundColor, t)!,
      expandedBackgroundColor: colorPremulLerp(
        expandedBackgroundColor,
        other.expandedBackgroundColor,
        t,
      )!,
      borderColor: colorPremulLerp(borderColor, other.borderColor, t)!,
      dividerColor: colorPremulLerp(dividerColor, other.dividerColor, t)!,
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty("type", "SelenicAccordionColors"))
      ..add(ColorProperty("textColor", textColor))
      ..add(ColorProperty("expandedTextColor", expandedTextColor))
      ..add(ColorProperty("contentColor", contentColor))
      ..add(ColorProperty("iconColor", iconColor))
      ..add(ColorProperty("expandedIconColor", expandedIconColor))
      ..add(ColorProperty("trailingIconColor", trailingIconColor))
      ..add(
        ColorProperty("expandedTrailingIconColor", expandedTrailingIconColor),
      )
      ..add(
        ColorProperty("backgroundColor", backgroundColor),
      )
      ..add(
        ColorProperty("expandedBackgroundColor", expandedBackgroundColor),
      )
      ..add(
        ColorProperty("borderColor", borderColor),
      )
      ..add(
        ColorProperty("dividerColor", dividerColor),
      );
  }
}
