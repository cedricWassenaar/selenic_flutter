import 'package:example/src/storybook/common/color_options.dart';
import 'package:example/src/storybook/common/widgets/text_divider.dart';
import 'package:flutter/material.dart';
import 'package:selenic_design/selenic_design.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

class AlertStory extends StatefulWidget {
  static const path = '/primitives/alert';

  const AlertStory({super.key});

  @override
  State<AlertStory> createState() => _AlertStoryState();
}

class _AlertStoryState extends State<AlertStory> {
  bool _showAlert = true;

  @override
  Widget build(BuildContext context) {
    final leadingColorKnob = context.knobs.nullable.options(
      label: "Leading Color",
      description: "SelenicColors variants for SelenicAlert leading slot.",
      enabled: false,
      initial: 0,
      options: colorOptions,
    );

    final leadingColor = colorTable(context)[leadingColorKnob ?? 40];

    final labelColorKnob = context.knobs.nullable.options(
      label: "Label color",
      description: "SelenicColors variants for SelenicAlert label slot.",
      enabled: false,
      initial: 0,
      options: colorOptions,
    );

    final labelColor = colorTable(context)[labelColorKnob ?? 40];

    final trailingColorKnob = context.knobs.nullable.options(
      label: "Trailing color",
      description: "SelenicColors variants for SelenicAlert trailing slot.",
      enabled: false,
      initial: 0,
      options: colorOptions,
    );

    final trailingColor = colorTable(context)[trailingColorKnob ?? 40];

    final contentColorKnob = context.knobs.nullable.options(
      label: "Content color",
      description: "SelenicColors variants for SelenicAlert content slot.",
      enabled: false,
      initial: 0,
      options: colorOptions,
    );

    final contentColor = colorTable(context)[contentColorKnob ?? 40];

    final backgroundColorKnob = context.knobs.nullable.options(
      label: "backgroundColor",
      description: "SelenicColors variants for SelenicAlert background.",
      enabled: false,
      initial: 0,
      options: colorOptions,
    );

    final backgroundColor = colorTable(context)[backgroundColorKnob ?? 40];

    final borderColorKnob = context.knobs.nullable.options(
      label: "borderColor",
      description: "SelenicColors variants for SelenicAlert border.",
      enabled: false,
      initial: 0,
      options: colorOptions,
    );

    final borderColor = colorTable(context)[borderColorKnob ?? 40];

    final borderRadiusKnob = context.knobs.nullable.sliderInt(
      label: "borderRadius",
      description: "Border radius for SelenicAlert.",
      enabled: false,
      initial: 8,
      max: 32,
    );

    final showBorderKnob = context.knobs.boolean(
      label: "showBorder",
      description: "Show border for SelenicAlert.",
    );

    final showLeadingKnob = context.knobs.boolean(
      label: "leading",
      description: "Show widget in SelenicAlert leading slot.",
      initial: true,
    );

    final showContentKnob = context.knobs.boolean(
      label: "content",
      description: "Show widget in SelenicAlert content slot.",
    );

    final showTrailingKnob = context.knobs.boolean(
      label: "trailing",
      description: "Show widget in SelenicAlert trailing slot.",
      initial: true,
    );

    final showDisabledKnob = context.knobs.boolean(
      label: "Disabled",
      description: "SelenicAlert onTrailingTap() is null.",
    );

    final BorderRadiusGeometry? borderRadius = borderRadiusKnob != null
        ? BorderRadius.circular(borderRadiusKnob.toDouble())
        : null;

    return Center(
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 64, horizontal: 16),
        child: Column(
          children: [
            const TextDivider(
              text: "Base SelenicAlert",
              paddingTop: 0,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SelenicAlert(
                  show: _showAlert,
                  showBorder: showBorderKnob,
                  borderColor: borderColor,
                  backgroundColor: backgroundColor,
                  borderRadius: borderRadius,
                  leading: showLeadingKnob
                      ? Icon(
                          MoonIcons.other_frame_24_light,
                          color: leadingColor,
                        )
                      : null,
                  label: SizedBox(
                    height: 24,
                    child: Align(
                      alignment: AlignmentDirectional.centerStart,
                      child: Text(
                        "Base SelenicAlert",
                        style: TextStyle(color: labelColor),
                      ),
                    ),
                  ),
                  trailing: showTrailingKnob
                      ? SelenicButton.icon(
                          buttonSize: SelenicButtonSize.xs,
                          borderRadius: borderRadius,
                          disabledOpacityValue: 1,
                          icon: Icon(
                            MoonIcons.controls_close_small_24_light,
                            color: trailingColor,
                            size: 24,
                          ),
                          gap: 0,
                          onTap: showDisabledKnob
                              ? null
                              : () => setState(() => _showAlert = !_showAlert),
                        )
                      : null,
                  content: showContentKnob
                      ? SizedBox(
                          height: 24,
                          child: Align(
                            alignment: AlignmentDirectional.centerStart,
                            child: Text(
                              "Here goes SelenicAlert content",
                              style: TextStyle(color: contentColor),
                            ),
                          ),
                        )
                      : null,
                ),
                const SizedBox(height: 16),
                SelenicFilledButton(
                  label: const Text("Show/Hide SelenicAlert"),
                  backgroundColor: context.selenicColors!.accentPrimary,
                  onTap: () => setState(() => _showAlert = !_showAlert),
                ),
              ],
            ),
            const TextDivider(text: "Filled SelenicAlert variant"),
            SelenicAlert.filled(
              show: true,
              color: context.selenicColors!.error,
              backgroundColor: context.selenicColors!.error_10,
              borderRadius: borderRadius,
              leading: showLeadingKnob
                  ? const Icon(MoonIcons.notifications_alert_24_light)
                  : null,
              label: const Text("Filled error SelenicAlert"),
              trailing: SelenicButton.icon(
                buttonSize: SelenicButtonSize.xs,
                borderRadius: borderRadius,
                gap: 0,
                onTap: () {},
                icon: Icon(
                  MoonIcons.controls_close_small_24_light,
                  size: 24,
                  color: context.selenicColors!.error,
                ),
              ),
              content: showContentKnob
                  ? const SizedBox(
                      height: 24,
                      child: Align(
                        alignment: AlignmentDirectional.centerStart,
                        child: Text("Here goes SelenicAlert content"),
                      ),
                    )
                  : null,
            ),
            const SizedBox(height: 16),
            SelenicAlert.filled(
              show: true,
              color: context.selenicColors!.warning,
              backgroundColor: context.selenicColors!.warning_10,
              borderRadius: borderRadius,
              leading: showLeadingKnob
                  ? const Icon(MoonIcons.generic_alarm_round_24_light)
                  : null,
              label: const Text("Filled warning SelenicAlert"),
              trailing: SelenicButton.icon(
                buttonSize: SelenicButtonSize.xs,
                borderRadius: borderRadius,
                gap: 0,
                onTap: () {},
                icon: Icon(
                  MoonIcons.controls_close_small_24_light,
                  size: 24,
                  color: context.selenicColors!.warning,
                ),
              ),
              content: showContentKnob
                  ? const SizedBox(
                      height: 24,
                      child: Align(
                        alignment: AlignmentDirectional.centerStart,
                        child: Text("Here goes SelenicAlert content"),
                      ),
                    )
                  : null,
            ),
            const TextDivider(text: "Outlined SelenicAlert variant"),
            SelenicAlert.outlined(
              show: true,
              color: context.selenicColors!.success,
              borderColor: context.selenicColors!.success,
              borderRadius: borderRadius,
              leading: showLeadingKnob
                  ? const Icon(MoonIcons.generic_check_rounded_24_light)
                  : null,
              label: const Text("Outlined success SelenicAlert"),
              trailing: SelenicButton.icon(
                buttonSize: SelenicButtonSize.xs,
                borderRadius: borderRadius,
                gap: 0,
                onTap: () {},
                icon: Icon(
                  MoonIcons.controls_close_small_24_light,
                  size: 24,
                  color: context.selenicColors!.success,
                ),
              ),
              content: showContentKnob
                  ? const SizedBox(
                      height: 24,
                      child: Align(
                        alignment: AlignmentDirectional.centerStart,
                        child: Text("Here goes SelenicAlert content"),
                      ),
                    )
                  : null,
            ),
            const SizedBox(height: 16),
            SelenicAlert.outlined(
              show: true,
              color: context.selenicColors!.supportive_6,
              borderColor: context.selenicColors!.supportive_6,
              borderRadius: borderRadius,
              leading: showLeadingKnob
                  ? const Icon(MoonIcons.notifications_alert_24_light)
                  : null,
              label: const Text('Outlined info SelenicAlert'),
              trailing: SelenicButton.icon(
                buttonSize: SelenicButtonSize.xs,
                borderRadius: borderRadius,
                gap: 0,
                onTap: () {},
                icon: Icon(
                  MoonIcons.controls_close_small_24_light,
                  size: 24,
                  color: context.selenicColors!.supportive_6,
                ),
              ),
              content: showContentKnob
                  ? const SizedBox(
                      height: 24,
                      child: Align(
                        alignment: AlignmentDirectional.centerStart,
                        child: Text("Here goes SelenicAlert content"),
                      ),
                    )
                  : null,
            ),
          ],
        ),
      ),
    );
  }
}
