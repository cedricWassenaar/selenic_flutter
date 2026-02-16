import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

@immutable
class SelenicModalProperties extends ThemeExtension<SelenicModalProperties>
    with DiagnosticableTreeMixin {
  /// The border radius of the SelenicModal.
  final BorderRadiusGeometry borderRadius;

  /// The duration of the SelenicModal transition animation (fade in or out).
  final Duration transitionDuration;

  /// The curve of the SelenicModal transition animation (fade in or out).
  final Curve transitionCurve;

  /// The text style of the SelenicModal.
  final TextStyle textStyle;

  const SelenicModalProperties({
    required this.borderRadius,
    required this.transitionDuration,
    required this.transitionCurve,
    required this.textStyle,
  });

  @override
  SelenicModalProperties copyWith({
    BorderRadiusGeometry? borderRadius,
    Duration? transitionDuration,
    Curve? transitionCurve,
    TextStyle? textStyle,
  }) {
    return SelenicModalProperties(
      borderRadius: borderRadius ?? this.borderRadius,
      transitionDuration: transitionDuration ?? this.transitionDuration,
      transitionCurve: transitionCurve ?? this.transitionCurve,
      textStyle: textStyle ?? this.textStyle,
    );
  }

  @override
  SelenicModalProperties lerp(
    ThemeExtension<SelenicModalProperties>? other,
    double t,
  ) {
    if (other is! SelenicModalProperties) return this;

    return SelenicModalProperties(
      borderRadius:
          BorderRadiusGeometry.lerp(borderRadius, other.borderRadius, t)!,
      transitionDuration:
          lerpDuration(transitionDuration, other.transitionDuration, t),
      transitionCurve: other.transitionCurve,
      textStyle: TextStyle.lerp(textStyle, other.textStyle, t)!,
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(
        DiagnosticsProperty("type", "SelenicModalProperties"),
      )
      ..add(
        DiagnosticsProperty<BorderRadiusGeometry>("borderRadius", borderRadius),
      )
      ..add(
        DiagnosticsProperty<Duration>("transitionDuration", transitionDuration),
      )
      ..add(
        DiagnosticsProperty<Curve>("transitionCurve", transitionCurve),
      )
      ..add(
        DiagnosticsProperty<TextStyle>("textStyle", textStyle),
      );
  }
}
