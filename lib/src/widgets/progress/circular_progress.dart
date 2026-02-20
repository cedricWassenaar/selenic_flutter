import 'package:flutter/material.dart';
import 'package:selenic_design/src/theme/colors/colors.dart' show SelenicColors;

import 'package:selenic_design/src/theme/progress/circular_progress/circular_progress_size_properties.dart';
import 'package:selenic_design/src/theme/progress/circular_progress/circular_progress_sizes.dart';
import 'package:selenic_design/src/theme/theme.dart';
import 'package:selenic_design/src/theme/tokens/tokens.dart';
import 'package:selenic_design/src/widgets/common/progress_indicators/circular_progress_indicator.dart';

enum SelenicCircularProgressSize {
  x2s,
  xs,
  sm,
  md,
  lg,
}

class SelenicCircularProgress extends StatelessWidget {
  /// The color of the circular progress.
  final Color? color;

  /// The background color of the circular progress.
  final Color? backgroundColor;

  /// The custom size value of the circular progress. For predefined sizes, use
  /// [circularProgressSize].
  final double? sizeValue;

  /// The width of the stroke for the circular progress.
  final double? strokeWidth;

  /// The progress value of the circular progress.
  final double value;

  /// The size of the circular progress.
  final SelenicCircularProgressSize? circularProgressSize;

  /// The semantic label for the circular progress.
  final String? semanticLabel;

  /// The shape of the end of the stroke (stroke-cap) for the circular progress.
  final StrokeCap? strokeCap;

  /// Creates a Selenic Design circular progress.
  const SelenicCircularProgress({
    super.key,
    this.color,
    this.backgroundColor,
    this.sizeValue,
    this.strokeWidth,
    required this.value,
    this.circularProgressSize,
    this.semanticLabel,
    this.strokeCap,
  });

  SelenicCircularProgressSizeProperties _getSelenicCircularProgressSize(
    BuildContext context,
    SelenicCircularProgressSize? circularProgressSize,
  ) {
    switch (circularProgressSize) {
      case SelenicCircularProgressSize.x2s:
        return context.selenicTheme?.circularProgressTheme.sizes.x2s ??
            SelenicCircularProgressSizes(tokens: SelenicTokens.light).x2s;
      case SelenicCircularProgressSize.xs:
        return context.selenicTheme?.circularProgressTheme.sizes.xs ??
            SelenicCircularProgressSizes(tokens: SelenicTokens.light).xs;
      case SelenicCircularProgressSize.sm:
        return context.selenicTheme?.circularProgressTheme.sizes.sm ??
            SelenicCircularProgressSizes(tokens: SelenicTokens.light).sm;
      case SelenicCircularProgressSize.md:
        return context.selenicTheme?.circularProgressTheme.sizes.md ??
            SelenicCircularProgressSizes(tokens: SelenicTokens.light).md;
      case SelenicCircularProgressSize.lg:
        return context.selenicTheme?.circularProgressTheme.sizes.lg ??
            SelenicCircularProgressSizes(tokens: SelenicTokens.light).lg;
      default:
        return context.selenicTheme?.circularProgressTheme.sizes.md ??
            SelenicCircularProgressSizes(tokens: SelenicTokens.light).md;
    }
  }

  @override
  Widget build(BuildContext context) {
    final Color effectiveColor = color ??
        context.selenicTheme?.circularProgressTheme.colors.color ??
        SelenicColors.light.accentPrimary;

    final Color effectiveBackgroundColor = backgroundColor ??
        context.selenicTheme?.circularProgressTheme.colors.backgroundColor ??
        SelenicColors.light.lineAccent;

    final SelenicCircularProgressSizeProperties
        effectiveSelenicCircularProgressSize =
        _getSelenicCircularProgressSize(context, circularProgressSize);

    final double effectiveSize =
        sizeValue ?? effectiveSelenicCircularProgressSize.progressSizeValue;

    final double effectiveStrokeWidth =
        strokeWidth ?? effectiveSelenicCircularProgressSize.progressStrokeWidth;

    final StrokeCap effectiveStrokeCap = strokeCap ?? StrokeCap.round;

    return Semantics(
      label: semanticLabel,
      value: "${value * 100}%",
      child: SizedBox(
        height: effectiveSize,
        width: effectiveSize,
        child: SelenicCircularProgressIndicator(
          color: effectiveColor,
          backgroundColor: effectiveBackgroundColor,
          strokeWidth: effectiveStrokeWidth,
          value: value,
          strokeCap: effectiveStrokeCap,
        ),
      ),
    );
  }
}
