import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:selenic_design/src/theme/effects/control_effect.dart';
import 'package:selenic_design/src/theme/effects/focus_effect.dart';
import 'package:selenic_design/src/theme/effects/hover_effect.dart';
import 'package:selenic_design/src/theme/tokens/tokens.dart';

@immutable
class SelenicEffectsTheme extends ThemeExtension<SelenicEffectsTheme>
    with DiagnosticableTreeMixin {
  /// The tokens of the Selenic Design System.
  final SelenicTokens tokens;

  /// The focus effect properties of the control widgets.
  final SelenicFocusEffect controlFocusEffect;

  /// The hover effect properties of the control widgets.
  final SelenicHoverEffect controlHoverEffect;

  /// The pulse effect properties of the control widgets.
  final SelenicControlEffect controlPulseEffect;

  /// The scale effect properties of the control widgets.
  final SelenicControlEffect controlScaleEffect;

  SelenicEffectsTheme({
    required this.tokens,
    SelenicFocusEffect? controlFocusEffect,
    SelenicHoverEffect? controlHoverEffect,
    SelenicControlEffect? controlPulseEffect,
    SelenicControlEffect? controlScaleEffect,
  })  : controlFocusEffect = controlFocusEffect ??
            SelenicFocusEffect(
              effectColor: tokens.colors.bulma.withValues(alpha: 0.25),
              effectExtent: 4,
              effectDuration: tokens.transitions.defaultTransitionDuration,
              effectCurve: tokens.transitions.defaultTransitionCurve,
            ),
        controlHoverEffect = controlHoverEffect ??
            SelenicHoverEffect(
              primaryHoverColor: tokens.colors.heles,
              secondaryHoverColor: tokens.colors.jiren,
              hoverDuration: tokens.transitions.defaultTransitionDuration,
              hoverCurve: tokens.transitions.defaultTransitionCurve,
            ),
        controlPulseEffect = controlPulseEffect ??
            SelenicControlEffect(
              effectColor: tokens.colors.piccolo,
              effectDuration: const Duration(milliseconds: 1400),
              effectCurve: tokens.transitions.defaultTransitionCurve,
              effectExtent: 24,
            ),
        controlScaleEffect = controlScaleEffect ??
            SelenicControlEffect(
              effectDuration: tokens.transitions.defaultTransitionDuration,
              effectCurve: tokens.transitions.defaultTransitionCurve,
              effectScalar: 0.95,
            );

  @override
  SelenicEffectsTheme copyWith({
    SelenicTokens? tokens,
    SelenicFocusEffect? controlFocusEffect,
    SelenicHoverEffect? controlHoverEffect,
    SelenicControlEffect? controlPulseEffect,
    SelenicControlEffect? controlScaleEffect,
  }) {
    return SelenicEffectsTheme(
      tokens: tokens ?? this.tokens,
      controlFocusEffect: controlFocusEffect ?? this.controlFocusEffect,
      controlHoverEffect: controlHoverEffect ?? this.controlHoverEffect,
      controlPulseEffect: controlPulseEffect ?? this.controlPulseEffect,
      controlScaleEffect: controlScaleEffect ?? this.controlScaleEffect,
    );
  }

  @override
  SelenicEffectsTheme lerp(
      ThemeExtension<SelenicEffectsTheme>? other, double t) {
    if (other is! SelenicEffectsTheme) return this;

    return SelenicEffectsTheme(
      tokens: tokens.lerp(other.tokens, t),
      controlFocusEffect: controlFocusEffect.lerp(other.controlFocusEffect, t),
      controlHoverEffect: controlHoverEffect.lerp(other.controlHoverEffect, t),
      controlScaleEffect: controlScaleEffect.lerp(other.controlScaleEffect, t),
      controlPulseEffect: controlPulseEffect.lerp(other.controlPulseEffect, t),
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty("type", "SelenicEffectsTheme"))
      ..add(DiagnosticsProperty<SelenicTokens>("tokens", tokens))
      ..add(
        DiagnosticsProperty<SelenicControlEffect>(
          "controlScaleEffect",
          controlScaleEffect,
        ),
      )
      ..add(
        DiagnosticsProperty<SelenicControlEffect>(
          "controlPulseEffect",
          controlPulseEffect,
        ),
      )
      ..add(
        DiagnosticsProperty<SelenicFocusEffect>(
          "controlFocusEffect",
          controlFocusEffect,
        ),
      )
      ..add(
        DiagnosticsProperty<SelenicHoverEffect>(
          "controlHoverEffect",
          controlHoverEffect,
        ),
      );
  }
}
