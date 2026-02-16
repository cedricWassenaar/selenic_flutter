import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

@immutable
class SelenicTableProperties extends ThemeExtension<SelenicTableProperties>
    with DiagnosticableTreeMixin {
  /// The duration of the SelenicTable row label transition animation during horizontal scrolling.
  final Duration transitionDuration;

  /// The curve of the SelenicTable row label transition animation during horizontal scrolling.
  final Curve transitionCurve;

  const SelenicTableProperties({
    required this.transitionDuration,
    required this.transitionCurve,
  });

  @override
  SelenicTableProperties copyWith({
    Duration? transitionDuration,
    Curve? transitionCurve,
  }) {
    return SelenicTableProperties(
      transitionDuration: transitionDuration ?? this.transitionDuration,
      transitionCurve: transitionCurve ?? this.transitionCurve,
    );
  }

  @override
  SelenicTableProperties lerp(
    ThemeExtension<SelenicTableProperties>? other,
    double t,
  ) {
    if (other is! SelenicTableProperties) return this;

    return SelenicTableProperties(
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
        DiagnosticsProperty("type", "SelenicTableProperties"),
      )
      ..add(
        DiagnosticsProperty<Duration>("transitionDuration", transitionDuration),
      )
      ..add(
        DiagnosticsProperty<Curve>("transitionCurve", transitionCurve),
      );
  }
}
