import 'package:flutter/material.dart';

import 'package:moon_tokens/moon_tokens.dart';

import 'package:selenic_design/src/theme/progress/linear_progress/linear_progress_size_properties.dart';
import 'package:selenic_design/src/theme/progress/linear_progress/linear_progress_sizes.dart';
import 'package:selenic_design/src/theme/theme.dart';
import 'package:selenic_design/src/theme/tokens/sizes.dart';
import 'package:selenic_design/src/theme/tokens/tokens.dart';
import 'package:selenic_design/src/widgets/common/progress_indicators/linear_progress_indicator.dart';
import 'package:selenic_design/src/widgets/progress_pin/pin_style.dart';
import 'package:selenic_design/src/widgets/progress_pin/progress_pin.dart';

enum SelenicLinearProgressSize {
  x6s,
  x5s,
  x4s,
  x3s,
  x2s,
}

class SelenicLinearProgress extends StatelessWidget {
  /// Whether to show the thumb and the pin for the linear progress.
  final bool showPin;

  /// Whether to show the [minLabel] widget for the linear progress.
  final bool showMinLabel;

  /// Whether to show the [maxLabel] widget for the linear progress.
  final bool showMaxLabel;

  /// Whether the pin height is added to the linear progress height.
  /// Applies only when both this and [showPin] are true.
  /// Otherwise, the pin acts as an overlay without affecting the linear
  /// progress height.
  final bool pinAffectsHeight;

  /// The border radius of the linear progress.
  final BorderRadiusGeometry? borderRadius;

  /// The color of the linear progress.
  final Color? color;

  /// The background color of the linear progress.
  final Color? backgroundColor;

  /// The text color of the [minLabel] and [maxLabel] widgets.
  final Color? textColor;

  /// The height of the linear progress.
  final double? height;

  /// The vertical gap between the linear progress and the [minLabel] and
  /// [maxLabel] widgets.
  ///
  /// Has effect only if [showMinLabel] and [showMaxLabel] are true.
  final double? verticalGap;

  /// The progress value of the linear progress.
  final double value;

  /// The size of the linear progress.
  final SelenicLinearProgressSize? linearProgressSize;

  /// The styling options for the linear progress pin.
  final PinStyle? pinStyle;

  /// The semantic label for the linear progress.
  final String? semanticLabel;

  /// The widget to display the minimum progress value of the linear progress.
  final Widget? minLabel;

  /// The widget to display the maximum progress value of the linear progress.
  final Widget? maxLabel;

  /// Creates a Selenic Design linear progress.
  const SelenicLinearProgress({
    super.key,
    this.showPin = false,
    this.showMinLabel = false,
    this.showMaxLabel = false,
    this.pinAffectsHeight = true,
    this.borderRadius,
    this.color,
    this.backgroundColor,
    this.textColor,
    this.height,
    this.verticalGap,
    required this.value,
    this.linearProgressSize,
    this.pinStyle,
    this.semanticLabel,
    this.minLabel,
    this.maxLabel,
  });

  SelenicLinearProgressSizeProperties _getSelenicProgressSize(
    BuildContext context,
    SelenicLinearProgressSize? progressSize,
  ) {
    switch (progressSize) {
      case SelenicLinearProgressSize.x6s:
        return context.selenicTheme?.linearProgressTheme.sizes.x6s ??
            SelenicLinearProgressSizes(tokens: SelenicTokens.light).x6s;
      case SelenicLinearProgressSize.x5s:
        return context.selenicTheme?.linearProgressTheme.sizes.x5s ??
            SelenicLinearProgressSizes(tokens: SelenicTokens.light).x5s;
      case SelenicLinearProgressSize.x4s:
        return context.selenicTheme?.linearProgressTheme.sizes.x4s ??
            SelenicLinearProgressSizes(tokens: SelenicTokens.light).x4s;
      case SelenicLinearProgressSize.x3s:
        return context.selenicTheme?.linearProgressTheme.sizes.x3s ??
            SelenicLinearProgressSizes(tokens: SelenicTokens.light).x3s;
      case SelenicLinearProgressSize.x2s:
        return context.selenicTheme?.linearProgressTheme.sizes.x2s ??
            SelenicLinearProgressSizes(tokens: SelenicTokens.light).x2s;
      default:
        return context.selenicTheme?.linearProgressTheme.sizes.x4s ??
            SelenicLinearProgressSizes(tokens: SelenicTokens.light).x4s;
    }
  }

  @override
  Widget build(BuildContext context) {
    final SelenicLinearProgressSizeProperties effectiveProgressSize =
        _getSelenicProgressSize(context, linearProgressSize);

    final BorderRadiusGeometry effectiveBorderRadius =
        borderRadius ?? effectiveProgressSize.borderRadius;

    // This is used to ensure that the corners of the progress bar properly
    // touch the thumb with bigger bar variants.
    final BorderRadiusGeometry progressRadius = switch (effectiveBorderRadius) {
      BorderRadiusDirectional() when showPin == true =>
        BorderRadiusDirectional.only(
          topStart: effectiveBorderRadius.topStart,
          bottomStart: effectiveBorderRadius.bottomStart,
        ),
      BorderRadius() when showPin == true => BorderRadiusDirectional.only(
          topStart: effectiveBorderRadius.topLeft,
          bottomStart: effectiveBorderRadius.bottomLeft,
        ),
      _ => effectiveBorderRadius,
    };

    final Color effectiveColor = color ??
        context.selenicTheme?.linearProgressTheme.colors.color ??
        MoonColors.light.piccolo;

    final Color effectiveBackgroundColor = backgroundColor ??
        context.selenicTheme?.linearProgressTheme.colors.backgroundColor ??
        MoonColors.light.beerus;

    final Color effectiveTextColor = textColor ??
        context.selenicTheme?.linearProgressTheme.colors.textColor ??
        MoonColors.light.textPrimary;

    final double effectiveHeight =
        height ?? effectiveProgressSize.progressHeight;

    final double effectiveVerticalGap =
        verticalGap ?? effectiveProgressSize.verticalGap;

    final double effectiveThumbSizeValue =
        pinStyle?.thumbSizeValue ?? effectiveProgressSize.thumbSizeValue;

    final double effectivePinWidth = pinStyle?.pinWidth ??
        context.selenicTheme?.progressPinTheme.properties.pinWidth ??
        36;

    final double effectivePinDistance = pinStyle?.pinDistance ??
        context.selenicTheme?.progressPinTheme.properties.pinDistance ??
        SelenicSizes.sizes.x5s;

    final double effectivePinArrowHeight = pinStyle?.arrowHeight ??
        context.selenicTheme?.progressPinTheme.properties.arrowHeight ??
        6;

    final TextStyle effectiveTextStyle = effectiveProgressSize.textStyle;

    final double resolvedPaddingValue =
        effectiveThumbSizeValue - effectiveHeight > 0
            ? effectiveThumbSizeValue / 2 - effectiveHeight / 2
            : 0;

    final double heightWithPin = effectivePinWidth +
        effectivePinArrowHeight +
        effectivePinDistance +
        effectiveThumbSizeValue;

    Widget child = SelenicLinearProgressIndicator(
      value: value,
      color: effectiveColor,
      backgroundColor: effectiveBackgroundColor,
      containerRadius: effectiveBorderRadius,
      progressRadius: showPin ? progressRadius : effectiveBorderRadius,
      minHeight: effectiveHeight,
    );

    if (showPin) {
      child = SelenicProgressPin(
        progressValue: value,
        pinText: '${(value * 100).round()}%',
        pinStyle: pinStyle?.copyWith(thumbSizeValue: effectiveThumbSizeValue),
        child: child,
      );
    }

    if (showMinLabel || showMaxLabel) {
      child = Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              if (showMinLabel)
                Expanded(
                  child: DefaultTextStyle(
                    style:
                        effectiveTextStyle.copyWith(color: effectiveTextColor),
                    child: Align(
                      alignment: AlignmentDirectional.centerStart,
                      child: minLabel ?? const Text("0%"),
                    ),
                  ),
                ),
              if (showMaxLabel)
                Expanded(
                  child: DefaultTextStyle(
                    style:
                        effectiveTextStyle.copyWith(color: effectiveTextColor),
                    child: Align(
                      alignment: AlignmentDirectional.centerEnd,
                      child: maxLabel ?? const Text("100%"),
                    ),
                  ),
                ),
            ],
          ),
          SizedBox(height: effectiveVerticalGap),
          child,
        ],
      );
    }

    if (showPin && pinAffectsHeight) {
      child = Container(
        height: heightWithPin,
        padding: EdgeInsets.only(bottom: resolvedPaddingValue),
        alignment: Alignment.bottomCenter,
        child: child,
      );
    }

    return Semantics(
      label: semanticLabel,
      value: "${value * 100}%",
      child: child,
    );
  }
}
