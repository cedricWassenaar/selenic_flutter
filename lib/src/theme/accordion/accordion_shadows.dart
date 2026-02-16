import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

@immutable
class SelenicAccordionShadows extends ThemeExtension<SelenicAccordionShadows>
    with DiagnosticableTreeMixin {
  /// The list of shadows applied to the SelenicAccordion.
  final List<BoxShadow> shadows;

  const SelenicAccordionShadows({required this.shadows});

  @override
  SelenicAccordionShadows copyWith({List<BoxShadow>? shadows}) {
    return SelenicAccordionShadows(
      shadows: shadows ?? this.shadows,
    );
  }

  @override
  SelenicAccordionShadows lerp(
    ThemeExtension<SelenicAccordionShadows>? other,
    double t,
  ) {
    if (other is! SelenicAccordionShadows) return this;

    return SelenicAccordionShadows(
      shadows: BoxShadow.lerpList(shadows, other.shadows, t)!,
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty("type", "SelenicAccordionShadows"))
      ..add(DiagnosticsProperty<List<BoxShadow>>("shadows", shadows));
  }
}
