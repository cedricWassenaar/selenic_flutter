import 'package:flutter/material.dart';

import 'package:moon_tokens/moon_tokens.dart';

import 'package:selenic_design/src/theme/loaders/linear_loader/linear_loader_size_properties.dart';
import 'package:selenic_design/src/theme/loaders/linear_loader/linear_loader_sizes.dart';
import 'package:selenic_design/src/theme/theme.dart';
import 'package:selenic_design/src/theme/tokens/tokens.dart';
import 'package:selenic_design/src/widgets/common/progress_indicators/linear_progress_indicator.dart';

enum SelenicLinearLoaderSize {
  x6s,
  x5s,
  x4s,
  x3s,
  x2s,
}

class SelenicLinearLoader extends StatelessWidget {
  /// The border radius of the linear loader.
  final BorderRadiusGeometry? borderRadius;

  /// The color of the linear loader.
  final Color? color;

  /// The background color of the linear loader.
  final Color? backgroundColor;

  /// The height of the linear loader.
  final double? height;

  /// The size of the linear loader.
  final SelenicLinearLoaderSize? linearLoaderSize;

  /// Creates a Selenic Design linear loader.
  const SelenicLinearLoader({
    super.key,
    this.borderRadius,
    this.color,
    this.backgroundColor,
    this.height,
    this.linearLoaderSize,
  });

  SelenicLinearLoaderSizeProperties _getSelenicLoaderSize(
    BuildContext context,
    SelenicLinearLoaderSize? loaderSize,
  ) {
    switch (loaderSize) {
      case SelenicLinearLoaderSize.x6s:
        return context.selenicTheme?.linearLoaderTheme.sizes.x6s ??
            SelenicLinearLoaderSizes(tokens: SelenicTokens.light).x6s;
      case SelenicLinearLoaderSize.x5s:
        return context.selenicTheme?.linearLoaderTheme.sizes.x5s ??
            SelenicLinearLoaderSizes(tokens: SelenicTokens.light).x5s;
      case SelenicLinearLoaderSize.x4s:
        return context.selenicTheme?.linearLoaderTheme.sizes.x4s ??
            SelenicLinearLoaderSizes(tokens: SelenicTokens.light).x4s;
      case SelenicLinearLoaderSize.x3s:
        return context.selenicTheme?.linearLoaderTheme.sizes.x3s ??
            SelenicLinearLoaderSizes(tokens: SelenicTokens.light).x3s;
      case SelenicLinearLoaderSize.x2s:
        return context.selenicTheme?.linearLoaderTheme.sizes.x2s ??
            SelenicLinearLoaderSizes(tokens: SelenicTokens.light).x2s;
      default:
        return context.selenicTheme?.linearLoaderTheme.sizes.x4s ??
            SelenicLinearLoaderSizes(tokens: SelenicTokens.light).x4s;
    }
  }

  @override
  Widget build(BuildContext context) {
    final SelenicLinearLoaderSizeProperties effectiveLoaderSize =
        _getSelenicLoaderSize(context, linearLoaderSize);

    final BorderRadiusGeometry effectiveBorderRadius =
        borderRadius ?? effectiveLoaderSize.borderRadius;

    final Color effectiveColor = color ??
        context.selenicTheme?.linearLoaderTheme.colors.color ??
        MoonColors.light.piccolo;

    final Color effectiveBackgroundColor = backgroundColor ??
        context.selenicTheme?.linearLoaderTheme.colors.backgroundColor ??
        Colors.transparent;

    final double effectiveHeight = height ?? effectiveLoaderSize.loaderHeight;

    return SelenicLinearProgressIndicator(
      color: effectiveColor,
      backgroundColor: effectiveBackgroundColor,
      containerRadius: effectiveBorderRadius,
      progressRadius: effectiveBorderRadius,
      minHeight: effectiveHeight,
    );
  }
}
