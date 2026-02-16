import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

@immutable
class SelenicToastShadows extends ThemeExtension<SelenicToastShadows>
    with DiagnosticableTreeMixin {
  /// The list of shadows applied to the SelenicToast.
  final List<BoxShadow> toastShadows;

  const SelenicToastShadows({required this.toastShadows});

  @override
  SelenicToastShadows copyWith({List<BoxShadow>? toastShadows}) {
    return SelenicToastShadows(
      toastShadows: toastShadows ?? this.toastShadows,
    );
  }

  @override
  SelenicToastShadows lerp(
      ThemeExtension<SelenicToastShadows>? other, double t) {
    if (other is! SelenicToastShadows) return this;

    return SelenicToastShadows(
      toastShadows: BoxShadow.lerpList(toastShadows, other.toastShadows, t)!,
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty("type", "SelenicToastShadows"))
      ..add(DiagnosticsProperty<List<BoxShadow>>("toastShadows", toastShadows));
  }
}
