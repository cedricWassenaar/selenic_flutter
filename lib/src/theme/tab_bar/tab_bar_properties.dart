import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

@immutable
class SelenicTabBarProperties extends ThemeExtension<SelenicTabBarProperties>
    with DiagnosticableTreeMixin {
  /// The gap between the SelenicTabBar tabs.
  final double gap;

  /// The duration of the SelenicTabBar transition animation.
  final Duration transitionDuration;

  /// The curve of the SelenicTabBar transition animation.
  final Curve transitionCurve;

  const SelenicTabBarProperties({
    required this.gap,
    required this.transitionDuration,
    required this.transitionCurve,
  });

  @override
  SelenicTabBarProperties copyWith({
    double? gap,
    Duration? transitionDuration,
    Curve? transitionCurve,
  }) {
    return SelenicTabBarProperties(
      gap: gap ?? this.gap,
      transitionDuration: transitionDuration ?? this.transitionDuration,
      transitionCurve: transitionCurve ?? this.transitionCurve,
    );
  }

  @override
  SelenicTabBarProperties lerp(
    ThemeExtension<SelenicTabBarProperties>? other,
    double t,
  ) {
    if (other is! SelenicTabBarProperties) return this;

    return SelenicTabBarProperties(
      gap: lerpDouble(gap, other.gap, t)!,
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
        DiagnosticsProperty("type", "SelenicTabBarProperties"),
      )
      ..add(
        DoubleProperty("gap", gap),
      )
      ..add(
        DiagnosticsProperty<Duration>("transitionDuration", transitionDuration),
      )
      ..add(
        DiagnosticsProperty<Curve>("transitionCurve", transitionCurve),
      );
  }
}
