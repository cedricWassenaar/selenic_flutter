import 'package:example/src/storybook/common/color_options.dart';
import 'package:flutter/material.dart';
import 'package:selenic_design/selenic_design.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

class PopoverStory extends StatefulWidget {
  static const path = '/primitives/popover';

  const PopoverStory({super.key});

  @override
  State<PopoverStory> createState() => _PopoverStoryState();
}

class _PopoverStoryState extends State<PopoverStory> {
  bool show = false;

  @override
  Widget build(BuildContext context) {
    final customLabelTextKnob = context.knobs.text(
      label: "Label text",
      initial: "Custom SelenicPopover text",
    );

    final popoverPositionKnob = context.knobs.nullable.options(
      label: "popoverPosition",
      description: "Position variants for SelenicPopover.",
      enabled: false,
      initial: SelenicPopoverPosition.top,
      options: const [
        Option(label: "top", value: SelenicPopoverPosition.top),
        Option(label: "bottom", value: SelenicPopoverPosition.bottom),
        Option(label: "left", value: SelenicPopoverPosition.left),
        Option(label: "right", value: SelenicPopoverPosition.right),
        Option(label: "topLeft", value: SelenicPopoverPosition.topLeft),
        Option(label: "topRight", value: SelenicPopoverPosition.topRight),
        Option(label: "bottomLeft", value: SelenicPopoverPosition.bottomLeft),
        Option(label: "bottomRight", value: SelenicPopoverPosition.bottomRight),
        Option(label: "vertical", value: SelenicPopoverPosition.vertical),
        Option(label: "horizontal", value: SelenicPopoverPosition.horizontal),
      ],
    );

    final backgroundColorKnob = context.knobs.nullable.options(
      label: "backgroundColor",
      description: "MoonColors variants for SelenicPopover background.",
      enabled: false,
      initial: 0,
      // piccolo
      options: colorOptions,
    );

    final backgroundColor = colorTable(context)[backgroundColorKnob ?? 40];

    final borderColorKnob = context.knobs.nullable.options(
      label: "borderColor",
      description: "MoonColors variants for SelenicPopover border.",
      enabled: false,
      initial: 0,
      // piccolo
      options: colorOptions,
    );

    final borderColor = colorTable(context)[borderColorKnob ?? 40];

    final borderRadiusKnob = context.knobs.nullable.sliderInt(
      label: "borderRadius",
      description: "Border radius for SelenicPopover.",
      enabled: false,
      initial: 8,
      max: 32,
    );

    final distanceToTargetKnob = context.knobs.nullable.slider(
      label: "distanceToTarget",
      description: "Distance to target child widget.",
      enabled: false,
      initial: 8,
      max: 100,
    );

    final showShadowKnob = context.knobs.boolean(
      label: "Show shadow",
      description: "Show shadows for SelenicPopover.",
      initial: true,
    );

    return Center(
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 64.0, horizontal: 16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SelenicPopover(
              show: show,
              borderColor: borderColor ?? Colors.transparent,
              backgroundColor: backgroundColor,
              borderRadius: borderRadiusKnob != null
                  ? BorderRadius.circular(borderRadiusKnob.toDouble())
                  : null,
              distanceToTarget: distanceToTargetKnob,
              popoverPosition:
                  popoverPositionKnob ?? SelenicPopoverPosition.top,
              popoverShadows: showShadowKnob == true ? null : [],
              onTapOutside: () => setState(() => show = false),
              content: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 190),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SelenicAvatar(
                          backgroundColor: context.selenicColors?.heles,
                          content: const Icon(MoonIcons.other_rocket_24_light),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Text(customLabelTextKnob),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    SelenicFilledButton(
                      buttonSize: SelenicButtonSize.sm,
                      isFullWidth: true,
                      onTap: () => setState(() => show = false),
                      label: const Text("Close"),
                    ),
                  ],
                ),
              ),
              child: SelenicFilledButton(
                onTap: () => setState(() => show = !show),
                label: const Text("Tap me"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
