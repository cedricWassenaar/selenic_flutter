import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

@immutable
class SelenicSwitchProperties extends ThemeExtension<SelenicSwitchProperties>
    with DiagnosticableTreeMixin {
  /// The duration of the SelenicSwitch toggle animation.
  final Duration transitionDuration;

  /// The curve of the SelenicSwitch toggle animation.
  final Curve transitionCurve;

  const SelenicSwitchProperties({
    required this.transitionDuration,
    required this.transitionCurve,
  });

  @override
  SelenicSwitchProperties copyWith({
    Duration? transitionDuration,
    Curve? transitionCurve,
  }) {
    return SelenicSwitchProperties(
      transitionDuration: transitionDuration ?? this.transitionDuration,
      transitionCurve: transitionCurve ?? this.transitionCurve,
    );
  }

  @override
  SelenicSwitchProperties lerp(
    ThemeExtension<SelenicSwitchProperties>? other,
    double t,
  ) {
    if (other is! SelenicSwitchProperties) return this;

    return SelenicSwitchProperties(
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
        DiagnosticsProperty("type", "SelenicSwitchProperties"),
      )
      ..add(
        DiagnosticsProperty<Duration>("transitionDuration", transitionDuration),
      )
      ..add(
        DiagnosticsProperty<Curve>("transitionCurve", transitionCurve),
      );
  }
}
