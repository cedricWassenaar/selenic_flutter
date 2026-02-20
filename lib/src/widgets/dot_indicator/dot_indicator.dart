import 'package:flutter/material.dart';
import 'package:selenic_design/src/theme/colors/colors.dart' show SelenicColors;

import 'package:selenic_design/src/theme/theme.dart';
import 'package:selenic_design/src/theme/tokens/sizes.dart';
import 'package:selenic_design/src/theme/tokens/transitions.dart';
import 'package:selenic_design/src/utils/color_tween_premul.dart';

class SelenicDotIndicator extends StatefulWidget {
  /// The color of the selected dot.
  final Color? selectedColor;

  /// The color of the unselected dots.
  final Color? unselectedColor;

  /// The gap between the dots.
  final double? gap;

  /// The size of each dot.
  final double? size;

  /// The duration of the dot indicator transition animation.
  final Duration? transitionDuration;

  /// The curve of the dot indicator transition animation.
  final Curve? transitionCurve;

  /// The index of the currently selected dot.
  final int selectedDot;

  /// The total number of dots to build for the indicator.
  final int dotCount;

  /// Creates a Selenic Design dot indicator.
  const SelenicDotIndicator({
    this.selectedColor,
    this.unselectedColor,
    this.gap,
    this.size,
    this.transitionDuration,
    this.transitionCurve,
    required this.selectedDot,
    required this.dotCount,
  });

  @override
  _CarouselIndicatorState createState() => _CarouselIndicatorState();
}

class _CarouselIndicatorState extends State<SelenicDotIndicator>
    with TickerProviderStateMixin {
  final ColorTweenWithPremultipliedAlpha _dotColorTween =
      ColorTweenWithPremultipliedAlpha();

  List<AnimationController>? _animationControllers;
  List<Animation<Color?>>? _animations;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((Duration _) {
      _animationControllers![widget.selectedDot].forward();
    });
  }

  @override
  void didUpdateWidget(SelenicDotIndicator oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (widget.selectedDot != oldWidget.selectedDot) {
      _animationControllers![oldWidget.selectedDot].reverse();
      _animationControllers![widget.selectedDot].forward();
    }
  }

  @override
  void dispose() {
    for (final controller in _animationControllers!) {
      controller.dispose();
    }

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double effectiveSize = widget.size ??
        context.selenicTheme?.dotIndicatorTheme.properties.size ??
        SelenicSizes.sizes.x4s;

    final double effectiveGap = widget.gap ??
        context.selenicTheme?.dotIndicatorTheme.properties.gap ??
        SelenicSizes.sizes.x4s;

    final Color effectiveSelectedColor = widget.selectedColor ??
        context.selenicTheme?.dotIndicatorTheme.colors.selectedColor ??
        SelenicColors.light.accentPrimary;

    final Color effectiveUnselectedColor = widget.unselectedColor ??
        context.selenicTheme?.dotIndicatorTheme.colors.unselectedColor ??
        SelenicColors.light.lineAccent;

    final Duration effectiveTransitionDuration = widget.transitionDuration ??
        context.selenicTheme?.dotIndicatorTheme.properties.transitionDuration ??
        SelenicTransitions.transitions.defaultTransitionDuration;

    final Curve effectiveTransitionCurve = widget.transitionCurve ??
        context.selenicTheme?.dotIndicatorTheme.properties.transitionCurve ??
        SelenicTransitions.transitions.defaultTransitionCurve;

    _animationControllers ??= List.generate(
      widget.dotCount,
      (index) => AnimationController(
        duration: effectiveTransitionDuration,
        vsync: this,
      ),
    );

    _animations ??= List.generate(
      widget.dotCount,
      (index) => _animationControllers![index].drive(
        _dotColorTween.chain(CurveTween(curve: effectiveTransitionCurve)),
      ),
    );

    _dotColorTween
      ..begin = effectiveUnselectedColor
      ..end = effectiveSelectedColor;

    return RepaintBoundary(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List<Widget>.generate(
          widget.dotCount,
          (int index) => AnimatedBuilder(
            animation: _animations![index],
            builder: (BuildContext context, Widget? _) {
              return Container(
                width: effectiveSize,
                height: effectiveSize,
                margin: EdgeInsets.symmetric(horizontal: effectiveGap / 2),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: _animations![index].value,
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
