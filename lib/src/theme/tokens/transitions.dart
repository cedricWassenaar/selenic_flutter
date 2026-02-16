import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

@immutable
class SelenicTransitions extends ThemeExtension<SelenicTransitions>
    with DiagnosticableTreeMixin {
  static const transitions = SelenicTransitions(
    defaultTransitionDuration: Duration(milliseconds: 200),
    defaultTransitionCurve: Curves.easeInOutCubic,
  );

  /// The default transition duration.
  final Duration defaultTransitionDuration;

  /// The default transition curve.
  final Curve defaultTransitionCurve;

  const SelenicTransitions({
    required this.defaultTransitionDuration,
    required this.defaultTransitionCurve,
  });

  @override
  SelenicTransitions copyWith({
    Duration? defaultTransitionDuration,
    Curve? defaultTransitionCurve,
  }) {
    return SelenicTransitions(
      defaultTransitionDuration:
          defaultTransitionDuration ?? this.defaultTransitionDuration,
      defaultTransitionCurve:
          defaultTransitionCurve ?? this.defaultTransitionCurve,
    );
  }

  @override
  SelenicTransitions lerp(ThemeExtension<SelenicTransitions>? other, double t) {
    if (other is! SelenicTransitions) return this;

    return SelenicTransitions(
      defaultTransitionDuration: lerpDuration(
        defaultTransitionDuration,
        other.defaultTransitionDuration,
        t,
      ),
      defaultTransitionCurve: other.defaultTransitionCurve,
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(
        DiagnosticsProperty(
          "type",
          "SelenicTransitions",
        ),
      )
      ..add(
        DiagnosticsProperty<Duration>(
          "defaultTransitionDuration",
          defaultTransitionDuration,
        ),
      )
      ..add(
        DiagnosticsProperty<Curve>(
          "defaultTransitionCurve",
          defaultTransitionCurve,
        ),
      );
  }
}
