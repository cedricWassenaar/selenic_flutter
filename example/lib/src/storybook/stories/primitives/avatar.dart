import 'package:example/src/storybook/common/color_options.dart';
import 'package:example/src/storybook/common/widgets/text_divider.dart';
import 'package:flutter/material.dart';
import 'package:selenic_design/selenic_design.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

class AvatarStory extends StatelessWidget {
  static const path = '/primitives/avatar';

  const AvatarStory({super.key});

  @override
  Widget build(BuildContext context) {
    final customLabelTextKnob = context.knobs.text(
      label: "Content text",
      initial: "MD",
    );

    final avatarSizeKnob = context.knobs.nullable.options(
      label: "avatarSize",
      description: "Size variants for SelenicAvatar.",
      enabled: false,
      initial: SelenicAvatarSize.md,
      options: const [
        Option(label: "xs", value: SelenicAvatarSize.xs),
        Option(label: "sm", value: SelenicAvatarSize.sm),
        Option(label: "md", value: SelenicAvatarSize.md),
        Option(label: "lg", value: SelenicAvatarSize.lg),
        Option(label: "xl", value: SelenicAvatarSize.xl),
        Option(label: "x2l", value: SelenicAvatarSize.x2l),
      ],
    );

    final avatarTextColorKnob = context.knobs.nullable.options(
      label: "textColor",
      description: "SelenicColors variants for SelenicAvatar text.",
      enabled: false,
      initial: 0,
      options: colorOptions,
    );

    final textColor = colorTable(context)[avatarTextColorKnob ?? 40];

    final avatarBackgroundColorKnob = context.knobs.nullable.options(
      label: "backgroundColor",
      description: "SelenicColors variants for SelenicAvatar background.",
      enabled: false,
      initial: 0,
      options: colorOptions,
    );

    final backgroundColor =
        colorTable(context)[avatarBackgroundColorKnob ?? 40];

    final badgeColorKnob = context.knobs.nullable.options(
      label: "badgeColor",
      description: "SelenicColors variants for SelenicAvatar badge.",
      enabled: false,
      initial: 0,
      options: colorOptions,
    );

    final badgeColor = colorTable(context)[badgeColorKnob ?? 40];

    final avatarBadgeAlignmentKnob = context.knobs.nullable.options(
      label: "badgeAlignment",
      description: "Badge alignment for SelenicAvatar.",
      enabled: false,
      initial: SelenicBadgeAlignment.bottomRight,
      options: const [
        Option(label: "topLeft", value: SelenicBadgeAlignment.topLeft),
        Option(label: "topRight", value: SelenicBadgeAlignment.topRight),
        Option(label: "bottomLeft", value: SelenicBadgeAlignment.bottomLeft),
        Option(label: "bottomRight", value: SelenicBadgeAlignment.bottomRight),
      ],
    );

    final borderRadiusKnob = context.knobs.nullable.sliderInt(
      label: "borderRadius",
      description: "Border radius for SelenicAvatar.",
      enabled: false,
      initial: 8,
      max: 32,
    );

    final badgeMarginKnob = context.knobs.nullable.sliderInt(
      label: "badgeMarginValue",
      description: "Badge margin value for SelenicAvatar.",
      enabled: false,
      initial: 4,
      max: 8,
    );

    final badgeSizeKnob = context.knobs.nullable.sliderInt(
      label: "badgeSize",
      description: "Badge size for SelenicAvatar.",
      enabled: false,
      initial: 8,
      max: 16,
    );

    final showBadgeKnob = context.knobs.boolean(
      label: "showBadge",
      description: "Show SelenicAvatar badge.",
      initial: true,
    );

    return Center(
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 64.0, horizontal: 16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const TextDivider(
              text: "SelenicAvatar",
              paddingTop: 0,
            ),
            SelenicAvatar(
              avatarSize: avatarSizeKnob,
              badgeSize: badgeSizeKnob?.toDouble(),
              borderRadius: borderRadiusKnob != null
                  ? BorderRadius.circular(borderRadiusKnob.toDouble())
                  : null,
              badgeMarginValue: badgeMarginKnob?.toDouble(),
              backgroundColor: backgroundColor,
              showBadge: showBadgeKnob,
              badgeColor: badgeColor,
              badgeAlignment:
                  avatarBadgeAlignmentKnob ?? SelenicBadgeAlignment.bottomRight,
              content: Padding(
                padding: const EdgeInsets.only(top: 1.0),
                child: Text(
                  customLabelTextKnob,
                  style: TextStyle(color: textColor),
                ),
              ),
            ),
            const TextDivider(
                text: "Custom SelenicAvatar with image background"),
            SelenicAvatar(
              avatarSize: avatarSizeKnob,
              badgeSize: badgeSizeKnob?.toDouble(),
              borderRadius: borderRadiusKnob != null
                  ? BorderRadius.circular(borderRadiusKnob.toDouble())
                  : null,
              badgeMarginValue: badgeMarginKnob?.toDouble(),
              backgroundColor: backgroundColor,
              showBadge: showBadgeKnob,
              badgeColor: badgeColor,
              badgeAlignment:
                  avatarBadgeAlignmentKnob ?? SelenicBadgeAlignment.bottomRight,
              backgroundImage:
                  const AssetImage("assets/images/placeholder-640x359.png"),
            ),
          ],
        ),
      ),
    );
  }
}
