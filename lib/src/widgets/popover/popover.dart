import 'package:flutter/material.dart';

import 'package:moon_tokens/moon_tokens.dart';

import 'package:selenic_design/src/theme/theme.dart';
import 'package:selenic_design/src/theme/tokens/shadows.dart';
import 'package:selenic_design/src/theme/tokens/transitions.dart';
import 'package:selenic_design/src/theme/tokens/typography/typography.dart';
import 'package:selenic_design/src/utils/extensions.dart';
import 'package:selenic_design/src/utils/shape_decoration_premul.dart';
import 'package:selenic_design/src/utils/squircle/squircle_border.dart';

enum SelenicPopoverPosition {
  top,
  topLeft,
  topRight,
  bottom,
  bottomLeft,
  bottomRight,
  left,
  right,
  vertical,
  horizontal,
}

class SelenicPopover extends StatefulWidget {
  // This is necessary to ensure that only one popover is visible at a time.
  static final List<SelenicPopoverState> _openedPopovers = [];

  /// Whether to show the popover.
  final bool show;

  /// The border radius of the popover.
  final BorderRadiusGeometry? borderRadius;

  /// The background color of the popover.
  final Color? backgroundColor;

  /// The border color of the popover.
  final Color borderColor;

  /// The custom decoration of the popover.
  final Decoration? decoration;

  /// The border width of the popover.
  final double borderWidth;

  /// The distance between the popover and the [child] (target).
  final double? distanceToTarget;

  /// An optional size constraint for the popover [content] to define its
  /// minimum height.
  ///
  /// If a constraint is not provided, the size will automatically adjust to
  /// the [content].
  final double? minHeight;

  /// An optional size constraint for the popover [content] to define its
  /// minimum width.
  ///
  /// If a constraint is not provided, the size will automatically adjust to
  /// the [content].
  final double? minWidth;

  /// An optional size constraint for the popover [content] to define its
  /// maximum height.
  ///
  /// If a constraint is not provided, the size will automatically adjust to
  /// the [content].
  final double? maxHeight;

  /// An optional size constraint for the popover [content] to define its
  /// maximum width.
  ///
  /// If a constraint is not provided, the size will automatically adjust to
  /// the [content].
  final double? maxWidth;

  /// The margin around the popover. Prevents the popover from touching the
  /// edges of the viewport.
  final double popoverMargin;

  /// The duration of the popover transition animation (fade in or out).
  final Duration? transitionDuration;

  /// The curve of the popover transition animation (fade in or out).
  final Curve? transitionCurve;

  /// The padding of the popover [content].
  final EdgeInsetsGeometry? contentPadding;

  /// The list of shadows applied to the popover.
  final List<BoxShadow>? popoverShadows;

  /// Sets the popover position relative to the [child] (target).
  /// Defaults to [SelenicPopoverPosition.vertical].
  final SelenicPopoverPosition popoverPosition;

  /// The observer to keep track of the route changes and automatically hide
  /// the popover when the widget's route is not active.
  final RouteObserver<PageRoute<dynamic>>? routeObserver;

  /// The semantic label for the popover.
  final String? semanticLabel;

  /// The callback that is called when the user taps outside the popover.
  final VoidCallback? onTapOutside;

  /// The widget to display as the child (target) of the popover.
  final Widget child;

  /// The widget to display inside the popover as its content.
  final Widget content;

  /// Creates a Selenic Design popover.
  const SelenicPopover({
    super.key,
    required this.show,
    this.borderRadius,
    this.backgroundColor,
    this.borderColor = Colors.transparent,
    this.decoration,
    this.borderWidth = 0,
    this.distanceToTarget,
    this.minHeight,
    this.minWidth,
    this.maxHeight,
    this.maxWidth,
    this.popoverMargin = 8,
    this.transitionDuration,
    this.transitionCurve,
    this.contentPadding,
    this.popoverShadows,
    this.popoverPosition = SelenicPopoverPosition.top,
    this.routeObserver,
    this.semanticLabel,
    this.onTapOutside,
    required this.child,
    required this.content,
  });

  // Remove all existing popovers except the provided one.
  static void _removeOtherPopovers(SelenicPopoverState current) {
    if (_openedPopovers.isNotEmpty) {
      // Avoid concurrent modification.
      final List<SelenicPopoverState> openedPopovers = _openedPopovers.toList();

      for (final SelenicPopoverState state in openedPopovers) {
        if (state == current) continue;

        state._clearOverlayEntry();
      }
    }
  }

  @override
  SelenicPopoverState createState() => SelenicPopoverState();
}

class SelenicPopoverState extends State<SelenicPopover>
    with RouteAware, SingleTickerProviderStateMixin {
  late final ObjectKey _regionKey = ObjectKey(widget);
  final LayerLink _layerLink = LayerLink();

  AnimationController? _animationController;
  CurvedAnimation? _curvedAnimation;

  OverlayEntry? _overlayEntry;

  bool _routeIsShowing = true;

  bool get shouldShowPopover => widget.show && _routeIsShowing;

  void _showPopover() {
    _overlayEntry = OverlayEntry(
      builder: (BuildContext context) => _createOverlayContent(),
    );
    Overlay.of(context).insert(_overlayEntry!);

    SelenicPopover._openedPopovers.add(this);
    SelenicPopover._removeOtherPopovers(this);

    _animationController!.value = 0;
    _animationController!.forward();
  }

  void _updatePopover() {
    _overlayEntry?.markNeedsBuild();
  }

  void _removePopover({bool immediately = false}) {
    if (immediately) {
      _clearOverlayEntry();
    } else {
      _animationController!.value = 1;
      _animationController!.reverse().then((value) => _clearOverlayEntry());
    }
  }

  void _handleTapOutside() {
    widget.onTapOutside?.call();
  }

  void _clearOverlayEntry() {
    if (_overlayEntry != null) {
      SelenicPopover._openedPopovers.remove(this);
      _overlayEntry!.remove();
      _overlayEntry = null;
    }
  }

  _PopoverPositionProperties _resolvePopoverPositionParameters({
    required SelenicPopoverPosition popoverPosition,
    required double distanceToTarget,
    required double overlayWidth,
    required double popoverTargetGlobalLeft,
    required double popoverTargetGlobalCenter,
    required double popoverTargetGlobalRight,
  }) {
    return switch (popoverPosition) {
      SelenicPopoverPosition.top => _PopoverPositionProperties(
          offset: Offset(0, -distanceToTarget),
          targetAnchor: Alignment.topCenter,
          followerAnchor: Alignment.bottomCenter,
          popoverMaxWidth: overlayWidth -
              ((overlayWidth / 2 - popoverTargetGlobalCenter) * 2).abs() -
              widget.popoverMargin * 2,
        ),
      SelenicPopoverPosition.bottom => _PopoverPositionProperties(
          offset: Offset(0, distanceToTarget),
          targetAnchor: Alignment.bottomCenter,
          followerAnchor: Alignment.topCenter,
          popoverMaxWidth: overlayWidth -
              ((overlayWidth / 2 - popoverTargetGlobalCenter) * 2).abs() -
              widget.popoverMargin * 2,
        ),
      SelenicPopoverPosition.left => _PopoverPositionProperties(
          offset: Offset(-distanceToTarget, 0),
          targetAnchor: Alignment.centerLeft,
          followerAnchor: Alignment.centerRight,
          popoverMaxWidth:
              popoverTargetGlobalLeft - distanceToTarget - widget.popoverMargin,
        ),
      SelenicPopoverPosition.right => _PopoverPositionProperties(
          offset: Offset(distanceToTarget, 0),
          targetAnchor: Alignment.centerRight,
          followerAnchor: Alignment.centerLeft,
          popoverMaxWidth: overlayWidth -
              popoverTargetGlobalRight -
              distanceToTarget -
              widget.popoverMargin,
        ),
      SelenicPopoverPosition.topLeft => _PopoverPositionProperties(
          offset: Offset(0, -distanceToTarget),
          targetAnchor: Alignment.topRight,
          followerAnchor: Alignment.bottomRight,
          popoverMaxWidth: popoverTargetGlobalRight - widget.popoverMargin,
        ),
      SelenicPopoverPosition.topRight => _PopoverPositionProperties(
          offset: Offset(0, -distanceToTarget),
          targetAnchor: Alignment.topLeft,
          followerAnchor: Alignment.bottomLeft,
          popoverMaxWidth:
              overlayWidth - popoverTargetGlobalLeft - widget.popoverMargin,
        ),
      SelenicPopoverPosition.bottomLeft => _PopoverPositionProperties(
          offset: Offset(0, distanceToTarget),
          targetAnchor: Alignment.bottomRight,
          followerAnchor: Alignment.topRight,
          popoverMaxWidth: popoverTargetGlobalRight - widget.popoverMargin,
        ),
      SelenicPopoverPosition.bottomRight => _PopoverPositionProperties(
          offset: Offset(0, distanceToTarget),
          targetAnchor: Alignment.bottomLeft,
          followerAnchor: Alignment.topLeft,
          popoverMaxWidth:
              overlayWidth - popoverTargetGlobalLeft - widget.popoverMargin,
        ),
      _ => throw AssertionError("No match: $popoverPosition"),
    };
  }

  @override
  void didPush() {
    _routeIsShowing = true;
    // Route was added to the navigator and is now the top-most route.
    if (shouldShowPopover) {
      _removePopover();

      WidgetsBinding.instance.addPostFrameCallback((Duration _) {
        if (mounted) _showPopover();
      });
    }
  }

  @override
  void didPushNext() {
    _routeIsShowing = false;

    _removePopover();
  }

  @override
  Future<void> didPopNext() async {
    _routeIsShowing = true;

    if (shouldShowPopover) {
      // The covering route was popped off the navigator.
      _removePopover();

      await Future.delayed(const Duration(milliseconds: 100), () {
        if (mounted) _showPopover();
      });
    }
  }

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((Duration _) {
      widget.routeObserver
          ?.subscribe(this, ModalRoute.of(context)! as PageRoute<dynamic>);
    });
  }

  @override
  void didUpdateWidget(SelenicPopover oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.routeObserver != widget.routeObserver) {
      oldWidget.routeObserver?.unsubscribe(this);
      widget.routeObserver
          ?.subscribe(this, ModalRoute.of(context)! as PageRoute<dynamic>);
    }

    WidgetsBinding.instance.addPostFrameCallback((Duration _) {
      if (!_routeIsShowing) return;

      if (oldWidget.popoverPosition != widget.popoverPosition) {
        _removePopover(immediately: true);
        _showPopover();
      } else if (shouldShowPopover && _overlayEntry == null) {
        _showPopover();
      } else if (!shouldShowPopover && _overlayEntry != null) {
        _removePopover();
      }

      _updatePopover();
    });
  }

  @override
  void deactivate() {
    if (_overlayEntry != null) _removePopover(immediately: true);

    super.deactivate();
  }

  @override
  void dispose() {
    _animationController?.dispose();

    if (_overlayEntry != null) _removePopover(immediately: true);

    widget.routeObserver?.unsubscribe(this);

    super.dispose();
  }

  Widget _createOverlayContent() {
    SelenicPopoverPosition popoverPosition = widget.popoverPosition;

    final BorderRadiusGeometry effectiveBorderRadius = widget.borderRadius ??
        context.selenicTheme?.popoverTheme.properties.borderRadius ??
        BorderRadius.circular(12);

    final Color effectiveBackgroundColor = widget.backgroundColor ??
        context.selenicTheme?.popoverTheme.colors.backgroundColor ??
        MoonColors.light.goku;

    final Color effectiveTextColor =
        context.selenicTheme?.popoverTheme.colors.textColor ??
            MoonColors.light.textPrimary;

    final Color effectiveIconColor =
        context.selenicTheme?.popoverTheme.colors.iconColor ??
            MoonColors.light.iconPrimary;

    final TextStyle effectiveTextStyle =
        context.selenicTheme?.popoverTheme.properties.textStyle ??
            SelenicTypography.typography.body.textDefault;

    final double effectiveDistanceToTarget = widget.distanceToTarget ??
        context.selenicTheme?.popoverTheme.properties.distanceToTarget ??
        8;

    final EdgeInsetsGeometry effectiveContentPadding = widget.contentPadding ??
        context.selenicTheme?.popoverTheme.properties.contentPadding ??
        const EdgeInsets.all(12);

    final EdgeInsets resolvedContentPadding =
        effectiveContentPadding.resolve(Directionality.of(context));

    final List<BoxShadow> effectivePopoverShadows = widget.popoverShadows ??
        context.selenicTheme?.popoverTheme.shadows.popoverShadows ??
        SelenicShadows.light.sm;

    final RenderBox overlayRenderBox =
        Overlay.of(context).context.findRenderObject()! as RenderBox;

    final RenderBox targetRenderBox = context.findRenderObject()! as RenderBox;

    final Offset popoverTargetGlobalCenter = targetRenderBox.localToGlobal(
      targetRenderBox.size.center(Offset.zero),
      ancestor: overlayRenderBox,
    );

    final Offset popoverTargetGlobalLeft = targetRenderBox.localToGlobal(
      targetRenderBox.size.centerLeft(Offset.zero),
      ancestor: overlayRenderBox,
    );

    final Offset popoverTargetGlobalRight = targetRenderBox.localToGlobal(
      targetRenderBox.size.centerRight(Offset.zero),
      ancestor: overlayRenderBox,
    );

    if (Directionality.of(context) == TextDirection.rtl ||
        popoverPosition == SelenicPopoverPosition.horizontal ||
        popoverPosition == SelenicPopoverPosition.vertical) {
      switch (popoverPosition) {
        case SelenicPopoverPosition.left:
          popoverPosition = SelenicPopoverPosition.right;
        case SelenicPopoverPosition.right:
          popoverPosition = SelenicPopoverPosition.left;
        case SelenicPopoverPosition.topLeft:
          popoverPosition = SelenicPopoverPosition.topRight;
        case SelenicPopoverPosition.topRight:
          popoverPosition = SelenicPopoverPosition.topLeft;
        case SelenicPopoverPosition.bottomLeft:
          popoverPosition = SelenicPopoverPosition.bottomRight;
        case SelenicPopoverPosition.bottomRight:
          popoverPosition = SelenicPopoverPosition.bottomLeft;
        case SelenicPopoverPosition.vertical:
          popoverPosition = popoverTargetGlobalCenter.dy <
                  overlayRenderBox.size.center(Offset.zero).dy
              ? SelenicPopoverPosition.bottom
              : SelenicPopoverPosition.top;
        case SelenicPopoverPosition.horizontal:
          popoverPosition = popoverTargetGlobalCenter.dx <
                  overlayRenderBox.size.center(Offset.zero).dx
              ? SelenicPopoverPosition.right
              : SelenicPopoverPosition.left;
        default:
          break;
      }
    }

    final _PopoverPositionProperties popoverPositionParameters =
        _resolvePopoverPositionParameters(
      popoverPosition: popoverPosition,
      distanceToTarget: effectiveDistanceToTarget,
      overlayWidth: overlayRenderBox.size.width,
      popoverTargetGlobalLeft: popoverTargetGlobalLeft.dx,
      popoverTargetGlobalCenter: popoverTargetGlobalCenter.dx,
      popoverTargetGlobalRight: popoverTargetGlobalRight.dx,
    );

    return Semantics(
      label: widget.semanticLabel,
      child: UnconstrainedBox(
        child: CompositedTransformFollower(
          link: _layerLink,
          showWhenUnlinked: false,
          offset: popoverPositionParameters.offset,
          followerAnchor: popoverPositionParameters.followerAnchor,
          targetAnchor: popoverPositionParameters.targetAnchor,
          child: TapRegion(
            groupId: _regionKey,
            behavior: HitTestBehavior.translucent,
            onTapOutside: (PointerDownEvent _) => _handleTapOutside(),
            child: RepaintBoundary(
              child: FadeTransition(
                opacity: _curvedAnimation!,
                child: IconTheme(
                  data: IconThemeData(color: effectiveIconColor),
                  child: DefaultTextStyle(
                    style: effectiveTextStyle.copyWith(
                      color: effectiveTextColor,
                    ),
                    child: Container(
                      constraints: BoxConstraints(
                        minHeight: widget.minHeight ?? 0,
                        minWidth: widget.minWidth ?? 0,
                        maxHeight: widget.maxHeight ?? double.infinity,
                        maxWidth: widget.maxWidth ??
                            popoverPositionParameters.popoverMaxWidth,
                      ),
                      padding: resolvedContentPadding,
                      decoration: widget.decoration ??
                          ShapeDecorationWithPremultipliedAlpha(
                            color: effectiveBackgroundColor,
                            shadows: effectivePopoverShadows,
                            shape: SelenicSquircleBorder(
                              borderRadius: effectiveBorderRadius
                                  .squircleBorderRadius(context),
                              side: BorderSide(
                                color: widget.borderColor,
                                width: widget.borderWidth,
                              ),
                            ),
                          ),
                      child: Directionality(
                        textDirection: Directionality.of(context),
                        child: widget.content,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final Duration effectiveTransitionDuration = widget.transitionDuration ??
        context.selenicTheme?.popoverTheme.properties.transitionDuration ??
        SelenicTransitions.transitions.defaultTransitionDuration;

    final Curve effectiveTransitionCurve = widget.transitionCurve ??
        context.selenicTheme?.popoverTheme.properties.transitionCurve ??
        SelenicTransitions.transitions.defaultTransitionCurve;

    _animationController ??= AnimationController(
      duration: effectiveTransitionDuration,
      vsync: this,
    );

    _curvedAnimation ??= CurvedAnimation(
      parent: _animationController!,
      curve: effectiveTransitionCurve,
    );

    return TapRegion(
      groupId: _regionKey,
      behavior: HitTestBehavior.translucent,
      child: CompositedTransformTarget(
        link: _layerLink,
        child: widget.child,
      ),
    );
  }
}

class _PopoverPositionProperties {
  final Alignment followerAnchor;
  final Alignment targetAnchor;
  final double popoverMaxWidth;
  final Offset offset;

  _PopoverPositionProperties({
    required this.followerAnchor,
    required this.targetAnchor,
    required this.popoverMaxWidth,
    required this.offset,
  });
}
