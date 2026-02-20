import 'package:flutter/material.dart';
import 'package:selenic_design/src/theme/colors/colors.dart' show SelenicColors;

import 'package:selenic_design/src/theme/theme.dart';
import 'package:selenic_design/src/utils/extensions.dart';
import 'package:selenic_design/src/widgets/buttons/button.dart';

class SelenicTextButton extends StatelessWidget {
  /// {@macro flutter.widgets.Focus.autofocus}
  final bool autofocus;

  /// Whether the button is focusable.
  final bool isFocusable;

  /// Whether to ensure a minimum touch target size for the button.
  final bool ensureMinimalTouchTargetSize;

  /// Whether the button takes up the full width of its parent container.
  final bool isFullWidth;

  /// Whether to show a continuous pulsating effect.
  final bool showPulseEffect;

  /// The custom decoration of the button.
  final Decoration? decoration;

  /// The height of the button.
  final double? height;

  /// The width of the button.
  final double? width;

  /// The minimum size of the button touch target.
  final double minTouchTargetSize;

  /// {@macro flutter.widgets.Focus.focusNode}
  final FocusNode? focusNode;

  /// The size of the button.
  final SelenicButtonSize? buttonSize;

  /// The semantic label for the button.
  final String? semanticLabel;

  /// The callback that is called when the button is tapped or pressed.
  final VoidCallback? onTap;

  /// The callback that is called when the button is long-pressed.
  final VoidCallback? onLongPress;

  /// The widget to display before the [label] widget of the button.
  final Widget? leading;

  /// The primary content of the button widget.
  final Widget? label;

  /// The widget to display after the [label] widget of the button.
  final Widget? trailing;

  /// Creates a Selenic Design text button.
  ///
  /// See also:
  ///
  ///   * [SelenicFilledButton], Selenic Design filled button.
  ///   * [SelenicOutlinedButton], Selenic Design outlined button.
  ///   * [SelenicButton.icon], Selenic Design icon button.
  const SelenicTextButton({
    super.key,
    this.autofocus = false,
    this.isFocusable = true,
    this.ensureMinimalTouchTargetSize = false,
    this.isFullWidth = false,
    this.showPulseEffect = false,
    this.decoration,
    this.height,
    this.width,
    this.minTouchTargetSize = 40,
    this.focusNode,
    this.buttonSize,
    this.semanticLabel,
    this.onTap,
    this.onLongPress,
    this.label,
    this.leading,
    this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    final Color effectiveTextColor =
        context.selenicTheme?.buttonTheme.colors.textVariantTextColor ??
            SelenicColors.light.textSecondary;

    final Color effectiveHoverTextColor =
        context.selenicTheme?.buttonTheme.colors.textColor ??
            SelenicColors.light.textPrimary;

    final Color effectiveHoverColor =
        context.selenicTheme?.buttonTheme.colors.textVariantHoverColor ??
            SelenicColors.light.hoverPrimary;

    final Color effectiveFocusColor = context
            .selenicTheme?.buttonTheme.colors.textVariantFocusColor
            .withValues(alpha: context.isDarkMode ? 0.8 : 0.2) ??
        SelenicColors.light.accentPrimary
            .withValues(alpha: context.isDarkMode ? 0.8 : 0.2);

    return SelenicButton(
      autofocus: autofocus,
      isFocusable: isFocusable,
      ensureMinimalTouchTargetSize: ensureMinimalTouchTargetSize,
      isFullWidth: isFullWidth,
      showPulseEffect: showPulseEffect,
      textColor: effectiveTextColor,
      hoverTextColor: effectiveHoverTextColor,
      hoverEffectColor: effectiveHoverColor,
      focusEffectColor: effectiveFocusColor,
      height: height,
      width: width,
      minTouchTargetSize: minTouchTargetSize,
      focusNode: focusNode,
      buttonSize: buttonSize,
      decoration: decoration,
      semanticLabel: semanticLabel,
      onTap: onTap,
      onLongPress: onLongPress,
      label: label,
      leading: leading,
      trailing: trailing,
    );
  }
}
