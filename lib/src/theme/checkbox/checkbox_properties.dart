import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

@immutable
class SelenicCheckboxProperties
    extends ThemeExtension<SelenicCheckboxProperties>
    with DiagnosticableTreeMixin {
  /// The border radius of the SelenicCheckbox.
  final BorderRadiusGeometry borderRadius;

  const SelenicCheckboxProperties({required this.borderRadius});

  @override
  SelenicCheckboxProperties copyWith({BorderRadiusGeometry? borderRadius}) {
    return SelenicCheckboxProperties(
      borderRadius: borderRadius ?? this.borderRadius,
    );
  }

  @override
  SelenicCheckboxProperties lerp(
    ThemeExtension<SelenicCheckboxProperties>? other,
    double t,
  ) {
    if (other is! SelenicCheckboxProperties) return this;

    return SelenicCheckboxProperties(
      borderRadius: BorderRadiusGeometry.lerp(
        borderRadius,
        other.borderRadius,
        t,
      )!,
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(
        DiagnosticsProperty("type", "SelenicCheckboxProperties"),
      )
      ..add(
        DiagnosticsProperty<BorderRadiusGeometry>("borderRadius", borderRadius),
      );
  }
}
