import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:selenic_design/selenic_design.dart';
import 'package:selenic_design/src/theme/breadcrumb/breadcrumb_colors.dart';
import 'package:selenic_design/src/theme/breadcrumb/breadcrumb_properties.dart';

@immutable
class SelenicBreadcrumbTheme extends ThemeExtension<SelenicBreadcrumbTheme>
    with DiagnosticableTreeMixin {
  /// The tokens of the Selenic Design System.
  final SelenicTokens tokens;

  /// The colors of the SelenicBreadcrumb.
  final SelenicBreadcrumbColors colors;

  /// The properties of the SelenicBreadcrumb.
  final SelenicBreadcrumbProperties properties;

  SelenicBreadcrumbTheme({
    required this.tokens,
    SelenicBreadcrumbColors? colors,
    SelenicBreadcrumbProperties? properties,
  })  : colors = colors ??
            SelenicBreadcrumbColors(
              itemColor: tokens.colors.textSecondary,
              currentItemColor: tokens.colors.textPrimary,
              hoverEffectColor: tokens.colors.textPrimary,
            ),
        properties = properties ??
            SelenicBreadcrumbProperties(
              gap: tokens.sizes.x4s,
              itemGap: tokens.sizes.x6s,
              transitionDuration: tokens.transitions.defaultTransitionDuration,
              transitionCurve: tokens.transitions.defaultTransitionCurve,
              itemTextStyle: tokens.typography.body.textDefault,
              currentItemTextStyle: tokens.typography.body.textDefault,
              showMoreItemTextStyle: tokens.typography.body.textDefault,
            );

  @override
  SelenicBreadcrumbTheme copyWith({
    SelenicTokens? tokens,
    SelenicBreadcrumbColors? colors,
    SelenicBreadcrumbProperties? properties,
  }) {
    return SelenicBreadcrumbTheme(
      tokens: tokens ?? this.tokens,
      colors: colors ?? this.colors,
      properties: properties ?? this.properties,
    );
  }

  @override
  SelenicBreadcrumbTheme lerp(
    ThemeExtension<SelenicBreadcrumbTheme>? other,
    double t,
  ) {
    if (other is! SelenicBreadcrumbTheme) return this;

    return SelenicBreadcrumbTheme(
      tokens: tokens.lerp(other.tokens, t),
      colors: colors.lerp(other.colors, t),
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder diagnosticProperties) {
    super.debugFillProperties(diagnosticProperties);
    diagnosticProperties
      ..add(DiagnosticsProperty("type", "SelenicBreadcrumbTheme"))
      ..add(DiagnosticsProperty<SelenicTokens>("tokens", tokens))
      ..add(DiagnosticsProperty<SelenicBreadcrumbColors>("colors", colors));
  }
}
