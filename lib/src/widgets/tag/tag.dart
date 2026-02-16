import 'package:flutter/material.dart';

import 'package:moon_tokens/moon_tokens.dart';

import 'package:selenic_design/src/theme/tag/tag_size_properties.dart';
import 'package:selenic_design/src/theme/tag/tag_sizes.dart';
import 'package:selenic_design/src/theme/theme.dart';
import 'package:selenic_design/src/theme/tokens/tokens.dart';
import 'package:selenic_design/src/utils/extensions.dart';
import 'package:selenic_design/src/utils/shape_decoration_premul.dart';
import 'package:selenic_design/src/utils/squircle/squircle_border.dart';

enum SelenicTagSize {
  x2s,
  xs,
  sm,
}

class SelenicTag extends StatelessWidget {
  /// The border radius of the tag.
  final BorderRadiusGeometry? borderRadius;

  /// The background color of the tag.
  final Color? backgroundColor;

  /// The height of the tag.
  final double? height;

  /// The width of the tag.
  final double? width;

  /// The gap between the [leading], [label] and [trailing] widgets of the tag.
  final double? gap;

  /// The padding of the tag.
  final EdgeInsetsGeometry? padding;

  /// The size of the tag.
  final SelenicTagSize? tagSize;

  /// The custom decoration of the tag.
  final Decoration? decoration;

  /// The semantic label for the tag.
  final String? semanticLabel;

  /// The callback that is called when the tag is tapped or pressed.
  final VoidCallback? onTap;

  /// The callback that is called when the tag is long-pressed.
  final VoidCallback? onLongPress;

  /// The widget to display before the [label] widget of the tag.
  final Widget? leading;

  /// The primary content of the tag widget.
  final Widget? label;

  /// The widget to display after the [label] widget of the tag.
  final Widget? trailing;

  /// Creates a Selenic Design tag.
  const SelenicTag({
    super.key,
    this.borderRadius,
    this.backgroundColor,
    this.height,
    this.width,
    this.gap,
    this.padding,
    this.tagSize,
    this.decoration,
    this.semanticLabel,
    this.onTap,
    this.onLongPress,
    this.leading,
    this.label,
    this.trailing,
  });

  SelenicTagSizeProperties _getSelenicTagSize(
    BuildContext context,
    SelenicTagSize? tagSize,
  ) {
    return switch (tagSize) {
      SelenicTagSize.x2s => context.selenicTheme?.tagTheme.sizes.x2s ??
          SelenicTagSizes(tokens: SelenicTokens.light).x2s,
      SelenicTagSize.xs => context.selenicTheme?.tagTheme.sizes.xs ??
          SelenicTagSizes(tokens: SelenicTokens.light).xs,
      SelenicTagSize.sm => context.selenicTheme?.tagTheme.sizes.sm ??
          SelenicTagSizes(tokens: SelenicTokens.light).sm,
      _ => context.selenicTheme?.tagTheme.sizes.xs ??
          SelenicTagSizes(tokens: SelenicTokens.light).xs,
    };
  }

  @override
  Widget build(BuildContext context) {
    final SelenicTagSizeProperties effectiveSelenicTagSize =
        _getSelenicTagSize(context, tagSize);

    final BorderRadiusGeometry effectiveBorderRadius =
        borderRadius ?? effectiveSelenicTagSize.borderRadius;

    final Color effectiveBackgroundColor = backgroundColor ??
        context.selenicTheme?.tagTheme.colors.backgroundColor ??
        MoonColors.light.goku;

    final Color effectiveTextColor =
        context.selenicTheme?.tagTheme.colors.textColor ??
            MoonColors.light.textPrimary;

    final Color effectiveIconColor =
        context.selenicTheme?.tagTheme.colors.iconColor ??
            MoonColors.light.iconPrimary;

    final double effectiveHeight = height ?? effectiveSelenicTagSize.height;

    final double effectiveGap = gap ?? effectiveSelenicTagSize.gap;

    final EdgeInsetsGeometry effectivePadding =
        padding ?? effectiveSelenicTagSize.padding;

    final EdgeInsets resolvedDirectionalPadding =
        effectivePadding.resolve(Directionality.of(context));

    final EdgeInsetsGeometry correctedPadding = padding == null
        ? EdgeInsetsDirectional.fromSTEB(
            leading == null && label != null
                ? resolvedDirectionalPadding.left
                : 0,
            resolvedDirectionalPadding.top,
            trailing == null && label != null
                ? resolvedDirectionalPadding.right
                : 0,
            resolvedDirectionalPadding.bottom,
          )
        : resolvedDirectionalPadding;

    return Semantics(
      label: semanticLabel,
      button: false,
      focusable: false,
      child: GestureDetector(
        excludeFromSemantics: true,
        onTap: onTap,
        onLongPress: onLongPress,
        child: MouseRegion(
          cursor: onTap != null
              ? SystemMouseCursors.click
              : SystemMouseCursors.basic,
          child: Container(
            width: width,
            height: effectiveHeight,
            padding: correctedPadding,
            constraints: BoxConstraints(minWidth: effectiveHeight),
            decoration: decoration ??
                ShapeDecorationWithPremultipliedAlpha(
                  color: effectiveBackgroundColor,
                  shape: SelenicSquircleBorder(
                    borderRadius:
                        effectiveBorderRadius.squircleBorderRadius(context),
                  ),
                ),
            child: IconTheme(
              data: IconThemeData(
                color: effectiveIconColor,
                size: effectiveSelenicTagSize.iconSizeValue,
              ),
              child: DefaultTextStyle(
                style: effectiveSelenicTagSize.textStyle.copyWith(
                  color: effectiveTextColor,
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if (leading != null)
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: effectiveGap),
                        child: leading,
                      ),
                    if (label != null) label!,
                    if (trailing != null)
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: effectiveGap),
                        child: trailing,
                      ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
