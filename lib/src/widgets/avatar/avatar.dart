import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:selenic_design/src/theme/avatar/avatar_size_properties.dart';
import 'package:selenic_design/src/theme/avatar/avatar_sizes.dart';
import 'package:selenic_design/src/theme/colors/colors.dart' show SelenicColors;
import 'package:selenic_design/src/theme/theme.dart';
import 'package:selenic_design/src/theme/tokens/tokens.dart';
import 'package:selenic_design/src/utils/extensions.dart';
import 'package:selenic_design/src/utils/shape_decoration_premul.dart';
import 'package:selenic_design/src/utils/squircle/squircle_border.dart';
import 'package:selenic_design/src/widgets/avatar/avatar_clipper.dart';

enum SelenicAvatarSize {
  xs,
  sm,
  md,
  lg,
  xl,
  x2l,
}

enum SelenicBadgeAlignment {
  topLeft,
  topRight,
  bottomLeft,
  bottomRight,
}

class SelenicAvatar extends StatelessWidget {
  /// Whether to show the avatar badge.
  final bool showBadge;

  /// The border radius of the avatar.
  final BorderRadiusGeometry? borderRadius;

  /// The background color of the avatar.
  final Color? backgroundColor;

  /// The color of the avatar badge.
  final Color? badgeColor;

  /// The margin value of the avatar badge.
  final double? badgeMarginValue;

  /// The size of the avatar badge.
  final double? badgeSize;

  /// The height of the avatar.
  final double? height;

  /// The width of the avatar.
  final double? width;

  /// The background image of the avatar.
  final ImageProvider<Object>? backgroundImage;

  /// The size of the avatar.
  final SelenicAvatarSize? avatarSize;

  /// The alignment of the avatar badge.
  final SelenicBadgeAlignment badgeAlignment;

  /// The semantic label for the avatar.
  final String? semanticLabel;

  /// The widget to display within the avatar.
  final Widget? content;

  /// Creates a Selenic Design avatar.
  const SelenicAvatar({
    super.key,
    this.showBadge = false,
    this.borderRadius,
    this.backgroundColor,
    this.badgeColor,
    this.badgeMarginValue,
    this.badgeSize,
    this.height,
    this.width,
    this.backgroundImage,
    this.avatarSize,
    this.badgeAlignment = SelenicBadgeAlignment.bottomRight,
    this.semanticLabel,
    this.content,
  });

  Alignment _avatarAlignmentMapper(BuildContext context) {
    final bool isRTL = Directionality.of(context) == TextDirection.rtl;

    if (isRTL) {
      switch (badgeAlignment) {
        case SelenicBadgeAlignment.topLeft:
          return Alignment.topRight;
        case SelenicBadgeAlignment.topRight:
          return Alignment.topLeft;
        case SelenicBadgeAlignment.bottomLeft:
          return Alignment.bottomRight;
        case SelenicBadgeAlignment.bottomRight:
          return Alignment.bottomLeft;
      }
    } else {
      switch (badgeAlignment) {
        case SelenicBadgeAlignment.topLeft:
          return Alignment.topLeft;
        case SelenicBadgeAlignment.topRight:
          return Alignment.topRight;
        case SelenicBadgeAlignment.bottomLeft:
          return Alignment.bottomLeft;
        case SelenicBadgeAlignment.bottomRight:
          return Alignment.bottomRight;
      }
    }
  }

  SelenicAvatarSizeProperties _getSelenicAvatarSize(
    BuildContext context,
    SelenicAvatarSize? avatarSize,
  ) {
    switch (avatarSize) {
      case SelenicAvatarSize.xs:
        return context.selenicTheme?.avatarTheme.sizes.xs ??
            SelenicAvatarSizes(tokens: SelenicTokens.light).xs;
      case SelenicAvatarSize.sm:
        return context.selenicTheme?.avatarTheme.sizes.sm ??
            SelenicAvatarSizes(tokens: SelenicTokens.light).sm;
      case SelenicAvatarSize.md:
        return context.selenicTheme?.avatarTheme.sizes.md ??
            SelenicAvatarSizes(tokens: SelenicTokens.light).md;
      case SelenicAvatarSize.lg:
        return context.selenicTheme?.avatarTheme.sizes.lg ??
            SelenicAvatarSizes(tokens: SelenicTokens.light).lg;
      case SelenicAvatarSize.xl:
        return context.selenicTheme?.avatarTheme.sizes.xl ??
            SelenicAvatarSizes(tokens: SelenicTokens.light).xl;
      case SelenicAvatarSize.x2l:
        return context.selenicTheme?.avatarTheme.sizes.x2l ??
            SelenicAvatarSizes(tokens: SelenicTokens.light).x2l;
      default:
        return context.selenicTheme?.avatarTheme.sizes.md ??
            SelenicAvatarSizes(tokens: SelenicTokens.light).md;
    }
  }

  @override
  Widget build(BuildContext context) {
    final SelenicAvatarSizeProperties effectiveSelenicAvatarSize =
        _getSelenicAvatarSize(context, avatarSize);

    final BorderRadiusGeometry effectiveBorderRadius =
        borderRadius ?? effectiveSelenicAvatarSize.borderRadius;

    final resolvedBorderRadius =
        effectiveBorderRadius.resolve(Directionality.of(context));

    final Color effectiveBackgroundColor = backgroundColor ??
        context.selenicTheme?.avatarTheme.colors.backgroundColor ??
        SelenicColors.light.backgroundPrimary;

    final Color effectiveBadgeColor = badgeColor ??
        context.selenicTheme?.avatarTheme.colors.badgeColor ??
        SelenicColors.light.success;

    final Color effectiveTextColor =
        context.selenicTheme?.avatarTheme.colors.textColor ??
            SelenicColors.light.textPrimary;

    final Color effectiveIconColor =
        context.selenicTheme?.avatarTheme.colors.iconColor ??
            SelenicColors.light.iconPrimary;

    final double effectiveAvatarHeight =
        height ?? effectiveSelenicAvatarSize.avatarSizeValue;

    final double effectiveAvatarWidth =
        width ?? effectiveSelenicAvatarSize.avatarSizeValue;

    final double effectiveBadgeMarginValue =
        badgeMarginValue ?? effectiveSelenicAvatarSize.badgeMarginValue;

    final double effectiveBadgeSize =
        badgeSize ?? effectiveSelenicAvatarSize.badgeSizeValue;

    return Semantics(
      label: semanticLabel,
      button: false,
      focusable: false,
      image: backgroundImage != null,
      child: SizedBox(
        width: effectiveAvatarWidth,
        height: effectiveAvatarHeight,
        child: Stack(
          children: [
            Positioned.fill(
              child: ClipPath(
                // TODO: Since clipper does not work properly on mobile web/PWA,
                //  we are disabling it. Remove this check when it has been
                //  fixed from Flutter side.
                clipper: kIsWeb &&
                        MediaQueryData.fromView(View.of(context)).size.width <
                            500
                    ? null
                    : AvatarClipper(
                        showBadge: showBadge,
                        width: effectiveAvatarWidth,
                        height: effectiveAvatarHeight,
                        borderRadius: resolvedBorderRadius,
                        badgeSize: effectiveBadgeSize,
                        badgeMarginValue: effectiveBadgeMarginValue,
                        badgeAlignment: badgeAlignment,
                        textDirection: Directionality.of(context),
                      ),
                child: DefaultTextStyle(
                  style: effectiveSelenicAvatarSize.textStyle
                      .copyWith(color: effectiveTextColor),
                  child: IconTheme(
                    data: IconThemeData(
                      color: effectiveIconColor,
                    ),
                    child: DecoratedBox(
                      decoration: ShapeDecorationWithPremultipliedAlpha(
                        color: effectiveBackgroundColor,
                        image: backgroundImage != null
                            ? DecorationImage(
                                image: backgroundImage!,
                                fit: BoxFit.cover,
                              )
                            : null,
                        shape: SelenicSquircleBorder(
                          borderRadius: resolvedBorderRadius
                              .squircleBorderRadius(context),
                        ),
                      ),
                      child: Center(child: content),
                    ),
                  ),
                ),
              ),
            ),
            if (showBadge)
              Align(
                alignment: _avatarAlignmentMapper(context),
                child: Container(
                  height: effectiveBadgeSize,
                  width: effectiveBadgeSize,
                  decoration: BoxDecoration(
                    color: effectiveBadgeColor,
                    borderRadius: BorderRadius.circular(effectiveBadgeSize / 2),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
