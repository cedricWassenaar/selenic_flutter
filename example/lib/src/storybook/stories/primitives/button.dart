import 'package:example/src/storybook/common/color_options.dart';
import 'package:example/src/storybook/common/widgets/text_divider.dart';
import 'package:flutter/material.dart';
import 'package:selenic_design/selenic_design.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

class ButtonStory extends StatelessWidget {
  static const path = '/primitives/button';

  const ButtonStory({super.key});

  @override
  Widget build(BuildContext context) {
    final customLabelTextKnob = context.knobs.text(
      label: "Label text",
      initial: "SelenicButton",
    );

    final buttonSizeKnob = context.knobs.nullable.options(
      label: "buttonSize",
      description: "Size variants for SelenicButton.",
      enabled: false,
      initial: SelenicButtonSize.md,
      options: const [
        Option(label: "xs", value: SelenicButtonSize.xs),
        Option(label: "sm", value: SelenicButtonSize.sm),
        Option(label: "md", value: SelenicButtonSize.md),
        Option(label: "lg", value: SelenicButtonSize.lg),
        Option(label: "xl", value: SelenicButtonSize.xl),
      ],
    );

    final backgroundColorKnob = context.knobs.nullable.options(
      label: "backgroundColor",
      description: "SelenicColors variants for base SelenicButton background.",
      enabled: false,
      initial: 0,
      options: colorOptions,
    );

    final backgroundColor = colorTable(context)[backgroundColorKnob ?? 40];

    final borderColorKnob = context.knobs.nullable.options(
      label: "borderColor",
      description: "SelenicColors variants for SelenicButton border.",
      enabled: false,
      initial: 0,
      options: colorOptions,
    );

    final borderColor = colorTable(context)[borderColorKnob ?? 40];

    final textColorKnob = context.knobs.nullable.options(
      label: "textColor",
      description: "SelenicColors variants for SelenicButton text.",
      enabled: false,
      initial: 0,
      options: colorOptions,
    );

    final textColor = colorTable(context)[textColorKnob ?? 40];

    final borderRadiusKnob = context.knobs.nullable.sliderInt(
      label: "borderRadius",
      description: "Border radius for base SelenicButton.",
      enabled: false,
      initial: 8,
      max: 32,
    );

    final showBorderKnob = context.knobs.boolean(
      label: "showBorder",
      description: "Show border for base SelenicButton.",
      initial: true,
    );

    final showPulseEffectKnob = context.knobs.boolean(
      label: "showPulseEffect",
      description: "Show pulse animation.",
    );

    final showPulseEffectJiggleKnob = context.knobs.boolean(
      label: "showPulseEffectJiggle",
      description: "Show jiggling with pulse animation.",
    );

    final showLeadingKnob = context.knobs.boolean(
      label: "leading",
      description: "Show widget in SelenicButton leading slot.",
      initial: true,
    );

    final showLabelKnob = context.knobs.boolean(
      label: "label",
      description: "Show widget in SelenicButton label slot.",
      initial: true,
    );

    final showTrailingKnob = context.knobs.boolean(
      label: "trailing",
      description: "Show widget in SelenicButton trailing slot.",
    );

    final setFullWidthKnob = context.knobs.boolean(
      label: "isFullWidth",
      description: "Set SelenicButton to full width.",
    );

    final isDisabledKnob = context.knobs.boolean(
      label: "Disabled",
      description: "SelenicButton onTap() or onLongPress() is null.",
    );

    IconData resolveIconVariant(SelenicButtonSize? buttonSize) {
      switch (buttonSize) {
        case SelenicButtonSize.xs:
          return MoonIcons.other_frame_16_light;
        case SelenicButtonSize.sm:
          return MoonIcons.other_frame_24_light;
        case SelenicButtonSize.md:
          return MoonIcons.other_frame_24_light;
        case SelenicButtonSize.lg:
          return MoonIcons.other_frame_24_light;
        case SelenicButtonSize.xl:
          return MoonIcons.other_frame_24_light;
        default:
          return MoonIcons.other_frame_24_light;
      }
    }

    final IconData resolvedIconVariant = resolveIconVariant(buttonSizeKnob);

    final BorderRadiusGeometry? borderRadius = borderRadiusKnob != null
        ? BorderRadius.circular(borderRadiusKnob.toDouble())
        : null;

    return Center(
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 64.0, horizontal: 16.0),
        child: Column(
          children: [
            const TextDivider(
              text: "Base and icon SelenicButton",
              paddingTop: 0,
            ),
            SelenicButton(
              onTap: isDisabledKnob ? null : () {},
              borderRadius: borderRadius,
              showBorder: showBorderKnob,
              buttonSize: buttonSizeKnob,
              isFullWidth: setFullWidthKnob,
              backgroundColor: backgroundColor,
              borderColor: borderColor,
              textColor: textColor,
              showPulseEffect: showPulseEffectKnob,
              showPulseEffectJiggle: showPulseEffectJiggleKnob,
              leading: showLeadingKnob ? Icon(resolvedIconVariant) : null,
              label: showLabelKnob ? Text(customLabelTextKnob) : null,
              trailing: showTrailingKnob ? Icon(resolvedIconVariant) : null,
            ),
            const SizedBox(height: 32),
            SelenicButton.icon(
              onTap: isDisabledKnob ? null : () {},
              borderRadius: borderRadius,
              showBorder: showBorderKnob,
              buttonSize: buttonSizeKnob,
              backgroundColor: backgroundColor,
              iconColor: textColor,
              borderColor: borderColor,
              showPulseEffect: showPulseEffectKnob,
              showPulseEffectJiggle: showPulseEffectJiggleKnob,
              icon: showLeadingKnob ? Icon(resolvedIconVariant) : null,
            ),
            const TextDivider(text: "SelenicButton variants"),
            SelenicFilledButton(
              onTap: isDisabledKnob ? null : () {},
              buttonSize: buttonSizeKnob,
              isFullWidth: setFullWidthKnob,
              showPulseEffect: showPulseEffectKnob,
              leading: showLeadingKnob ? Icon(resolvedIconVariant) : null,
              label: showLabelKnob ? const Text("SelenicFilledButton") : null,
              trailing: showTrailingKnob ? Icon(resolvedIconVariant) : null,
            ),
            const SizedBox(height: 32),
            SelenicOutlinedButton(
              onTap: isDisabledKnob ? null : () {},
              buttonSize: buttonSizeKnob,
              isFullWidth: setFullWidthKnob,
              showPulseEffect: showPulseEffectKnob,
              borderColor: borderColor,
              leading: showLeadingKnob ? Icon(resolvedIconVariant) : null,
              label: showLabelKnob ? const Text("SelenicOutlinedButton") : null,
              trailing: showTrailingKnob ? Icon(resolvedIconVariant) : null,
            ),
            const SizedBox(height: 32),
            SelenicTextButton(
              onTap: isDisabledKnob ? null : () {},
              buttonSize: buttonSizeKnob,
              isFullWidth: setFullWidthKnob,
              showPulseEffect: showPulseEffectKnob,
              leading: showLeadingKnob ? Icon(resolvedIconVariant) : null,
              label: showLabelKnob ? const Text("SelenicTextButton") : null,
              trailing: showTrailingKnob ? Icon(resolvedIconVariant) : null,
            ),
            const TextDivider(
              text: "Custom SelenicButtons with non-standard children",
            ),
            SelenicButton(
              onTap: isDisabledKnob ? null : () {},
              height: 40,
              padding: const EdgeInsets.symmetric(horizontal: 8),
              showFocusEffect: false,
              decoration: const ShapeDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/placeholder-640x359.png"),
                  fit: BoxFit.cover,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  ),
                ),
              ),
              leading: Container(
                width: 24,
                height: 24,
                padding: const EdgeInsets.all(4),
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  color: context.selenicColors!.outlinedButton,
                ),
              ),
            ),
            const SizedBox(height: 32),
            SelenicButton(
              onTap: isDisabledKnob ? null : () {},
              height: 72,
              padding: const EdgeInsets.symmetric(horizontal: 8),
              showFocusEffect: false,
              decoration: ShapeDecorationWithPremultipliedAlpha(
                shadows: const [
                  BoxShadow(
                    blurRadius: 3,
                    offset: Offset(0, 2),
                  ),
                ],
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    context.selenicColors!.warning,
                    context.selenicColors!.supportive_2,
                  ],
                ),
                shape: const StarBorder(
                  pointRounding: 0.5,
                  valleyRounding: 0.5,
                ),
              ),
              label: SizedBox(
                width: 32,
                height: 32,
                child: CircleAvatar(
                  backgroundColor: context.selenicColors!.supportive_1_60,
                  child: const Icon(
                    MoonIcons.other_rocket_24_light,
                    size: 24,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
