import 'package:flutter/material.dart';
import 'package:selenic_design/src/theme/button/button_size_properties.dart';
import 'package:selenic_design/src/theme/button/button_sizes.dart';
import 'package:selenic_design/src/theme/colors/colors.dart' show SelenicColors;
import 'package:selenic_design/src/theme/effects/effects_theme.dart';
import 'package:selenic_design/src/theme/theme.dart';
import 'package:selenic_design/src/theme/tokens/borders.dart';
import 'package:selenic_design/src/theme/tokens/tokens.dart';
import 'package:selenic_design/src/utils/color_tween_premul.dart';
import 'package:selenic_design/src/utils/extensions.dart';
import 'package:selenic_design/src/utils/squircle/squircle_border.dart';
import 'package:selenic_design/src/widgets/common/base_control.dart';

enum SelenicButtonSize {
  xs,
  sm,
  md,
  lg,
  xl,
}

class SelenicButton extends StatefulWidget {
  /// {@macro flutter.widgets.Focus.autofocus}
  final bool autofocus;

  /// Whether the button is focusable.
  final bool isFocusable;

  /// Whether to ensure a minimum touch target size for the button.
  final bool ensureMinimalTouchTargetSize;

  /// Whether the button takes up the full width of its parent container.
  final bool isFullWidth;

  /// Whether to show a border around the button.
  final bool showBorder;

  /// Whether to show a focus outline effect when the button is focused.
  final bool showFocusEffect;

  /// Whether to show a continuous pulsating effect.
  final bool showPulseEffect;

  /// Whether to show a jiggle during the button pulse effect.
  final bool showPulseEffectJiggle;

  /// Whether to show a scale effect when the button is tapped or long-pressed.
  final bool showScaleEffect;

  /// The border radius of the button.
  final BorderRadiusGeometry? borderRadius;

  /// The background color of the button.
  final Color? backgroundColor;

  /// The border color of the button.
  final Color? borderColor;

  /// The color of the button focus effect.
  final Color? focusEffectColor;

  /// The color of the button hover effect.
  final Color? hoverEffectColor;

  /// The color of the button pulse effect.
  final Color? pulseEffectColor;

  /// The text color of the button.
  final Color? textColor;

  /// The text color of the button on hover.
  final Color? hoverTextColor;

  /// The custom decoration of the button.
  final Decoration? decoration;

  /// The border width of the button.
  final double? borderWidth;

  /// The opacity value of the button when disabled.
  final double? disabledOpacityValue;

  /// The gap between the [leading], [label] and [trailing] widgets of the
  /// button.
  final double? gap;

  /// The height of the button.
  final double? height;

  /// The width of the button.
  final double? width;

  /// The minimum size of the button touch target.
  final double minTouchTargetSize;

  /// The extent of the button focus effect.
  final double? focusEffectExtent;

  /// The extent of the button pulse effect.
  final double? pulseEffectExtent;

  /// The degree of scaling applied during the button scale effect.
  final double? scaleEffectScalar;

  /// The duration of the button focus effect.
  final Duration? focusEffectDuration;

  /// The duration of the button hover effect.
  final Duration? hoverEffectDuration;

  /// The duration of the button pulse effect.
  final Duration? pulseEffectDuration;

  /// The duration of the button scale effect.
  final Duration? scaleEffectDuration;

  /// The curve of the button focus effect.
  final Curve? focusEffectCurve;

  /// The curve of the button hover effect.
  final Curve? hoverEffectCurve;

  /// The curve of the button pulse effect.
  final Curve? pulseEffectCurve;

  /// The curve of the button scale effect.
  final Curve? scaleEffectCurve;

  /// The padding of the button.
  final EdgeInsetsGeometry? padding;

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

  /// Creates a Selenic Design base button.
  ///
  /// See also:
  ///
  ///   * [SelenicFilledButton], Selenic Design filled button.
  ///   * [SelenicOutlinedButton], Selenic Design outlined button.
  ///   * [SelenicTextButton], Selenic Design text button.
  ///   * [SelenicButton.icon], Selenic Design icon button.
  const SelenicButton({
    super.key,
    this.autofocus = false,
    this.isFocusable = true,
    this.ensureMinimalTouchTargetSize = false,
    this.isFullWidth = false,
    this.showBorder = false,
    this.showFocusEffect = true,
    this.showPulseEffect = false,
    this.showPulseEffectJiggle = true,
    this.showScaleEffect = true,
    this.borderRadius,
    this.backgroundColor,
    this.borderColor,
    this.focusEffectColor,
    this.hoverEffectColor,
    this.pulseEffectColor,
    this.textColor,
    this.hoverTextColor,
    this.decoration,
    this.borderWidth,
    this.disabledOpacityValue,
    this.gap,
    this.height,
    this.width,
    this.minTouchTargetSize = 40,
    this.focusEffectExtent,
    this.pulseEffectExtent,
    this.scaleEffectScalar,
    this.focusEffectDuration,
    this.hoverEffectDuration,
    this.pulseEffectDuration,
    this.scaleEffectDuration,
    this.focusEffectCurve,
    this.hoverEffectCurve,
    this.pulseEffectCurve,
    this.scaleEffectCurve,
    this.padding,
    this.focusNode,
    this.buttonSize,
    this.semanticLabel,
    this.onTap,
    this.onLongPress,
    this.leading,
    this.label,
    this.trailing,
  });

  /// Creates a Selenic Design icon button.
  ///
  /// See also:
  ///
  ///   * [SelenicFilledButton], Selenic Design filled button.
  ///   * [SelenicOutlinedButton], Selenic Design outlined button.
  ///   * [SelenicTextButton], Selenic Design text button.
  const SelenicButton.icon({
    super.key,
    this.autofocus = false,
    this.isFocusable = true,
    this.ensureMinimalTouchTargetSize = false,
    this.isFullWidth = false,
    this.showBorder = false,
    this.showFocusEffect = true,
    this.showPulseEffect = false,
    this.showPulseEffectJiggle = true,
    this.showScaleEffect = true,
    this.borderRadius,
    this.backgroundColor,
    this.borderColor,
    this.focusEffectColor,
    this.hoverEffectColor,
    this.pulseEffectColor,
    this.hoverTextColor,
    this.borderWidth,
    this.disabledOpacityValue,
    this.gap,
    this.height,
    this.width,
    this.minTouchTargetSize = 40,
    this.focusEffectExtent,
    this.pulseEffectExtent,
    this.scaleEffectScalar,
    this.focusEffectDuration,
    this.hoverEffectDuration,
    this.pulseEffectDuration,
    this.scaleEffectDuration,
    this.focusEffectCurve,
    this.hoverEffectCurve,
    this.pulseEffectCurve,
    this.scaleEffectCurve,
    this.padding,
    this.focusNode,
    this.buttonSize,
    this.decoration,
    this.semanticLabel,
    this.onTap,
    this.onLongPress,
    Color? iconColor,
    Widget? icon,
  })  : textColor = iconColor,
        leading = icon,
        label = null,
        trailing = null;

  @override
  State<SelenicButton> createState() => _SelenicButtonState();
}

class _SelenicButtonState extends State<SelenicButton>
    with SingleTickerProviderStateMixin {
  final ColorTweenWithPremultipliedAlpha _backgroundColorTween =
      ColorTweenWithPremultipliedAlpha();
  final ColorTweenWithPremultipliedAlpha _textColorTween =
      ColorTweenWithPremultipliedAlpha();

  Animation<Color?>? _backgroundColor;
  Animation<Color?>? _textColor;

  AnimationController? _animationController;

  bool get _isEnabled => widget.onTap != null || widget.onLongPress != null;

  void _handleHoverEffect(bool shouldAnimate) {
    shouldAnimate
        ? _animationController?.forward()
        : _animationController?.reverse();
  }

  SelenicButtonSizeProperties _getSelenicButtonSize(
    BuildContext context,
    SelenicButtonSize? buttonSize,
  ) {
    switch (buttonSize) {
      case SelenicButtonSize.xs:
        return context.selenicTheme?.buttonTheme.sizes.xs ??
            SelenicButtonSizes(tokens: SelenicTokens.light).xs;
      case SelenicButtonSize.sm:
        return context.selenicTheme?.buttonTheme.sizes.sm ??
            SelenicButtonSizes(tokens: SelenicTokens.light).sm;
      case SelenicButtonSize.md:
        return context.selenicTheme?.buttonTheme.sizes.md ??
            SelenicButtonSizes(tokens: SelenicTokens.light).md;
      case SelenicButtonSize.lg:
        return context.selenicTheme?.buttonTheme.sizes.lg ??
            SelenicButtonSizes(tokens: SelenicTokens.light).lg;
      case SelenicButtonSize.xl:
        return context.selenicTheme?.buttonTheme.sizes.xl ??
            SelenicButtonSizes(tokens: SelenicTokens.light).xl;
      default:
        return context.selenicTheme?.buttonTheme.sizes.md ??
            SelenicButtonSizes(tokens: SelenicTokens.light).md;
    }
  }

  @override
  void dispose() {
    _animationController?.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final SelenicButtonSizeProperties effectiveSelenicButtonSize =
        _getSelenicButtonSize(context, widget.buttonSize);

    final BorderRadiusGeometry effectiveBorderRadius =
        widget.borderRadius ?? effectiveSelenicButtonSize.borderRadius;

    final Color effectiveBorderColor = widget.borderColor ??
        context.selenicTheme?.buttonTheme.colors.borderColor ??
        SelenicColors.light.bodyTextSecondary;

    final double effectiveBorderWidth = widget.borderWidth ??
        context.selenicBorders?.defaultBorderWidth ??
        SelenicBorders.borders.defaultBorderWidth;

    final Color effectiveTextColor = widget.textColor ??
        context.selenicTheme?.buttonTheme.colors.textColor ??
        SelenicColors.light.textPrimary;

    final Color effectiveHoverEffectColor = widget.hoverEffectColor ??
        context.selenicEffects?.controlHoverEffect.primaryHoverColor ??
        SelenicEffectsTheme(tokens: SelenicTokens.light)
            .controlHoverEffect
            .primaryHoverColor;

    final Color hoverColor = Color.alphaBlend(
      effectiveHoverEffectColor,
      widget.backgroundColor ?? Colors.transparent,
    );

    final double effectiveHeight =
        widget.height ?? effectiveSelenicButtonSize.height;

    final double effectiveGap = widget.gap ?? effectiveSelenicButtonSize.gap;

    final EdgeInsetsGeometry effectivePadding =
        widget.padding ?? effectiveSelenicButtonSize.padding;

    final EdgeInsets resolvedDirectionalPadding =
        effectivePadding.resolve(Directionality.of(context));

    final EdgeInsetsGeometry correctedPadding = widget.padding == null
        ? EdgeInsetsDirectional.fromSTEB(
            widget.leading == null && widget.label != null
                ? resolvedDirectionalPadding.left
                : 0,
            resolvedDirectionalPadding.top,
            widget.trailing == null && widget.label != null
                ? resolvedDirectionalPadding.right
                : 0,
            resolvedDirectionalPadding.bottom,
          )
        : resolvedDirectionalPadding;

    final Duration effectiveHoverEffectDuration = widget.hoverEffectDuration ??
        context.selenicEffects?.controlHoverEffect.hoverDuration ??
        SelenicEffectsTheme(tokens: SelenicTokens.light)
            .controlHoverEffect
            .hoverDuration;

    final Curve effectiveHoverEffectCurve = widget.hoverEffectCurve ??
        context.selenicEffects?.controlHoverEffect.hoverCurve ??
        SelenicEffectsTheme(tokens: SelenicTokens.light)
            .controlHoverEffect
            .hoverCurve;

    _animationController ??= AnimationController(
      duration: effectiveHoverEffectDuration,
      vsync: this,
    );

    _backgroundColor ??= _animationController!.drive(
      _backgroundColorTween.chain(CurveTween(curve: effectiveHoverEffectCurve)),
    );

    _textColor ??= _animationController!.drive(
      _textColorTween.chain(CurveTween(curve: effectiveHoverEffectCurve)),
    );

    _backgroundColorTween
      ..begin = widget.backgroundColor
      ..end = hoverColor;

    _textColorTween
      ..begin = effectiveTextColor
      ..end = widget.hoverTextColor ?? effectiveTextColor;

    return SelenicBaseControl(
      autofocus: widget.autofocus,
      isFocusable: widget.isFocusable,
      ensureMinimalTouchTargetSize: widget.ensureMinimalTouchTargetSize,
      semanticTypeIsButton: true,
      showFocusEffect: widget.showFocusEffect,
      showPulseEffect: widget.showPulseEffect,
      showPulseEffectJiggle: widget.showPulseEffectJiggle,
      showScaleEffect: widget.showScaleEffect,
      borderRadius: effectiveBorderRadius,
      backgroundColor: widget.backgroundColor,
      focusEffectColor: widget.focusEffectColor,
      pulseEffectColor: widget.pulseEffectColor,
      disabledOpacityValue: widget.disabledOpacityValue,
      minTouchTargetSize: widget.minTouchTargetSize,
      focusEffectExtent: widget.focusEffectExtent,
      pulseEffectExtent: widget.pulseEffectExtent,
      scaleEffectScalar: widget.scaleEffectScalar,
      focusEffectDuration: widget.focusEffectDuration,
      pulseEffectDuration: widget.pulseEffectDuration,
      scaleEffectDuration: widget.scaleEffectDuration,
      focusEffectCurve: widget.focusEffectCurve,
      pulseEffectCurve: widget.pulseEffectCurve,
      scaleEffectCurve: widget.scaleEffectCurve,
      focusNode: widget.focusNode,
      semanticLabel: widget.semanticLabel,
      onTap: widget.onTap,
      onLongPress: widget.onLongPress,
      builder: (
        BuildContext context,
        bool isEnabled,
        bool isHovered,
        bool isFocused,
        bool isPressed,
      ) {
        final bool canAnimate =
            _isEnabled && (isHovered || isFocused || isPressed);

        _handleHoverEffect(canAnimate);

        return AnimatedBuilder(
          animation: _animationController!,
          builder: (BuildContext context, Widget? child) {
            return IconTheme(
              data: IconThemeData(
                color: _textColor!.value,
                size: effectiveSelenicButtonSize.iconSizeValue,
              ),
              child: DefaultTextStyle(
                style: effectiveSelenicButtonSize.textStyle
                    .copyWith(color: _textColor!.value),
                child: Container(
                  width: widget.width,
                  height: effectiveHeight,
                  constraints: BoxConstraints(minWidth: effectiveHeight),
                  decoration: widget.decoration ??
                      ShapeDecoration(
                        color: _backgroundColor!.value,
                        shape: SelenicSquircleBorder(
                          borderRadius: effectiveBorderRadius
                              .squircleBorderRadius(context),
                          side: BorderSide(
                            color: effectiveBorderColor,
                            width: widget.showBorder ? effectiveBorderWidth : 0,
                            style: widget.showBorder
                                ? BorderStyle.solid
                                : BorderStyle.none,
                          ),
                        ),
                      ),
                  child: child,
                ),
              ),
            );
          },
          child: Padding(
            padding: widget.isFullWidth ? EdgeInsets.zero : correctedPadding,
            child: widget.isFullWidth
                ? Stack(
                    fit: StackFit.expand,
                    children: [
                      if (widget.leading != null)
                        Container(
                          margin:
                              EdgeInsets.symmetric(horizontal: effectiveGap),
                          alignment:
                              Directionality.of(context) == TextDirection.ltr
                                  ? Alignment.centerLeft
                                  : Alignment.centerRight,
                          child: widget.leading,
                        ),
                      if (widget.label != null)
                        Align(
                          child: widget.label,
                        ),
                      if (widget.trailing != null)
                        Container(
                          margin:
                              EdgeInsets.symmetric(horizontal: effectiveGap),
                          alignment:
                              Directionality.of(context) == TextDirection.ltr
                                  ? Alignment.centerRight
                                  : Alignment.centerLeft,
                          child: widget.trailing,
                        ),
                    ],
                  )
                : Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      if (widget.leading != null)
                        Padding(
                          padding:
                              EdgeInsets.symmetric(horizontal: effectiveGap),
                          child: widget.leading,
                        ),
                      if (widget.label != null) widget.label!,
                      if (widget.trailing != null)
                        Padding(
                          padding:
                              EdgeInsets.symmetric(horizontal: effectiveGap),
                          child: widget.trailing,
                        ),
                    ],
                  ),
          ),
        );
      },
    );
  }
}
