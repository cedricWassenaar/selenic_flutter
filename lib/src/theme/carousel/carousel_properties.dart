import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

@immutable
class SelenicCarouselProperties
    extends ThemeExtension<SelenicCarouselProperties>
    with DiagnosticableTreeMixin {
  /// The gap between the SelenicCarousel items.
  final double gap;

  /// The text style of the SelenicCarousel items.
  final TextStyle textStyle;

  /// The delay between the items in the SelenicCarousel's automatic scrolling
  /// sequence.
  final Duration autoPlayDelay;

  /// The duration of the SelenicCarousel autoplay transition animation.
  final Duration transitionDuration;

  /// The curve of the SelenicCarousel autoplay transition animation.
  final Curve transitionCurve;

  const SelenicCarouselProperties({
    required this.gap,
    required this.textStyle,
    required this.autoPlayDelay,
    required this.transitionDuration,
    required this.transitionCurve,
  });

  @override
  SelenicCarouselProperties copyWith({
    double? gap,
    TextStyle? textStyle,
    Duration? autoPlayDelay,
    Duration? transitionDuration,
    Curve? transitionCurve,
  }) {
    return SelenicCarouselProperties(
      gap: gap ?? this.gap,
      textStyle: textStyle ?? this.textStyle,
      autoPlayDelay: autoPlayDelay ?? this.autoPlayDelay,
      transitionDuration: transitionDuration ?? this.transitionDuration,
      transitionCurve: transitionCurve ?? this.transitionCurve,
    );
  }

  @override
  SelenicCarouselProperties lerp(
    ThemeExtension<SelenicCarouselProperties>? other,
    double t,
  ) {
    if (other is! SelenicCarouselProperties) return this;

    return SelenicCarouselProperties(
      gap: lerpDouble(gap, other.gap, t)!,
      textStyle: TextStyle.lerp(textStyle, other.textStyle, t)!,
      autoPlayDelay: lerpDuration(autoPlayDelay, other.autoPlayDelay, t),
      transitionDuration:
          lerpDuration(transitionDuration, other.transitionDuration, t),
      transitionCurve: other.transitionCurve,
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty("type", "SelenicCarouselProperties"))
      ..add(DoubleProperty("gap", gap))
      ..add(DiagnosticsProperty<TextStyle>("textStyle", textStyle))
      ..add(DiagnosticsProperty<Duration>("autoPlayDelay", autoPlayDelay))
      ..add(
        DiagnosticsProperty<Duration>("transitionDuration", transitionDuration),
      )
      ..add(
        DiagnosticsProperty<Curve>("transitionCurve", transitionCurve),
      );
  }
}
