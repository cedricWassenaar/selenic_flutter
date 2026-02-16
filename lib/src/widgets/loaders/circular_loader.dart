import 'package:flutter/material.dart';

import 'package:moon_tokens/moon_tokens.dart';

import 'package:selenic_design/src/theme/loaders/circular_loader/circular_loader_size_properties.dart';
import 'package:selenic_design/src/theme/loaders/circular_loader/circular_loader_sizes.dart';
import 'package:selenic_design/src/theme/theme.dart';
import 'package:selenic_design/src/theme/tokens/tokens.dart';
import 'package:selenic_design/src/widgets/common/progress_indicators/circular_progress_indicator.dart';

enum SelenicCircularLoaderSize {
  x2s,
  xs,
  sm,
  md,
  lg,
}

class SelenicCircularLoader extends StatelessWidget {
  /// The color of the circular loader.
  final Color? color;

  /// The background color of the circular loader.
  final Color? backgroundColor;

  /// The custom size value of the circular loader. For predefined sizes, use
  /// [circularLoaderSize].
  final double? sizeValue;

  /// The width of the stroke for the circular loader.
  final double? strokeWidth;

  /// The size of the circular loader.
  final SelenicCircularLoaderSize? circularLoaderSize;

  /// The shape of the end of the stroke (stroke-cap) for the circular loader.
  final StrokeCap? strokeCap;

  /// Creates a Selenic Design circular loader.
  const SelenicCircularLoader({
    super.key,
    this.color,
    this.backgroundColor,
    this.sizeValue,
    this.strokeWidth,
    this.circularLoaderSize,
    this.strokeCap,
  });

  SelenicCircularLoaderSizeProperties _getSelenicLoaderSize(
    BuildContext context,
    SelenicCircularLoaderSize? loadSize,
  ) {
    switch (loadSize) {
      case SelenicCircularLoaderSize.x2s:
        return context.selenicTheme?.circularLoaderTheme.sizes.x2s ??
            SelenicCircularLoaderSizes(tokens: SelenicTokens.light).x2s;
      case SelenicCircularLoaderSize.xs:
        return context.selenicTheme?.circularLoaderTheme.sizes.xs ??
            SelenicCircularLoaderSizes(tokens: SelenicTokens.light).xs;
      case SelenicCircularLoaderSize.sm:
        return context.selenicTheme?.circularLoaderTheme.sizes.sm ??
            SelenicCircularLoaderSizes(tokens: SelenicTokens.light).sm;
      case SelenicCircularLoaderSize.md:
        return context.selenicTheme?.circularLoaderTheme.sizes.md ??
            SelenicCircularLoaderSizes(tokens: SelenicTokens.light).md;
      case SelenicCircularLoaderSize.lg:
        return context.selenicTheme?.circularLoaderTheme.sizes.lg ??
            SelenicCircularLoaderSizes(tokens: SelenicTokens.light).lg;
      default:
        return context.selenicTheme?.circularLoaderTheme.sizes.md ??
            SelenicCircularLoaderSizes(tokens: SelenicTokens.light).md;
    }
  }

  @override
  Widget build(BuildContext context) {
    final SelenicCircularLoaderSizeProperties effectiveLoaderSize =
        _getSelenicLoaderSize(context, circularLoaderSize);

    final Color effectiveColor = color ??
        context.selenicTheme?.circularLoaderTheme.colors.color ??
        MoonColors.light.piccolo;

    final Color effectiveBackgroundColor = backgroundColor ??
        context.selenicTheme?.circularLoaderTheme.colors.backgroundColor ??
        Colors.transparent;

    final double effectiveSize =
        sizeValue ?? effectiveLoaderSize.loaderSizeValue;

    final double effectiveStrokeWidth =
        strokeWidth ?? effectiveLoaderSize.loaderStrokeWidth;

    final StrokeCap effectiveStrokeCap = strokeCap ?? StrokeCap.round;

    return SizedBox(
      height: effectiveSize,
      width: effectiveSize,
      child: SelenicCircularProgressIndicator(
        color: effectiveColor,
        backgroundColor: effectiveBackgroundColor,
        strokeWidth: effectiveStrokeWidth,
        strokeCap: effectiveStrokeCap,
      ),
    );
  }
}
