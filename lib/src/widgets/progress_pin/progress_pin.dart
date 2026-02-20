import 'package:flutter/material.dart';
import 'package:selenic_design/src/theme/colors/colors.dart' show SelenicColors;

import 'package:selenic_design/src/theme/theme.dart';
import 'package:selenic_design/src/theme/tokens/sizes.dart';
import 'package:selenic_design/src/theme/tokens/typography/typography.dart';
import 'package:selenic_design/src/widgets/progress_pin/pin_style.dart';
import 'package:selenic_design/src/widgets/progress_pin/progress_pin_painter.dart';

class SelenicProgressPin extends StatelessWidget {
  final double progressValue;
  final PinStyle? pinStyle;
  final String pinText;
  final Widget child;

  /// Creates a Selenic Design progress pin.
  const SelenicProgressPin({
    super.key,
    required this.progressValue,
    this.pinStyle,
    required this.pinText,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    final Color effectivePinColor = pinStyle?.pinColor ??
        context.selenicTheme?.progressPinTheme.colors.pinColor ??
        SelenicColors.light.outlinedButton;

    final Color effectivePinBorderColor = pinStyle?.pinBorderColor ??
        context.selenicTheme?.progressPinTheme.colors.pinBorderColor ??
        SelenicColors.light.filledButton;

    final Color effectiveThumbColor = pinStyle?.thumbColor ??
        context.selenicTheme?.progressPinTheme.colors.thumbColor ??
        SelenicColors.light.filledButton;

    final Color effectiveShadowColor = pinStyle?.shadowColor ??
        context.selenicTheme?.progressPinTheme.colors.shadowColor ??
        SelenicColors.light.outlinedButton;

    final Color effectiveTextColor = pinStyle?.textStyle?.color ??
        context.selenicTheme?.progressPinTheme.colors.textColor ??
        SelenicColors.light.filledButton;

    final TextStyle effectiveTextStyle = pinStyle?.textStyle ??
        context.selenicTheme?.progressPinTheme.properties.textStyle ??
        SelenicTypography.typography.body.text10;

    final double effectivePinWidth = pinStyle?.pinWidth ??
        context.selenicTheme?.progressPinTheme.properties.pinWidth ??
        36;

    final double effectivePinBorderWidth = pinStyle?.pinBorderWidth ??
        context.selenicTheme?.progressPinTheme.properties.pinBorderWidth ??
        SelenicSizes.sizes.x6s;

    final double effectivePinDistance = pinStyle?.pinDistance ??
        context.selenicTheme?.progressPinTheme.properties.pinDistance ??
        SelenicSizes.sizes.x5s;

    final double effectiveArrowHeight = pinStyle?.arrowHeight ??
        context.selenicTheme?.progressPinTheme.properties.arrowHeight ??
        6;

    final double effectiveArrowWidth = pinStyle?.arrowWidth ??
        context.selenicTheme?.progressPinTheme.properties.arrowWidth ??
        SelenicSizes.sizes.x4s;

    final double effectiveShadowElevation = pinStyle?.shadowElevation ??
        context.selenicTheme?.progressPinTheme.properties.shadowElevation ??
        6;

    final TextDirection effectiveTextDirection = Directionality.of(context);

    return CustomPaint(
      foregroundPainter: ProgressPinPainter(
        showShadow: pinStyle?.showShadow ?? true,
        pinColor: effectivePinColor,
        thumbColor: effectiveThumbColor,
        shadowColor: effectiveShadowColor,
        pinBorderColor: effectivePinBorderColor,
        pinBorderWidth: effectivePinBorderWidth,
        arrowHeight: effectiveArrowHeight,
        arrowWidth: effectiveArrowWidth,
        pinDistance: effectivePinDistance,
        pinWidth: effectivePinWidth,
        thumbSizeValue: pinStyle?.thumbSizeValue,
        progressValue: progressValue,
        shadowElevation: effectiveShadowElevation,
        pinText: pinText,
        textDirection: effectiveTextDirection,
        textStyle: effectiveTextStyle.copyWith(color: effectiveTextColor),
      ),
      child: child,
    );
  }
}
