import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:moon_tokens/moon_tokens.dart';

import 'package:selenic_design/src/theme/effects/effects_theme.dart';
import 'package:selenic_design/src/theme/switch/switch_size_properties.dart';
import 'package:selenic_design/src/theme/switch/switch_sizes.dart';
import 'package:selenic_design/src/theme/theme.dart';
import 'package:selenic_design/src/theme/tokens/opacities.dart';
import 'package:selenic_design/src/theme/tokens/shadows.dart';
import 'package:selenic_design/src/theme/tokens/tokens.dart';
import 'package:selenic_design/src/theme/tokens/transitions.dart';
import 'package:selenic_design/src/utils/extensions.dart';
import 'package:selenic_design/src/utils/shape_decoration_premul.dart';
import 'package:selenic_design/src/utils/squircle/squircle_border.dart';
import 'package:selenic_design/src/utils/squircle/squircle_border_radius.dart';
import 'package:selenic_design/src/widgets/common/effects/focus_effect.dart';

enum SelenicSwitchSize {
  x2s,
  xs,
  sm,
}

class SelenicSwitch extends StatefulWidget {
  /// {@macro flutter.widgets.Focus.autofocus}
  final bool autofocus;

  /// Whether to use haptic feedback (vibration) when the switch is toggled.
  final bool hasHapticFeedback;

  /// Whether the switch is in active (on) state.
  final bool value;

  /// The background color of the active (on) switch track.
  final Color? activeTrackColor;

  /// The background color of the inactive (off) switch track.
  final Color? inactiveTrackColor;

  /// The color of the switch thumb.
  final Color? thumbColor;

  /// The height of the switch.
  final double? height;

  /// The width of the switch.
  final double? width;

  /// The size of the switch thumb.
  final double? thumbSizeValue;

  /// The duration of the switch toggle animation.
  final Duration? duration;

  /// The curve of the switch toggle animation.
  final Curve? curve;

  /// The padding of the switch.
  final EdgeInsetsGeometry? padding;

  /// {@macro flutter.widgets.Focus.focusNode}
  final FocusNode? focusNode;

  /// The size of the switch.
  final SelenicSwitchSize? switchSize;

  /// The semantic label for the switch.
  final String? semanticLabel;

  /// The callback that is called when the switch toggles between the
  /// active (on) and inactive (off) states.
  final ValueChanged<bool>? onChanged;

  /// The widget to display on the left side of the switch track when the switch
  /// is active (on).
  final Widget? activeTrackWidget;

  /// The widget to display on the right side of the switch track when the
  /// switch is inactive (off).
  final Widget? inactiveTrackWidget;

  /// The widget to display inside the thumb when the switch is active (on).
  final Widget? activeThumbWidget;

  /// The widget to display inside the thumb when the switch is inactive (off).
  final Widget? inactiveThumbWidget;

  /// Creates a Selenic Design switch.
  const SelenicSwitch({
    super.key,
    this.autofocus = false,
    this.hasHapticFeedback = true,
    required this.value,
    this.activeTrackColor,
    this.inactiveTrackColor,
    this.thumbColor,
    this.height,
    this.width,
    this.thumbSizeValue,
    this.duration,
    this.curve,
    this.padding,
    this.focusNode,
    this.switchSize,
    this.semanticLabel,
    this.onChanged,
    this.activeTrackWidget,
    this.inactiveTrackWidget,
    this.activeThumbWidget,
    this.inactiveThumbWidget,
  });

  @override
  _SelenicSwitchState createState() => _SelenicSwitchState();
}

class _SelenicSwitchState extends State<SelenicSwitch>
    with SingleTickerProviderStateMixin {
  late final Map<Type, Action<Intent>> _actions = {
    ActivateIntent: CallbackAction<Intent>(onInvoke: (_) => _handleTap()),
  };

  late Animation<Alignment>? _alignmentAnimation;
  late Animation<Decoration>? _trackDecorationAnimation;

  AnimationController? _animationController;
  Animation<double>? _thumbFadeAnimation;
  Animation<double>? _activeTrackWidgetFadeAnimation;
  Animation<double>? _inactiveTrackWidgetFadeAnimation;
  CurvedAnimation? _curvedAnimation;
  CurvedAnimation? _curvedAnimationWithOvershoot;

  bool _isFocused = false;

  // Whether to animate the switch to its new position (based on widget value)
  // using _curvedAnimationWithOvershoot after a drag ends.
  // Changes to true at the end of a drag.
  bool _needsPositionAnimation = false;

  bool get _isInteractive => widget.onChanged != null;

  SelenicSwitchSizeProperties _getSelenicSwitchSize(
    BuildContext context,
    SelenicSwitchSize? switchSize,
  ) {
    switch (switchSize) {
      case SelenicSwitchSize.x2s:
        return context.selenicTheme?.switchTheme.sizes.x2s ??
            SelenicSwitchSizes(tokens: SelenicTokens.light).x2s;
      case SelenicSwitchSize.xs:
        return context.selenicTheme?.switchTheme.sizes.xs ??
            SelenicSwitchSizes(tokens: SelenicTokens.light).xs;
      case SelenicSwitchSize.sm:
        return context.selenicTheme?.switchTheme.sizes.sm ??
            SelenicSwitchSizes(tokens: SelenicTokens.light).sm;
      default:
        return context.selenicTheme?.switchTheme.sizes.xs ??
            SelenicSwitchSizes(tokens: SelenicTokens.light).xs;
    }
  }

  // The `isLinear` flag is set to true when the `_curvedAnimationWithOvershoot`
  // animation attempts to move the thumb to the closest end after the most
  // recent drag animation. This ensures that the curve remains unchanged when
  // the controller's value is not 0 or 1.
  // It can be set to false when it's an implicit animation triggered by changes
  // in widget.value.
  void _resumePositionAnimation({bool isLinear = true}) {
    _needsPositionAnimation = false;

    _curvedAnimationWithOvershoot!
      ..curve = isLinear ? Curves.linear : Curves.ease
      ..reverseCurve = isLinear ? Curves.linear : Curves.ease.flipped;

    widget.value
        ? _animationController!.forward()
        : _animationController!.reverse();
  }

  void _handleFocus(bool focus) {
    if (focus != _isFocused) {
      setState(() => _isFocused = focus);
    }
  }

  void _handleFocusChange(bool hasFocus) {
    setState(() => _isFocused = hasFocus);
  }

  void _handleTapDown(TapDownDetails details) {
    if (_isInteractive) {
      _needsPositionAnimation = false;
    }
  }

  void _handleTap() {
    if (_isInteractive) {
      widget.onChanged!(!widget.value);
      _emitVibration();
    }
  }

  void _handleTapUp(TapUpDetails details) {
    if (_isInteractive) {
      _needsPositionAnimation = false;
    }
  }

  void _handleDragStart(DragStartDetails details) {
    if (_isInteractive) {
      _needsPositionAnimation = false;
      _emitVibration();
    }
  }

  void _handleDragUpdate({
    required DragUpdateDetails details,
    required double switchWidth,
    required double thumbSizeValue,
    required EdgeInsets padding,
  }) {
    if (_isInteractive) {
      _curvedAnimationWithOvershoot!
        ..curve = Curves.linear
        ..reverseCurve = Curves.linear;

      switch (Directionality.of(context)) {
        case TextDirection.rtl:
          _animationController!.value += -details.primaryDelta! /
              (switchWidth - (thumbSizeValue + padding.right + padding.left));
        case TextDirection.ltr:
          _animationController!.value += details.primaryDelta! /
              (switchWidth - (thumbSizeValue + padding.right + padding.left));
      }
    }
  }

  void _handleDragEnd(DragEndDetails details) {
    // Deferring the animation to the next build phase.
    setState(() => _needsPositionAnimation = true);
    // Trigger onChanged when the user's intent to change the value is evident.
    if (_curvedAnimationWithOvershoot!.value >= 0.5 != widget.value) {
      widget.onChanged!(!widget.value);
    }
  }

  void _emitVibration() {
    if (widget.hasHapticFeedback) HapticFeedback.lightImpact();
  }

  @override
  void didUpdateWidget(SelenicSwitch oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (_needsPositionAnimation || oldWidget.value != widget.value) {
      _resumePositionAnimation(isLinear: _needsPositionAnimation);
    }

    if (_curvedAnimationWithOvershoot!.value == 0.0 ||
        _curvedAnimationWithOvershoot!.value == 1.0) {
      _curvedAnimationWithOvershoot!
        ..curve = Curves.easeOutBack
        ..reverseCurve = Curves.easeOutBack.flipped;
    }
  }

  @override
  void dispose() {
    _animationController!.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_needsPositionAnimation) _resumePositionAnimation();

    final SelenicSwitchSizeProperties effectiveSelenicSwitchSize =
        _getSelenicSwitchSize(context, widget.switchSize);

    final Color effectiveActiveTrackColor = widget.activeTrackColor ??
        context.selenicTheme?.switchTheme.colors.activeTrackColor ??
        MoonColors.light.piccolo;

    final Color effectiveInactiveTrackColor = widget.inactiveTrackColor ??
        context.selenicTheme?.switchTheme.colors.inactiveTrackColor ??
        MoonColors.light.beerus;

    final Color effectiveThumbColor = widget.thumbColor ??
        context.selenicTheme?.switchTheme.colors.thumbColor ??
        MoonColors.light.goten;

    final double effectiveHeight =
        widget.height ?? effectiveSelenicSwitchSize.height;

    final double effectiveWidth =
        widget.width ?? effectiveSelenicSwitchSize.width;

    final double effectiveThumbSizeValue =
        widget.thumbSizeValue ?? effectiveSelenicSwitchSize.thumbSizeValue;

    final double effectiveDisabledOpacityValue =
        context.selenicOpacities?.disabled ??
            SelenicOpacities.opacities.disabled;

    final EdgeInsetsGeometry effectivePadding =
        widget.padding ?? effectiveSelenicSwitchSize.padding;

    final EdgeInsets resolvedDirectionalPadding =
        effectivePadding.resolve(Directionality.of(context));

    final BorderRadiusGeometry effectiveBorderRadius =
        BorderRadius.circular(effectiveThumbSizeValue / 2);

    final List<BoxShadow> effectiveThumbShadow =
        context.selenicTheme?.switchTheme.shadows.thumbShadows ??
            SelenicShadows.light.sm;

    final Duration effectiveDuration = widget.duration ??
        context.selenicTheme?.switchTheme.properties.transitionDuration ??
        SelenicTransitions.transitions.defaultTransitionDuration;

    final Curve effectiveTransitionCurve = widget.curve ??
        context.selenicTheme?.switchTheme.properties.transitionCurve ??
        SelenicTransitions.transitions.defaultTransitionCurve;

    final double effectiveFocusEffectExtent =
        context.selenicEffects?.controlFocusEffect.effectExtent ??
            SelenicEffectsTheme(tokens: SelenicTokens.light)
                .controlFocusEffect
                .effectExtent;

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

    _animationController ??= AnimationController(
      vsync: this,
      value: widget.value ? 1.0 : 0.0,
      duration: effectiveDuration,
    );

    _curvedAnimation ??= CurvedAnimation(
      parent: _animationController!,
      curve: effectiveTransitionCurve,
    );

    _curvedAnimationWithOvershoot ??= CurvedAnimation(
      parent: _animationController!,
      curve: effectiveTransitionCurve,
    );

    _alignmentAnimation = AlignmentTween(
      begin: Directionality.of(context) == TextDirection.ltr
          ? Alignment.centerLeft
          : Alignment.centerRight,
      end: Directionality.of(context) == TextDirection.ltr
          ? Alignment.centerRight
          : Alignment.centerLeft,
    ).animate(_curvedAnimationWithOvershoot!);

    _trackDecorationAnimation = DecorationTween(
      begin: ShapeDecorationWithPremultipliedAlpha(
        color: effectiveInactiveTrackColor,
        shape: SelenicSquircleBorder(
          borderRadius: SelenicSquircleBorderRadius(
            cornerRadius: effectiveHeight / 2,
          ),
        ),
      ),
      end: ShapeDecorationWithPremultipliedAlpha(
        color: effectiveActiveTrackColor,
        shape: SelenicSquircleBorder(
          borderRadius: SelenicSquircleBorderRadius(
            cornerRadius: effectiveHeight / 2,
          ),
        ),
      ),
    ).animate(_curvedAnimation!);

    _thumbFadeAnimation ??= TweenSequence<double>([
      TweenSequenceItem<double>(
        tween: Tween<double>(begin: 1.0, end: 0.0),
        weight: 50.0,
      ),
      TweenSequenceItem<double>(
        tween: Tween<double>(begin: 0.0, end: 1.0),
        weight: 50.0,
      ),
    ]).animate(_curvedAnimation!);

    _activeTrackWidgetFadeAnimation ??=
        Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _animationController!,
        curve: const Interval(0.7, 1.0),
      ),
    );

    _inactiveTrackWidgetFadeAnimation ??=
        Tween<double>(begin: 1.0, end: 0.0).animate(
      CurvedAnimation(
        parent: _animationController!,
        curve: const Interval(0.0, 0.3),
      ),
    );

    final Color effectiveActiveTextColor =
        context.selenicTheme?.switchTheme.colors.activeTextColor ??
            SelenicTokens.dark.colors.textPrimary;

    final Color effectiveInactiveTextColor =
        context.selenicTheme?.switchTheme.colors.inactiveTextColor ??
            MoonColors.light.textPrimary;

    final Color effectiveActiveIconColor =
        context.selenicTheme?.switchTheme.colors.activeIconColor ??
            SelenicTokens.dark.colors.iconPrimary;

    final Color effectiveInactiveIconColor =
        context.selenicTheme?.switchTheme.colors.inactiveIconColor ??
            MoonColors.light.iconPrimary;

    final Color effectiveThumbIconColor =
        context.selenicTheme?.switchTheme.colors.thumbIconColor ??
            MoonColors.light.iconPrimary;

    return Semantics(
      label: widget.semanticLabel,
      toggled: widget.value,
      child: FocusableActionDetector(
        enabled: _isInteractive,
        actions: _actions,
        autofocus: widget.autofocus,
        focusNode: widget.focusNode,
        onFocusChange: _handleFocusChange,
        onShowFocusHighlight: _handleFocus,
        mouseCursor: _isInteractive
            ? SystemMouseCursors.click
            : SystemMouseCursors.basic,
        child: GestureDetector(
          excludeFromSemantics: true,
          onTap: _handleTap,
          onTapDown: _handleTapDown,
          onTapUp: _handleTapUp,
          onHorizontalDragStart: _handleDragStart,
          onHorizontalDragUpdate: (DragUpdateDetails details) =>
              _handleDragUpdate(
            details: details,
            switchWidth: effectiveWidth,
            thumbSizeValue: effectiveThumbSizeValue,
            padding: resolvedDirectionalPadding,
          ),
          onHorizontalDragEnd: _handleDragEnd,
          child: RepaintBoundary(
            child: AnimatedBuilder(
              animation: _animationController!,
              builder: (BuildContext context, Widget? child) {
                return AnimatedOpacity(
                  opacity: _isInteractive ? 1 : effectiveDisabledOpacityValue,
                  duration: effectiveDuration,
                  curve: effectiveTransitionCurve,
                  child: SizedBox(
                    width: effectiveWidth,
                    height: effectiveHeight,
                    child: DecoratedBoxTransition(
                      decoration: _trackDecorationAnimation!,
                      child: Padding(
                        padding: resolvedDirectionalPadding,
                        child: Stack(
                          alignment: Alignment.center,
                          children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                IconTheme(
                                  data: IconThemeData(
                                    color: effectiveActiveIconColor,
                                    size: effectiveSelenicSwitchSize
                                        .iconSizeValue,
                                  ),
                                  child: DefaultTextStyle(
                                    style: effectiveSelenicSwitchSize.textStyle
                                        .copyWith(
                                      color: effectiveActiveTextColor,
                                    ),
                                    child: Expanded(
                                      child: FadeTransition(
                                        opacity:
                                            _activeTrackWidgetFadeAnimation!,
                                        child: widget.activeTrackWidget ??
                                            const SizedBox.shrink(),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: resolvedDirectionalPadding.left,
                                ),
                                IconTheme(
                                  data: IconThemeData(
                                    color: effectiveInactiveIconColor,
                                    size: effectiveSelenicSwitchSize
                                        .iconSizeValue,
                                  ),
                                  child: DefaultTextStyle(
                                    style: effectiveSelenicSwitchSize.textStyle
                                        .copyWith(
                                      color: effectiveInactiveTextColor,
                                    ),
                                    child: Expanded(
                                      child: FadeTransition(
                                        opacity:
                                            _inactiveTrackWidgetFadeAnimation!,
                                        child: widget.inactiveTrackWidget ??
                                            const SizedBox.shrink(),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Align(
                              alignment: _alignmentAnimation!.value,
                              child: IconTheme(
                                data: IconThemeData(
                                  color: effectiveThumbIconColor,
                                  size:
                                      effectiveSelenicSwitchSize.iconSizeValue,
                                ),
                                child: DefaultTextStyle(
                                  style: effectiveSelenicSwitchSize.textStyle
                                      .copyWith(
                                    color: effectiveInactiveTextColor,
                                  ),
                                  child: SelenicFocusEffect(
                                    show: _isFocused,
                                    effectColor: effectiveFocusEffectColor,
                                    childBorderRadius: effectiveBorderRadius,
                                    effectExtent: effectiveFocusEffectExtent,
                                    effectDuration:
                                        effectiveFocusEffectDuration,
                                    effectCurve: effectiveFocusEffectCurve,
                                    child: Container(
                                      width: effectiveThumbSizeValue,
                                      height: effectiveThumbSizeValue,
                                      alignment: Alignment.center,
                                      decoration:
                                          ShapeDecorationWithPremultipliedAlpha(
                                        color: effectiveThumbColor,
                                        shadows: effectiveThumbShadow,
                                        shape: SelenicSquircleBorder(
                                          borderRadius: effectiveBorderRadius
                                              .squircleBorderRadius(context),
                                        ),
                                      ),
                                      child: FadeTransition(
                                        opacity: _thumbFadeAnimation!,
                                        child: _curvedAnimation!.value > 0.5
                                            ? widget.activeThumbWidget
                                            : widget.inactiveThumbWidget,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
