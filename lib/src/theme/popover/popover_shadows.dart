import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

@immutable
class SelenicPopoverShadows extends ThemeExtension<SelenicPopoverShadows>
    with DiagnosticableTreeMixin {
  /// The list of shadows applied to the SelenicPopover.
  final List<BoxShadow> popoverShadows;

  const SelenicPopoverShadows({required this.popoverShadows});

  @override
  SelenicPopoverShadows copyWith({List<BoxShadow>? popoverShadows}) {
    return SelenicPopoverShadows(
      popoverShadows: popoverShadows ?? this.popoverShadows,
    );
  }

  @override
  SelenicPopoverShadows lerp(
      ThemeExtension<SelenicPopoverShadows>? other, double t) {
    if (other is! SelenicPopoverShadows) return this;

    return SelenicPopoverShadows(
      popoverShadows: BoxShadow.lerpList(
        popoverShadows,
        other.popoverShadows,
        t,
      )!,
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(
        DiagnosticsProperty("type", "SelenicPopoverShadows"),
      )
      ..add(
        DiagnosticsProperty<List<BoxShadow>>("popoverShadows", popoverShadows),
      );
  }
}
