import 'package:flutter/material.dart';

import 'package:moon_tokens/moon_tokens.dart';

import 'package:selenic_design/src/theme/effects/effects_theme.dart';
import 'package:selenic_design/src/theme/theme.dart';
import 'package:selenic_design/src/theme/tokens/borders.dart';
import 'package:selenic_design/src/theme/tokens/sizes.dart';
import 'package:selenic_design/src/theme/tokens/tokens.dart';
import 'package:selenic_design/src/theme/tokens/typography/typography.dart';
import 'package:selenic_design/src/utils/color_tween_premul.dart';
import 'package:selenic_design/src/utils/extensions.dart';
import 'package:selenic_design/src/utils/squircle/squircle_border.dart';
import 'package:selenic_design/src/widgets/common/base_control.dart';

class SelenicMenuItem extends StatefulWidget {
  /// Defines how the widgets of the menu item are aligned along the cross axis.
  ///
  /// Defaults to the [CrossAxisAlignment.center].
  final CrossAxisAlignment? menuItemCrossAxisAlignment;

  /// Defines how the [label] and [content] widgets of the menu item are aligned
  /// along the cross axis within [label] and [content] slots.
  ///
  /// Defaults to the [CrossAxisAlignment.start].
  final CrossAxisAlignment? labelAndContentCrossAxisAlignment;

  /// Whether the menu item should absorb gestures. If this is true the menu
  /// item children will not receive gestures.
  final bool absorbGestures;

  /// {@macro flutter.widgets.Focus.autofocus}
  final bool autofocus;

  /// The border radius of the menu item.
  final BorderRadiusGeometry? borderRadius;

  /// The background color of the menu item.
  final Color? backgroundColor;

  /// The color of the menu item hover effect.
  final Color? hoverEffectColor;

  /// The custom decoration of the menu item.
  final Decoration? decoration;

  /// The height of the menu item.
  final double? height;

  /// The width of the menu item.
  final double? width;

  /// The horizontal gap between the [leading], [label] and [trailing] widgets
  /// of the menu item.
  final double? horizontalGap;

  /// The vertical gap between the [label] and [content] widgets of the menu
  /// item.
  final double? verticalGap;

  /// The duration of the menu item hover effect.
  final Duration? hoverEffectDuration;

  /// The curve of the menu item hover effect.
  final Curve? hoverEffectCurve;

  /// The padding of the menu item.
  final EdgeInsetsGeometry? menuItemPadding;

  /// {@macro flutter.widgets.Focus.focusNode}
  final FocusNode? focusNode;

  /// The semantic label for the menu item.
  final String? semanticLabel;

  /// The callback that is called when the menu item is tapped or pressed.
  /// The menu item is disabled when both [onTap] and [onLongPress] are null.
  final VoidCallback? onTap;

  /// The callback that is called when the menu item is long pressed.
  /// The menu item is disabled when both [onLongPress] and [onTap] are null.
  final VoidCallback? onLongPress;

  /// The widget to display before the [label] widget of the menu item.
  final Widget? leading;

  /// The primary content of the menu item header.
  final Widget label;

  /// The widget to display below the [label] widget of the menu item.
  /// The secondary content of the menu item header.
  final Widget? content;

  /// The widget to display after the [label] widget of the menu item.
  final Widget? trailing;

  /// Creates a Selenic Design menu item.
  const SelenicMenuItem({
    super.key,
    this.menuItemCrossAxisAlignment,
    this.labelAndContentCrossAxisAlignment,
    this.absorbGestures = false,
    this.autofocus = false,
    this.borderRadius,
    this.backgroundColor,
    this.hoverEffectColor,
    this.decoration,
    this.height,
    this.width,
    this.horizontalGap,
    this.verticalGap,
    this.hoverEffectDuration,
    this.hoverEffectCurve,
    this.menuItemPadding,
    this.focusNode,
    this.semanticLabel,
    this.onTap,
    this.onLongPress,
    this.leading,
    required this.label,
    this.content,
    this.trailing,
  }) : assert(
          labelAndContentCrossAxisAlignment != CrossAxisAlignment.baseline,
          'The CrossAxisAlignment.baseline is not supported since the label and '
          'content of menu item are aligned in a column, not in a row. '
          'Try using another constant.',
        );

  static Iterable<Widget> divideMenuItems({
    required BuildContext context,
    required Iterable<Widget> menuItems,
    Color? color,
    double? width,
  }) {
    final menuList = menuItems.toList();

    if (menuList.isEmpty || menuList.length == 1) return menuList;

    final Color effectiveColor = color ??
        context.selenicTheme?.menuItemTheme.colors.dividerColor ??
        MoonColors.light.beerus;

    Widget wrapMenuItem(Widget menuList) {
      return DecoratedBox(
        position: DecorationPosition.foreground,
        decoration: BoxDecoration(
          border: Border(
            bottom: Divider.createBorderSide(
              context,
              color: effectiveColor,
              width: width,
            ),
          ),
        ),
        child: menuList,
      );
    }

    return <Widget>[
      ...menuList.take(menuList.length - 1).map(wrapMenuItem),
      menuList.last,
    ];
  }

  @override
  State<SelenicMenuItem> createState() => _SelenicMenuItemState();
}

class _SelenicMenuItemState extends State<SelenicMenuItem>
    with TickerProviderStateMixin {
  final ColorTweenWithPremultipliedAlpha _backgroundColorTween =
      ColorTweenWithPremultipliedAlpha();

  AnimationController? _animationController;
  Animation<Color?>? _backgroundColor;

  void _handleActiveStatus(bool isActive) {
    isActive
        ? _animationController!.forward()
        : _animationController!.reverse();
  }

  @override
  void dispose() {
    _animationController!.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final BorderRadiusGeometry effectiveBorderRadius = widget.borderRadius ??
        context.selenicTheme?.menuItemTheme.properties.borderRadius ??
        SelenicBorders.borders.interactiveSm;

    final double effectiveMinimumHeaderHeight = widget.height ??
        context.selenicTheme?.menuItemTheme.properties.minimumHeight ??
        SelenicSizes.sizes.md;

    final double effectiveVerticalGap = widget.verticalGap ??
        context.selenicTheme?.menuItemTheme.properties.verticalGap ??
        SelenicSizes.sizes.x5s;

    final EdgeInsetsGeometry effectiveHeaderPadding = widget.menuItemPadding ??
        context.selenicTheme?.menuItemTheme.properties.padding ??
        EdgeInsets.all(SelenicSizes.sizes.x3s);

    final EdgeInsets resolvedDirectionalHeaderPadding =
        effectiveHeaderPadding.resolve(Directionality.of(context));

    final Color effectiveBackgroundColor = widget.backgroundColor ??
        context.selenicTheme?.menuItemTheme.colors.backgroundColor ??
        Colors.transparent;

    final Color effectiveIconColor =
        context.selenicTheme?.menuItemTheme.colors.iconColor ??
            MoonColors.light.iconPrimary;

    final Color effectiveLabelTextColor =
        context.selenicTheme?.menuItemTheme.colors.labelTextColor ??
            MoonColors.light.textPrimary;

    final Color effectiveContentTextColor =
        context.selenicTheme?.menuItemTheme.colors.contentTextColor ??
            MoonColors.light.textSecondary;

    final TextStyle effectiveLabelTextStyle =
        context.selenicTheme?.menuItemTheme.properties.labelTextStyle ??
            SelenicTypography.typography.body.textDefault;

    final TextStyle effectiveContentTextStyle =
        context.selenicTheme?.menuItemTheme.properties.contentTextStyle ??
            SelenicTypography.typography.body.text12;

    final Color effectiveHoverEffectColor = widget.hoverEffectColor ??
        context.selenicEffects?.controlHoverEffect.primaryHoverColor ??
        SelenicEffectsTheme(tokens: SelenicTokens.light)
            .controlHoverEffect
            .primaryHoverColor;

    final Color resolvedHoverColor = Color.alphaBlend(
      effectiveHoverEffectColor,
      widget.backgroundColor ?? Colors.transparent,
    );

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

    _backgroundColorTween
      ..begin = effectiveBackgroundColor
      ..end = resolvedHoverColor;

    return Semantics(
      label: widget.semanticLabel,
      enabled: widget.onTap != null,
      child: SelenicBaseControl(
        onTap: widget.onTap,
        onLongPress: widget.onLongPress,
        propagateGesturesToChild: !widget.absorbGestures,
        autofocus: widget.autofocus,
        focusNode: widget.focusNode,
        borderRadius: effectiveBorderRadius.squircleBorderRadius(context),
        builder: (
          BuildContext context,
          bool isEnabled,
          bool isHovered,
          bool isFocused,
          bool isPressed,
        ) {
          final bool isActive = isHovered || isFocused;

          _handleActiveStatus(isActive);

          return AnimatedBuilder(
            animation: _animationController!,
            builder: (BuildContext context, Widget? child) {
              return Container(
                height: widget.height,
                width: widget.width,
                constraints: BoxConstraints(
                  minHeight: effectiveMinimumHeaderHeight,
                ),
                padding: resolvedDirectionalHeaderPadding,
                decoration: widget.decoration ??
                    ShapeDecoration(
                      color: _backgroundColor!.value,
                      shape: SelenicSquircleBorder(
                        borderRadius:
                            effectiveBorderRadius.squircleBorderRadius(context),
                      ),
                    ),
                child: child,
              );
            },
            child: IconTheme(
              data: IconThemeData(color: effectiveIconColor),
              child: DefaultTextStyle(
                style: effectiveLabelTextStyle.copyWith(
                  color: effectiveLabelTextColor,
                ),
                child: Row(
                  crossAxisAlignment: widget.menuItemCrossAxisAlignment ??
                      CrossAxisAlignment.center,
                  children: [
                    if (widget.leading != null)
                      Padding(
                        padding: EdgeInsetsDirectional.only(
                          end: widget.horizontalGap ??
                              resolvedDirectionalHeaderPadding.left,
                        ),
                        child: widget.leading,
                      ),
                    Expanded(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment:
                            widget.labelAndContentCrossAxisAlignment ??
                                CrossAxisAlignment.start,
                        children: [
                          widget.label,
                          if (widget.content != null)
                            DefaultTextStyle(
                              style: effectiveContentTextStyle.copyWith(
                                color: effectiveContentTextColor,
                              ),
                              child: Padding(
                                padding: EdgeInsets.only(
                                  top: effectiveVerticalGap,
                                ),
                                child: widget.content,
                              ),
                            ),
                        ],
                      ),
                    ),
                    if (widget.trailing != null)
                      Padding(
                        padding: EdgeInsetsDirectional.only(
                          start: widget.horizontalGap ??
                              resolvedDirectionalHeaderPadding.right,
                        ),
                        child: widget.trailing,
                      ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
