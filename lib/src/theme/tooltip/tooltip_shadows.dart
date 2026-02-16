import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

@immutable
class SelenicTooltipShadows extends ThemeExtension<SelenicTooltipShadows>
    with DiagnosticableTreeMixin {
  /// The list of shadows applied to the SelenicTooltip.
  final List<BoxShadow> tooltipShadows;

  const SelenicTooltipShadows({required this.tooltipShadows});

  @override
  SelenicTooltipShadows copyWith({List<BoxShadow>? tooltipShadows}) {
    return SelenicTooltipShadows(
      tooltipShadows: tooltipShadows ?? this.tooltipShadows,
    );
  }

  @override
  SelenicTooltipShadows lerp(
      ThemeExtension<SelenicTooltipShadows>? other, double t) {
    if (other is! SelenicTooltipShadows) return this;

    return SelenicTooltipShadows(
      tooltipShadows: BoxShadow.lerpList(
        tooltipShadows,
        other.tooltipShadows,
        t,
      )!,
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(
        DiagnosticsProperty("type", "SelenicTooltipShadows"),
      )
      ..add(
        DiagnosticsProperty<List<BoxShadow>>("tooltipShadows", tooltipShadows),
      );
  }
}
