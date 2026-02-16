import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

@immutable
class SelenicAccordionProperties
    extends ThemeExtension<SelenicAccordionProperties>
    with DiagnosticableTreeMixin {
  /// The duration of the SelenicAccordion transition animation
  /// (expand and collapse).
  final Duration transitionDuration;

  /// The curve of the SelenicAccordion transition animation (expand and collapse).
  final Curve transitionCurve;

  const SelenicAccordionProperties({
    required this.transitionDuration,
    required this.transitionCurve,
  });

  @override
  SelenicAccordionProperties copyWith({
    Duration? transitionDuration,
    Curve? transitionCurve,
  }) {
    return SelenicAccordionProperties(
      transitionDuration: transitionDuration ?? this.transitionDuration,
      transitionCurve: transitionCurve ?? this.transitionCurve,
    );
  }

  @override
  SelenicAccordionProperties lerp(
    ThemeExtension<SelenicAccordionProperties>? other,
    double t,
  ) {
    if (other is! SelenicAccordionProperties) return this;

    return SelenicAccordionProperties(
      transitionDuration:
          lerpDuration(transitionDuration, other.transitionDuration, t),
      transitionCurve: other.transitionCurve,
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(
        DiagnosticsProperty("type", "SelenicAccordionProperties"),
      )
      ..add(
        DiagnosticsProperty<Duration>("transitionDuration", transitionDuration),
      )
      ..add(
        DiagnosticsProperty<Curve>("transitionCurve", transitionCurve),
      );
  }
}
