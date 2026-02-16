import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

@immutable
class SelenicSwitchShadows extends ThemeExtension<SelenicSwitchShadows>
    with DiagnosticableTreeMixin {
  /// The list of shadows applied to the SelenicSwitch thumb.
  final List<BoxShadow> thumbShadows;

  const SelenicSwitchShadows({required this.thumbShadows});

  @override
  SelenicSwitchShadows copyWith({List<BoxShadow>? thumbShadows}) {
    return SelenicSwitchShadows(
      thumbShadows: thumbShadows ?? this.thumbShadows,
    );
  }

  @override
  SelenicSwitchShadows lerp(
      ThemeExtension<SelenicSwitchShadows>? other, double t) {
    if (other is! SelenicSwitchShadows) return this;

    return SelenicSwitchShadows(
      thumbShadows: BoxShadow.lerpList(thumbShadows, other.thumbShadows, t)!,
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty("type", "SelenicSwitchShadows"))
      ..add(DiagnosticsProperty<List<BoxShadow>>("thumbShadows", thumbShadows));
  }
}
