import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

@immutable
class SelenicDrawerShadows extends ThemeExtension<SelenicDrawerShadows>
    with DiagnosticableTreeMixin {
  /// The list of shadows applied to the SelenicDrawer.
  final List<BoxShadow> drawerShadows;

  const SelenicDrawerShadows({required this.drawerShadows});

  @override
  SelenicDrawerShadows copyWith({List<BoxShadow>? drawerShadows}) {
    return SelenicDrawerShadows(
      drawerShadows: drawerShadows ?? this.drawerShadows,
    );
  }

  @override
  SelenicDrawerShadows lerp(
      ThemeExtension<SelenicDrawerShadows>? other, double t) {
    if (other is! SelenicDrawerShadows) return this;

    return SelenicDrawerShadows(
      drawerShadows: BoxShadow.lerpList(
        drawerShadows,
        other.drawerShadows,
        t,
      )!,
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(
        DiagnosticsProperty("type", "SelenicDrawerShadows"),
      )
      ..add(
        DiagnosticsProperty<List<BoxShadow>>("drawerShadows", drawerShadows),
      );
  }
}
