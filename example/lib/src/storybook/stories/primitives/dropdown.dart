import 'package:example/src/storybook/common/color_options.dart';
import 'package:example/src/storybook/common/widgets/text_divider.dart';
import 'package:flutter/material.dart';
import 'package:selenic_design/selenic_design.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

const String _groupId = "dropdown";

enum Choices {
  first,
  second,
  third;

  String get name {
    return switch (this) {
      Choices.first => "Choice #1",
      Choices.second => "Choice #2",
      Choices.third => "Choice #3",
    };
  }
}

class DropdownStory extends StatefulWidget {
  static const path = '/primitives/dropdown';

  const DropdownStory({super.key});

  @override
  State<DropdownStory> createState() => _DropdownStoryState();
}

class _DropdownStoryState extends State<DropdownStory> {
  final Map<Choices, bool> _availableChoices = {
    Choices.first: false,
    Choices.second: false,
    Choices.third: false,
  };

  bool _showChoices = false;
  bool _showMenu = false;
  bool _showMenuInner = false;
  Color? _buttonColor;
  String _buttonName = "accentPrimary";

  @override
  Widget build(BuildContext context) {
    final dropdownAnchorPositionKnob = context.knobs.nullable.options(
      label: "dropdownAnchorPosition",
      description:
          "Anchor position variants for SelenicDropdown on the child (target).",
      enabled: false,
      initial: SelenicDropdownAnchorPosition.bottom,
      options: const [
        Option(label: "top", value: SelenicDropdownAnchorPosition.top),
        Option(label: "bottom", value: SelenicDropdownAnchorPosition.bottom),
        Option(label: "left", value: SelenicDropdownAnchorPosition.left),
        Option(label: "right", value: SelenicDropdownAnchorPosition.right),
        Option(label: "topLeft", value: SelenicDropdownAnchorPosition.topLeft),
        Option(
            label: "topRight", value: SelenicDropdownAnchorPosition.topRight),
        Option(
          label: "bottomLeft",
          value: SelenicDropdownAnchorPosition.bottomLeft,
        ),
        Option(
          label: "bottomRight",
          value: SelenicDropdownAnchorPosition.bottomRight,
        ),
        Option(
            label: "vertical", value: SelenicDropdownAnchorPosition.vertical),
        Option(
          label: "horizontal",
          value: SelenicDropdownAnchorPosition.horizontal,
        ),
      ],
    );

    final backgroundColorKnob = context.knobs.nullable.options(
      label: "backgroundColor",
      description: "SelenicColors variants for SelenicDropdown background.",
      enabled: false,
      initial: 0,
      options: colorOptions,
    );

    final backgroundColor = colorTable(context)[backgroundColorKnob ?? 40];

    final borderColorKnob = context.knobs.nullable.options(
      label: "borderColor",
      description: "SelenicColors variants for SelenicDropdown border.",
      enabled: false,
      initial: 0,
      options: colorOptions,
    );

    final borderColor = colorTable(context)[borderColorKnob ?? 40];

    final borderRadiusKnob = context.knobs.nullable.sliderInt(
      label: "borderRadius",
      description: "Border radius for SelenicDropdown.",
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
      description: "Show shadows for SelenicDropdown.",
      initial: true,
    );

    final constrainWidthToChildKnob = context.knobs.boolean(
      label: "constrainWidthToChild",
      description:
          "Constrain the width of SelenicDropdown to be the same as the child (target).",
      initial: true,
    );

    // Used to avoid the stale closure within callbacks in Story.
    final accentPrimary = context.selenicColors!.accentPrimary;
    final accentSecondary = context.selenicColors!.warning;
    final colorSuccess = context.selenicColors!.success;
    final colorSuccess60 = context.selenicColors!.success_60;
    final colorSuccess10 = context.selenicColors!.success_10;

    final BorderRadiusGeometry? borderRadius = borderRadiusKnob != null
        ? BorderRadius.circular(
            borderRadiusKnob.toDouble(),
          )
        : null;

    return Center(
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 64.0, horizontal: 16.0),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const TextDivider(
                text: "SelenicDropdown with multiple choices",
                paddingTop: 0,
              ),
              SelenicDropdown(
                show: _showChoices,
                minWidth: 250,
                borderColor: borderColor ?? Colors.transparent,
                backgroundColor: backgroundColor,
                borderRadius: borderRadius,
                constrainWidthToChild: constrainWidthToChildKnob,
                distanceToTarget: distanceToTargetKnob,
                dropdownAnchorPosition: dropdownAnchorPositionKnob ??
                    SelenicDropdownAnchorPosition.bottom,
                dropdownShadows: showShadowKnob == true ? null : [],
                onTapOutside: () => setState(() => _showChoices = false),
                content: ClipRRect(
                  borderRadius: borderRadius ?? BorderRadius.zero,
                  child: Column(
                    children: List.generate(
                      3,
                      (int index) => SelenicMenuItem(
                        absorbGestures: true,
                        onTap: () => setState(
                          () => _availableChoices[Choices.values[index]] =
                              !_availableChoices[Choices.values[index]]!,
                        ),
                        label: Text(Choices.values[index].name),
                        trailing: SelenicCheckbox(
                          value: _availableChoices[Choices.values[index]],
                          tapAreaSizeValue: 0,
                          onChanged: (_) {},
                        ),
                      ),
                    ),
                  ),
                ),
                child: SelenicTextInput(
                  width: 270,
                  readOnly: true,
                  canRequestFocus: false,
                  mouseCursor: MouseCursor.defer,
                  hintText: "Choose an option",
                  onTap: () => setState(() => _showChoices = !_showChoices),
                  onTapOutside: (PointerDownEvent _) =>
                      FocusManager.instance.primaryFocus?.unfocus(),
                  leading: _availableChoices.values
                          .any((element) => element == true)
                      ? Center(
                          child: SelenicTag(
                            tagSize: SelenicTagSize.xs,
                            backgroundColor:
                                context.selenicColors!.bodyTextPrimary,
                            onTap: () => setState(
                              () => _availableChoices
                                  .updateAll((key, value) => false),
                            ),
                            label: Text(
                              "${_availableChoices.values.where((element) => element == true).length}",
                              style: TextStyle(
                                  color: context
                                      .selenicColors!.backgroundSecondary),
                            ),
                            trailing: Icon(
                              MoonIcons.controls_close_small_16_light,
                              color: context.selenicColors!.backgroundSecondary,
                            ),
                          ),
                        )
                      : null,
                  trailing: MouseRegion(
                    cursor: SystemMouseCursors.click,
                    child: Center(
                      child: AnimatedRotation(
                        duration: const Duration(milliseconds: 200),
                        turns: _showChoices ? -0.5 : 0,
                        child: const Icon(
                          MoonIcons.controls_chevron_down_16_light,
                          size: 16,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const TextDivider(text: "SelenicDropdown as a menu"),
              SelenicDropdown(
                show: _showMenu,
                groupId: _groupId,
                maxWidth: 250,
                borderColor: borderColor ?? Colors.transparent,
                backgroundColor: backgroundColor,
                constrainWidthToChild: constrainWidthToChildKnob,
                distanceToTarget: distanceToTargetKnob,
                dropdownAnchorPosition: dropdownAnchorPositionKnob ??
                    SelenicDropdownAnchorPosition.bottom,
                dropdownShadows: showShadowKnob == true ? null : [],
                onTapOutside: () => setState(() {
                  _showMenu = false;
                  _showMenuInner = false;
                }),
                content: Column(
                  children: [
                    SelenicMenuItem(
                      onTap: () => setState(() {
                        _showMenu = false;
                        _buttonName = "accentPrimary";
                        _buttonColor = accentPrimary;
                      }),
                      label: const Text("accentPrimary"),
                    ),
                    const SizedBox(height: 4),
                    SelenicMenuItem(
                      onTap: () => setState(() {
                        _showMenu = false;
                        _buttonName = "accentSecondary";
                        _buttonColor = accentSecondary;
                      }),
                      label: const Text("accentSecondary"),
                    ),
                    const SizedBox(height: 4),
                    SelenicDropdown(
                      show: _showMenuInner,
                      groupId: _groupId,
                      maxWidth: 100,
                      constrainWidthToChild: constrainWidthToChildKnob,
                      distanceToTarget: distanceToTargetKnob,
                      dropdownAnchorPosition: dropdownAnchorPositionKnob ??
                          SelenicDropdownAnchorPosition.bottom,
                      followerAnchor: dropdownAnchorPositionKnob == null
                          ? Alignment.topLeft
                          : null,
                      targetAnchor: dropdownAnchorPositionKnob == null
                          ? Alignment.topRight
                          : null,
                      offset: dropdownAnchorPositionKnob == null
                          ? const Offset(8, 0)
                          : null,
                      content: Column(
                        children: [
                          SelenicMenuItem(
                            onTap: () => setState(() {
                              _showMenu = false;
                              _showMenuInner = false;
                              _buttonName = "colorSuccess";
                              _buttonColor = colorSuccess;
                            }),
                            label: const Text("colorSuccess"),
                          ),
                          const SizedBox(height: 4),
                          SelenicMenuItem(
                            onTap: () => setState(() {
                              _showMenu = false;
                              _showMenuInner = false;
                              _buttonName = "colorSuccess60";
                              _buttonColor = colorSuccess60;
                            }),
                            label: const Text("colorSuccess60"),
                          ),
                          const SizedBox(height: 4),
                          SelenicMenuItem(
                            onTap: () => setState(() {
                              _showMenu = false;
                              _showMenuInner = false;
                              _buttonName = "colorSuccess10";
                              _buttonColor = colorSuccess10;
                            }),
                            label: const Text("colorSuccess10"),
                          ),
                        ],
                      ),
                      child: SelenicMenuItem(
                        backgroundColor: _showMenuInner
                            ? context.selenicColors!.hoverSecondary
                            : null,
                        onTap: () =>
                            setState(() => _showMenuInner = !_showMenuInner),
                        label: const Text("Success"),
                        trailing: const Icon(
                          MoonIcons.controls_chevron_right_16_light,
                          size: 16,
                        ),
                      ),
                    ),
                  ],
                ),
                child: SelenicFilledButton(
                  width: 128,
                  label: Text(_buttonName),
                  backgroundColor: _buttonColor,
                  onTap: () => setState(() => _showMenu = !_showMenu),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
