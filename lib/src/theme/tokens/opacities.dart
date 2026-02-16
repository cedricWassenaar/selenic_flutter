import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

@immutable
class SelenicOpacities extends ThemeExtension<SelenicOpacities>
    with DiagnosticableTreeMixin {
  static const opacities = SelenicOpacities(disabled: 0.6);

  /// The disabled opacity value.
  final double disabled;

  const SelenicOpacities({required this.disabled});

  @override
  SelenicOpacities copyWith({double? disabled}) {
    return SelenicOpacities(
      disabled: disabled ?? this.disabled,
    );
  }

  @override
  SelenicOpacities lerp(ThemeExtension<SelenicOpacities>? other, double t) {
    if (other is! SelenicOpacities) return this;

    return SelenicOpacities(
      disabled: lerpDouble(disabled, other.disabled, t)!,
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty("type", "SelenicOpacities"))
      ..add(DoubleProperty("disabled", disabled));
  }
}
