import 'package:flutter/material.dart';
import 'package:selenic_design/src/theme/colors/colors.dart' show SelenicColors;

import 'package:selenic_design/src/theme/effects/effects_theme.dart';
import 'package:selenic_design/src/theme/theme.dart';
import 'package:selenic_design/src/theme/tokens/borders.dart';
import 'package:selenic_design/src/theme/tokens/opacities.dart';
import 'package:selenic_design/src/theme/tokens/tokens.dart';
import 'package:selenic_design/src/utils/extensions.dart';
import 'package:selenic_design/src/utils/squircle/squircle_border.dart';
import 'package:selenic_design/src/utils/touch_target_padding.dart';
import 'package:selenic_design/src/widgets/checkbox/checkbox_painter.dart';
import 'package:selenic_design/src/widgets/common/effects/focus_effect.dart';

class SelenicCheckbox extends StatefulWidget {
  /// {@macro flutter.widgets.Focus.autofocus}
  final bool autofocus;

  /// Whether the checkbox supports a tri-state (indeterminate).
  ///
  /// When tri-state is true, the checkbox can be in one of three states: true,
  /// false, or null.
  ///
  /// When tri-state is false (the default), the checkbox [value] can only be
  /// true or false.
  ///
  /// If tri-state is true, the checkbox displays a dash when its [value] is
  /// null, indicating the mixed state.
  ///
  /// When a tri-state checkbox is tapped, its [onChanged] callback is invoked,
  /// cycling through the three states:
  /// * If the current value is false, the [value] becomes true.
  /// * If the current value is true, the [value] becomes null (mixed state).
  /// * If the current value is null (mixed state), the [value] becomes false.
  ///
  /// If tri-state is false, the [value] must not be null.
  final bool tristate;

  /// Whether the checkbox is checked.
  ///
  /// When [tristate] is true, a value of null corresponds to the mixed state.
  /// When [tristate] is false, this value must not be null.
  final bool? value;

  /// The background color of the checked checkbox.
  final Color? activeColor;

  /// The background color of the unchecked checkbox.
  final Color? inactiveColor;

  /// The border color of the unchecked checkbox.
  final Color? borderColor;

  /// The color of the check icon when the checkbox is checked.
  final Color? checkColor;

  /// The size of the checkbox tap target.
  ///
  /// Defaults to 40.
  final double tapAreaSizeValue;

  /// {@macro flutter.widgets.Focus.focusNode}
  final FocusNode? focusNode;

  /// The semantic label for the checkbox.
  final String? semanticLabel;

  /// The callback that is called when the checkbox value changes.
  final ValueChanged<bool?>? onChanged;

  /// Creates a Selenic Design checkbox.
  const SelenicCheckbox({
    super.key,
    this.autofocus = false,
    this.tristate = false,
    required this.value,
    this.activeColor,
    this.borderColor,
    this.checkColor,
    this.inactiveColor,
    this.tapAreaSizeValue = 40,
    this.focusNode,
    this.semanticLabel,
    required this.onChanged,
  });

  @override
  State<SelenicCheckbox> createState() => _SelenicCheckboxState();
}

class _SelenicCheckboxState extends State<SelenicCheckbox>
    with TickerProviderStateMixin, ToggleableStateMixin {
  final SelenicCheckboxPainter _painter = SelenicCheckboxPainter();

  bool? _previousValue;

  @override
  ValueChanged<bool?>? get onChanged => widget.onChanged;

  @override
  bool get tristate => widget.tristate;

  @override
  bool? get value => widget.value;

  BorderSide? _resolveSide(BorderSide? side) {
    if (side is WidgetStateBorderSide) {
      return WidgetStateProperty.resolveAs<BorderSide?>(side, states);
    }

    if (!states.contains(WidgetState.selected)) return side;

    return null;
  }

  @override
  void initState() {
    super.initState();

    _previousValue = widget.value;
  }

  @override
  void didUpdateWidget(SelenicCheckbox oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.value != widget.value) {
      _previousValue = oldWidget.value;
      animateToValue();
    }
  }

  @override
  void dispose() {
    _painter.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const Size size = Size(16, 16);

    final BorderRadiusGeometry effectiveBorderRadius =
        context.selenicTheme?.checkboxTheme.properties.borderRadius ??
            SelenicBorders.borders.interactiveXs;

    final Color effectiveActiveColor = widget.activeColor ??
        context.selenicTheme?.checkboxTheme.colors.activeColor ??
        SelenicColors.light.accentPrimary;

    final Color effectiveInactiveColor = widget.inactiveColor ??
        context.selenicTheme?.checkboxTheme.colors.inactiveColor ??
        Colors.transparent;

    final Color effectiveCheckColor = widget.checkColor ??
        context.selenicTheme?.checkboxTheme.colors.checkColor ??
        SelenicColors.light.filledButton;

    final Color effectiveBorderColor = widget.borderColor ??
        context.selenicTheme?.checkboxTheme.colors.borderColor ??
        SelenicColors.light.bodyTextSecondary;

    final Color effectiveFocusEffectColor =
        context.selenicEffects?.controlFocusEffect.effectColor ??
            SelenicEffectsTheme(tokens: SelenicTokens.light)
                .controlFocusEffect
                .effectColor;

    final Duration effectiveFocusEffectDuration =
        context.selenicEffects?.controlFocusEffect.effectDuration ??
            SelenicEffectsTheme(tokens: SelenicTokens.light)
                .controlFocusEffect
                .effectDuration;

    final Curve effectiveFocusEffectCurve =
        context.selenicEffects?.controlFocusEffect.effectCurve ??
            SelenicEffectsTheme(tokens: SelenicTokens.light)
                .controlFocusEffect
                .effectCurve;

    final double effectiveFocusEffectExtent =
        context.selenicEffects?.controlFocusEffect.effectExtent ??
            SelenicEffectsTheme(tokens: SelenicTokens.light)
                .controlFocusEffect
                .effectExtent;

    final double effectiveDisabledOpacityValue =
        context.selenicOpacities?.disabled ??
            SelenicOpacities.opacities.disabled;

    final WidgetStateProperty<MouseCursor> effectiveMouseCursor =
        WidgetStateProperty.resolveWith<MouseCursor>((Set<WidgetState> states) {
      return WidgetStateMouseCursor.clickable.resolve(states);
    });

    return Semantics(
      label: widget.semanticLabel,
      checked: widget.value ?? false,
      mixed: widget.tristate ? widget.value == null : null,
      child: TouchTargetPadding(
        minSize: Size(widget.tapAreaSizeValue, widget.tapAreaSizeValue),
        child: RepaintBoundary(
          child: SelenicFocusEffect(
            show: states.contains(WidgetState.focused),
            childBorderRadius: effectiveBorderRadius,
            effectColor: effectiveFocusEffectColor,
            effectCurve: effectiveFocusEffectCurve,
            effectDuration: effectiveFocusEffectDuration,
            effectExtent: effectiveFocusEffectExtent,
            child: AnimatedOpacity(
              opacity: states.contains(WidgetState.disabled)
                  ? effectiveDisabledOpacityValue
                  : 1,
              duration: effectiveFocusEffectDuration,
              child: buildToggleable(
                mouseCursor: effectiveMouseCursor,
                focusNode: widget.focusNode,
                autofocus: widget.autofocus,
                size: size,
                painter: _painter
                  ..position = position
                  ..activeColor = effectiveActiveColor
                  ..inactiveColor = effectiveInactiveColor
                  ..checkColor = effectiveCheckColor
                  ..value = value
                  ..previousValue = _previousValue
                  ..shape = SelenicSquircleBorder(
                    borderRadius:
                        effectiveBorderRadius.squircleBorderRadius(context),
                  )
                  ..side = _resolveSide(
                    BorderSide(color: effectiveBorderColor),
                  ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
