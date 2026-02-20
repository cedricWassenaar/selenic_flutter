import 'package:flutter/material.dart';
import 'package:selenic_design/src/theme/colors/colors.dart' show SelenicColors;

import 'package:selenic_design/src/theme/theme.dart';
import 'package:selenic_design/src/theme/tokens/borders.dart';
import 'package:selenic_design/src/theme/tokens/transitions.dart';
import 'package:selenic_design/src/theme/tokens/typography/typography.dart';
import 'package:selenic_design/src/utils/extensions.dart';
import 'package:selenic_design/src/utils/shape_decoration_premul.dart';
import 'package:selenic_design/src/utils/squircle/squircle_border.dart';

/// Displays a modal overlay over the app's current content, incorporating
/// entrance and exit animations, modal barrier color, and modal barrier
/// behavior, enabling dialog dismissal via barrier taps. Intended for use in
/// conjunction with [SelenicModal].
Future<T?> showSelenicModal<T>({
  bool barrierDismissible = true,
  bool useRootNavigator = true,
  bool useSafeArea = true,
  Color? barrierColor,
  Curve? transitionCurve,
  Duration? transitionDuration,
  Offset? anchorPoint,
  RouteSettings? routeSettings,
  String? barrierLabel = "Dismiss",
  required BuildContext context,
  required WidgetBuilder builder,
}) {
  assert(!barrierDismissible || barrierLabel != null);
  assert(_debugIsActive(context));

  final CapturedThemes themes = InheritedTheme.capture(
    from: context,
    to: Navigator.of(context, rootNavigator: useRootNavigator).context,
  );

  final Color effectiveBarrierColor = barrierColor ??
      context.selenicTheme?.modalTheme.colors.barrierColor ??
      SelenicColors.light.overlayModal;

  final Duration effectiveTransitionDuration = transitionDuration ??
      context.selenicTheme?.modalTheme.properties.transitionDuration ??
      SelenicTransitions.transitions.defaultTransitionDuration;

  final Curve effectiveTransitionCurve = transitionCurve ??
      context.selenicTheme?.modalTheme.properties.transitionCurve ??
      SelenicTransitions.transitions.defaultTransitionCurve;

  return Navigator.of(context, rootNavigator: useRootNavigator).push<T>(
    SelenicModalRoute<T>(
      context: context,
      builder: builder,
      barrierDismissible: barrierDismissible,
      barrierLabel: barrierLabel,
      barrierColor: effectiveBarrierColor,
      transitionDuration: effectiveTransitionDuration,
      transitionCurve: effectiveTransitionCurve,
      useSafeArea: useSafeArea,
      settings: routeSettings,
      anchorPoint: anchorPoint,
      themes: themes,
    ),
  );
}

bool _debugIsActive(BuildContext context) {
  if (context is Element && !context.debugIsActive) {
    throw FlutterError.fromParts(<DiagnosticsNode>[
      ErrorSummary('This BuildContext is no longer valid.'),
      ErrorDescription(
        'The showSelenicModal function context parameter is a BuildContext that is '
        'no longer valid.',
      ),
      ErrorHint(
        'This can commonly occur when the showSelenicModal function is called after '
        'awaiting a Future. In this situation the BuildContext might refer to a '
        'widget that has already been disposed during the await. Consider using '
        'a parent context instead.',
      ),
    ]);
  }

  return true;
}

class SelenicModalRoute<T> extends RawDialogRoute<T> {
  /// A Selenic Design modal route with entrance and exit animations, modal barrier
  /// color, and modal barrier behavior that allows dismissing the modal when
  /// tapped on the barrier.
  SelenicModalRoute({
    super.anchorPoint,
    required super.barrierColor,
    super.barrierDismissible,
    String? barrierLabel,
    super.settings,
    CapturedThemes? themes,
    required super.transitionDuration,
    required Curve transitionCurve,
    bool useSafeArea = true,
    required BuildContext context,
    required WidgetBuilder builder,
  }) : super(
          barrierLabel: barrierLabel ??
              MaterialLocalizations.of(context).modalBarrierDismissLabel,
          pageBuilder: (
            BuildContext buildContext,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) {
            final Widget pageChild = Builder(builder: builder);

            Widget modal = themes?.wrap(pageChild) ?? pageChild;

            if (useSafeArea) modal = SafeArea(child: modal);

            return modal;
          },
          transitionBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child,
          ) {
            return RepaintBoundary(
              child: FadeTransition(
                opacity: CurvedAnimation(
                  parent: animation,
                  curve: transitionCurve,
                ),
                child: child,
              ),
            );
          },
        );
}

class SelenicModal extends StatelessWidget {
  /// The border radius of the modal.
  final BorderRadiusGeometry? borderRadius;

  /// The background color of the modal.
  final Color? backgroundColor;

  /// The custom decoration of the modal.
  final Decoration? decoration;

  /// The semantic label for the modal.
  final String? semanticLabel;

  /// The widget to display inside the modal as its content.
  final Widget child;

  /// Creates a Selenic Design modal.
  const SelenicModal({
    super.key,
    this.borderRadius,
    this.backgroundColor,
    this.decoration,
    this.semanticLabel,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    final BorderRadiusGeometry effectiveBorderRadius = borderRadius ??
        context.selenicTheme?.modalTheme.properties.borderRadius ??
        SelenicBorders.borders.surfaceSm;

    final Color effectiveBackgroundColor = backgroundColor ??
        context.selenicTheme?.modalTheme.colors.backgroundColor ??
        SelenicColors.light.backgroundPrimary;

    final Color effectiveTextColor =
        context.selenicTheme?.modalTheme.colors.textColor ??
            SelenicColors.light.textPrimary;

    final Color effectiveIconColor =
        context.selenicTheme?.modalTheme.colors.iconColor ??
            SelenicColors.light.iconPrimary;

    final TextStyle effectiveTextStyle =
        context.selenicTheme?.modalTheme.properties.textStyle ??
            SelenicTypography.typography.body.textDefault;

    return Semantics(
      label: semanticLabel,
      child: IconTheme(
        data: IconThemeData(color: effectiveIconColor),
        child: DefaultTextStyle(
          style: effectiveTextStyle.copyWith(color: effectiveTextColor),
          child: Center(
            child: Container(
              decoration: decoration ??
                  ShapeDecorationWithPremultipliedAlpha(
                    color: effectiveBackgroundColor,
                    shape: SelenicSquircleBorder(
                      borderRadius:
                          effectiveBorderRadius.squircleBorderRadius(context),
                    ),
                  ),
              child: child,
            ),
          ),
        ),
      ),
    );
  }
}
