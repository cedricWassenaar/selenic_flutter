import 'package:flutter/material.dart';
import 'package:selenic_design/src/theme/colors/colors.dart' show SelenicColors;

import 'package:selenic_design/src/theme/theme.dart';
import 'package:selenic_design/src/theme/tokens/borders.dart';
import 'package:selenic_design/src/theme/tokens/sizes.dart';
import 'package:selenic_design/src/theme/tokens/transitions.dart';
import 'package:selenic_design/src/theme/tokens/typography/typography.dart';
import 'package:selenic_design/src/utils/extensions.dart';
import 'package:selenic_design/src/utils/shape_decoration_premul.dart';
import 'package:selenic_design/src/utils/squircle/squircle_border.dart';

class SelenicAlert extends StatefulWidget {
  /// Whether to show the alert.
  final bool show;

  /// Whether to show a border around the alert.
  final bool showBorder;

  /// The border radius of the alert.
  final BorderRadiusGeometry? borderRadius;

  /// The background color of the alert.
  final Color? backgroundColor;

  /// The border color of the alert.
  final Color? borderColor;

  /// The text and icon color of the alert.
  final Color? color;

  /// The border width of the alert.
  final double? borderWidth;

  /// The horizontal gap between the [leading], [label] and [trailing] widgets
  /// of the alert.
  final double? horizontalGap;

  /// The minimum height of the alert.
  final double? minimumHeight;

  /// The vertical gap between the alert header and [content].
  final double? verticalGap;

  /// The duration of the alert transition animation (fade in or out).
  final Duration? transitionDuration;

  /// The curve of the alert transition animation (fade in or out).
  final Curve? transitionCurve;

  /// The padding of the alert.
  final EdgeInsetsGeometry? padding;

  /// The custom decoration of the alert.
  final Decoration? decoration;

  /// The semantic label for the alert.
  final String? semanticLabel;

  /// The widget to display before the [label] widget of the alert.
  final Widget? leading;

  /// The primary content of the alert header.
  final Widget label;

  /// The widget to display after the [label] widget of the alert.
  final Widget? trailing;

  /// The widget to display below the alert header.
  final Widget? content;

  /// Creates a Selenic Design base alert.
  ///
  /// See also:
  ///
  ///   * [SelenicAlert.filled], Selenic Design filled alert.
  ///   * [SelenicAlert.outlined], Selenic Design outlined alert.
  const SelenicAlert({
    super.key,
    this.show = false,
    this.showBorder = false,
    this.borderRadius,
    this.backgroundColor,
    this.borderColor,
    this.color,
    this.borderWidth,
    this.horizontalGap,
    this.minimumHeight,
    this.verticalGap,
    this.transitionDuration,
    this.transitionCurve,
    this.padding,
    this.decoration,
    this.semanticLabel,
    this.leading,
    required this.label,
    this.trailing,
    this.content,
  });

  /// Creates a Selenic Design filled alert.
  ///
  /// See also:
  ///
  ///   * [SelenicAlert.outlined], Selenic Design outlined alert.
  const SelenicAlert.filled({
    super.key,
    this.show = false,
    this.borderRadius,
    this.color,
    required this.backgroundColor,
    this.semanticLabel,
    this.leading,
    required this.label,
    this.trailing,
    this.content,
  })  : showBorder = false,
        borderColor = null,
        borderWidth = null,
        decoration = null,
        minimumHeight = null,
        padding = null,
        horizontalGap = null,
        verticalGap = null,
        transitionDuration = null,
        transitionCurve = null;

  /// Creates a Selenic Design outlined alert.
  ///
  /// See also:
  ///
  ///   * [SelenicAlert.filled], Selenic Design filled alert.
  const SelenicAlert.outlined({
    super.key,
    this.show = false,
    this.borderRadius,
    this.borderWidth,
    this.color,
    required this.borderColor,
    this.semanticLabel,
    this.leading,
    required this.label,
    this.trailing,
    this.content,
  })  : showBorder = true,
        backgroundColor = Colors.transparent,
        decoration = null,
        minimumHeight = null,
        padding = null,
        horizontalGap = null,
        verticalGap = null,
        transitionDuration = null,
        transitionCurve = null;

  @override
  State<SelenicAlert> createState() => _SelenicAlertState();
}

class _SelenicAlertState extends State<SelenicAlert>
    with SingleTickerProviderStateMixin {
  bool _isVisible = true;

  AnimationController? _animationController;
  Animation<double>? _curvedAnimation;

  TextStyle _getLabelTextStyle({required BuildContext context}) {
    if (widget.content != null) {
      return context.selenicTheme?.alertTheme.properties.labelTextStyle ??
          SelenicTypography.typography.heading.textDefault;
    } else {
      return context.selenicTheme?.alertTheme.properties.contentTextStyle ??
          SelenicTypography.typography.body.textDefault;
    }
  }

  void _showAlert() {
    _animationController!.forward();

    setState(() => _isVisible = true);
  }

  void _hideAlert() {
    _animationController!.reverse().then<void>((void value) {
      if (mounted) setState(() => _isVisible = false);
    });
  }

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((Duration _) {
      if (!mounted) return;

      if (_isVisible) _animationController!.value = 1.0;
    });
  }

  @override
  void didUpdateWidget(SelenicAlert oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.show != widget.show) {
      widget.show ? _showAlert() : _hideAlert();
    }
  }

  @override
  void dispose() {
    _animationController!.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final BorderRadiusGeometry effectiveBorderRadius = widget.borderRadius ??
        context.selenicTheme?.alertTheme.properties.borderRadius ??
        SelenicBorders.borders.interactiveSm;

    final double effectiveBorderWidth = widget.borderWidth ??
        context.selenicBorders?.defaultBorderWidth ??
        SelenicBorders.borders.defaultBorderWidth;

    final double effectiveHorizontalGap = widget.horizontalGap ??
        context.selenicTheme?.alertTheme.properties.horizontalGap ??
        SelenicSizes.sizes.x3s;

    final double effectiveVerticalGap = widget.verticalGap ??
        context.selenicTheme?.alertTheme.properties.verticalGap ??
        SelenicSizes.sizes.x4s;

    final double effectiveMinimumHeight = widget.minimumHeight ??
        context.selenicTheme?.alertTheme.properties.minimumHeight ??
        SelenicSizes.sizes.xl;

    final Color effectiveBackgroundColor = widget.backgroundColor ??
        context.selenicTheme?.alertTheme.colors.backgroundColor ??
        SelenicColors.light.backgroundPrimary;

    final Color effectiveBorderColor = widget.borderColor ??
        context.selenicTheme?.alertTheme.colors.borderColor ??
        SelenicColors.light.bodyTextPrimary;

    final Color effectiveTextColor = widget.color ??
        context.selenicTheme?.alertTheme.colors.textColor ??
        SelenicColors.light.textPrimary;

    final Color effectiveIconColor = widget.color ??
        context.selenicTheme?.alertTheme.colors.iconColor ??
        SelenicColors.light.iconPrimary;

    final EdgeInsetsGeometry effectivePadding = widget.padding ??
        context.selenicTheme?.alertTheme.properties.padding ??
        EdgeInsets.all(SelenicSizes.sizes.x2s);

    final TextStyle effectiveLabelTextStyle =
        _getLabelTextStyle(context: context);

    final TextStyle effectiveContentTextStyle =
        context.selenicTheme?.alertTheme.properties.contentTextStyle ??
            SelenicTypography.typography.body.textDefault;

    final Duration effectiveTransitionDuration = widget.transitionDuration ??
        context.selenicTheme?.alertTheme.properties.transitionDuration ??
        SelenicTransitions.transitions.defaultTransitionDuration;

    final Curve effectiveTransitionCurve = widget.transitionCurve ??
        context.selenicTheme?.alertTheme.properties.transitionCurve ??
        SelenicTransitions.transitions.defaultTransitionCurve;

    _animationController ??= AnimationController(
      duration: effectiveTransitionDuration,
      vsync: this,
    );

    _curvedAnimation ??= CurvedAnimation(
      parent: _animationController!,
      curve: effectiveTransitionCurve,
    );

    return Visibility(
      visible: _isVisible,
      child: Semantics(
        label: widget.semanticLabel,
        child: RepaintBoundary(
          child: FadeTransition(
            opacity: _curvedAnimation!,
            child: Container(
              padding: effectivePadding,
              constraints: BoxConstraints(minHeight: effectiveMinimumHeight),
              decoration: widget.decoration ??
                  ShapeDecorationWithPremultipliedAlpha(
                    color: effectiveBackgroundColor,
                    shape: SelenicSquircleBorder(
                      side: BorderSide(
                        color: effectiveBorderColor,
                        width: widget.showBorder ? effectiveBorderWidth : 0,
                        style: widget.showBorder
                            ? BorderStyle.solid
                            : BorderStyle.none,
                      ),
                      borderRadius:
                          effectiveBorderRadius.squircleBorderRadius(context),
                    ),
                  ),
              child: IconTheme(
                data: IconThemeData(
                  color: effectiveIconColor,
                ),
                child: DefaultTextStyle(
                  style: effectiveContentTextStyle.copyWith(
                    color: effectiveTextColor,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          if (widget.leading != null)
                            Padding(
                              padding: EdgeInsetsDirectional.only(
                                end: effectiveHorizontalGap,
                              ),
                              child: widget.leading,
                            ),
                          DefaultTextStyle(
                            style: effectiveLabelTextStyle.copyWith(
                              color: effectiveTextColor,
                            ),
                            child: Expanded(
                              child: widget.label,
                            ),
                          ),
                          if (widget.trailing != null)
                            Padding(
                              padding: EdgeInsetsDirectional.only(
                                start: effectiveHorizontalGap,
                              ),
                              child: widget.trailing,
                            ),
                        ],
                      ),
                      if (widget.content != null)
                        Row(
                          children: [
                            Expanded(
                              child: Padding(
                                padding: EdgeInsetsDirectional.only(
                                  top: effectiveVerticalGap,
                                ),
                                child: widget.content,
                              ),
                            ),
                          ],
                        ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
