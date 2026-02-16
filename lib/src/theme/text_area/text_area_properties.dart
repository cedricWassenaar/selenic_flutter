import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

@immutable
class SelenicTextAreaProperties
    extends ThemeExtension<SelenicTextAreaProperties>
    with DiagnosticableTreeMixin {
  /// The border radius of the SelenicTextArea.
  final BorderRadiusGeometry borderRadius;

  /// The duration of the SelenicTextArea transition animation (enable and disable).
  final Duration transitionDuration;

  /// The curve of the SelenicTextArea transition animation (enable and disable).
  final Curve transitionCurve;

  /// The padding of the SelenicTextArea helper and errorBuilder widgets.
  final EdgeInsetsGeometry helperPadding;

  /// The padding of the SelenicTextArea text.
  final EdgeInsetsGeometry textPadding;

  /// The text style of the SelenicTextArea.
  final TextStyle textStyle;

  /// The text style of the SelenicTextArea helper and errorBuilder widgets.
  final TextStyle helperTextStyle;

  const SelenicTextAreaProperties({
    required this.borderRadius,
    required this.transitionDuration,
    required this.transitionCurve,
    required this.helperPadding,
    required this.textPadding,
    required this.textStyle,
    required this.helperTextStyle,
  });

  @override
  SelenicTextAreaProperties copyWith({
    BorderRadiusGeometry? borderRadius,
    Duration? transitionDuration,
    Curve? transitionCurve,
    EdgeInsetsGeometry? helperPadding,
    EdgeInsetsGeometry? textPadding,
    TextStyle? textStyle,
    TextStyle? helperTextStyle,
  }) {
    return SelenicTextAreaProperties(
      borderRadius: borderRadius ?? this.borderRadius,
      transitionDuration: transitionDuration ?? this.transitionDuration,
      transitionCurve: transitionCurve ?? this.transitionCurve,
      helperPadding: helperPadding ?? this.helperPadding,
      textPadding: textPadding ?? this.textPadding,
      textStyle: textStyle ?? this.textStyle,
      helperTextStyle: helperTextStyle ?? this.helperTextStyle,
    );
  }

  @override
  SelenicTextAreaProperties lerp(
    ThemeExtension<SelenicTextAreaProperties>? other,
    double t,
  ) {
    if (other is! SelenicTextAreaProperties) return this;

    return SelenicTextAreaProperties(
      borderRadius:
          BorderRadiusGeometry.lerp(borderRadius, other.borderRadius, t)!,
      transitionDuration:
          lerpDuration(transitionDuration, other.transitionDuration, t),
      transitionCurve: other.transitionCurve,
      helperPadding:
          EdgeInsetsGeometry.lerp(helperPadding, other.helperPadding, t)!,
      textPadding: EdgeInsetsGeometry.lerp(textPadding, other.textPadding, t)!,
      textStyle: TextStyle.lerp(textStyle, other.textStyle, t)!,
      helperTextStyle:
          TextStyle.lerp(helperTextStyle, other.helperTextStyle, t)!,
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(
        DiagnosticsProperty("type", "SelenicTextAreaProperties"),
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
        DiagnosticsProperty<EdgeInsetsGeometry>("helperPadding", helperPadding),
      )
      ..add(
        DiagnosticsProperty<EdgeInsetsGeometry>("textPadding", textPadding),
      )
      ..add(
        DiagnosticsProperty<TextStyle>("textStyle", textStyle),
      )
      ..add(
        DiagnosticsProperty<TextStyle>("helperTextStyle", helperTextStyle),
      );
  }
}
