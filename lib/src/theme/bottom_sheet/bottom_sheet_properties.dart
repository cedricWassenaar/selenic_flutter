import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

@immutable
class SelenicBottomSheetProperties
    extends ThemeExtension<SelenicBottomSheetProperties>
    with DiagnosticableTreeMixin {
  /// The border radius of the SelenicBottomSheet.
  final BorderRadiusGeometry borderRadius;

  /// The duration of the SelenicBottomSheet transition animation (slide in or out).
  final Duration transitionDuration;

  /// The curve of the SelenicBottomSheet transition animation (slide in or out).
  final Curve transitionCurve;

  /// The text style of the SelenicBottomSheet.
  final TextStyle textStyle;

  const SelenicBottomSheetProperties({
    required this.borderRadius,
    required this.transitionDuration,
    required this.transitionCurve,
    required this.textStyle,
  });

  @override
  SelenicBottomSheetProperties copyWith({
    BorderRadiusGeometry? borderRadius,
    Duration? transitionDuration,
    Curve? transitionCurve,
    TextStyle? textStyle,
  }) {
    return SelenicBottomSheetProperties(
      borderRadius: borderRadius ?? this.borderRadius,
      transitionDuration: transitionDuration ?? this.transitionDuration,
      transitionCurve: transitionCurve ?? this.transitionCurve,
      textStyle: textStyle ?? this.textStyle,
    );
  }

  @override
  SelenicBottomSheetProperties lerp(
    ThemeExtension<SelenicBottomSheetProperties>? other,
    double t,
  ) {
    if (other is! SelenicBottomSheetProperties) return this;

    return SelenicBottomSheetProperties(
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
        DiagnosticsProperty("type", "SelenicBottomSheetProperties"),
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
