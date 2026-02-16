import 'package:example/src/storybook/common/color_options.dart';
import 'package:example/src/storybook/common/widgets/text_divider.dart';
import 'package:flutter/material.dart';
import 'package:selenic_design/selenic_design.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

enum MenuItem { first, second }

class MenuItemStory extends StatefulWidget {
  static const path = '/primitives/menu_item';

  const MenuItemStory({super.key});

  @override
  State<MenuItemStory> createState() => _MenuItemStoryState();
}

class _MenuItemStoryState extends State<MenuItemStory> {
  MenuItem currentlySelectedMenuItem = MenuItem.first;

  bool? checkboxIsSelected = false;
  bool switchIsSelected = false;

  @override
  Widget build(BuildContext context) {
    final leadingColorKnob = context.knobs.nullable.options(
      label: "Leading color",
      description: "MoonColors variants for SelenicMenuItem leading slot.",
      enabled: false,
      initial: 0,
      // piccolo
      options: colorOptions,
    );

    final leadingColor = colorTable(context)[leadingColorKnob ?? 40];

    final labelColorKnob = context.knobs.nullable.options(
      label: "Label color",
      description: "MoonColors variants for SelenicMenuItem label slot.",
      enabled: false,
      initial: 0,
      // piccolo
      options: colorOptions,
    );

    final labelTextColor = colorTable(context)[labelColorKnob ?? 40];

    final contentTextColorKnob = context.knobs.nullable.options(
      label: "Content color",
      description: "MoonColors variants for SelenicMenuItem content slot.",
      enabled: false,
      initial: 0,
      // piccolo
      options: colorOptions,
    );

    final contentTextColor = colorTable(context)[contentTextColorKnob ?? 40];

    final trailingColorKnob = context.knobs.nullable.options(
      label: "Trailing color",
      description: "MoonColors variants for SelenicMenuItem trailing slot.",
      enabled: false,
      initial: 0,
      // piccolo
      options: colorOptions,
    );

    final trailingColor = colorTable(context)[trailingColorKnob ?? 40];

    final backgroundColorKnob = context.knobs.nullable.options(
      label: "backgroundColor",
      description: "MoonColors variants for SelenicMenuItem background.",
      enabled: false,
      initial: 0,
      // piccolo
      options: colorOptions,
    );

    final backgroundColor = colorTable(context)[backgroundColorKnob ?? 40];

    final menuItemCrossAxisAlignmentKnob = context.knobs.nullable.options(
      label: "menuItemCrossAxisAlignment",
      description: "CrossAxisAlignment variants for SelenicMenuItem.",
      enabled: false,
      initial: CrossAxisAlignment.center,
      options: [
        Option(
          label: CrossAxisAlignment.start.name,
          value: CrossAxisAlignment.start,
        ),
        Option(
          label: CrossAxisAlignment.center.name,
          value: CrossAxisAlignment.center,
        ),
        Option(
          label: CrossAxisAlignment.end.name,
          value: CrossAxisAlignment.end,
        ),
      ],
    );

    final borderRadiusKnob = context.knobs.nullable.sliderInt(
      label: "borderRadius",
      description: "Border radius for SelenicMenuItem.",
      enabled: false,
      initial: 8,
      max: 32,
    );

    final showLeadingKnob = context.knobs.boolean(
      label: "leading",
      description: "Show widget in SelenicMenuItem leading slot.",
      initial: true,
    );

    final showContentKnob = context.knobs.boolean(
      label: "content",
      description: "Show widget in SelenicMenuItem content slot.",
      initial: true,
    );

    final showTrailingKnob = context.knobs.boolean(
      label: "trailing",
      description: "Show widget in SelenicMenuItem trailing slot.",
      initial: true,
    );

    final isDisabledKnob = context.knobs.boolean(
      label: "Disabled",
      description: "SelenicMenuItem onTap() is null.",
    );

    final BorderRadiusGeometry? borderRadius = borderRadiusKnob != null
        ? BorderRadius.circular(borderRadiusKnob.toDouble())
        : null;

    return Center(
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 64.0, horizontal: 16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const TextDivider(
              text: "SelenicMenuItem",
              paddingTop: 0,
            ),
            SelenicMenuItem(
              borderRadius: borderRadius,
              backgroundColor: backgroundColor,
              menuItemCrossAxisAlignment: menuItemCrossAxisAlignmentKnob,
              onTap: isDisabledKnob ? null : () {},
              label: Text(
                "Multi-line menu item",
                style: TextStyle(color: labelTextColor),
              ),
              content: showContentKnob
                  ? Text(
                      "Multi-line default content field as an example for SelenicMenuItem component.",
                      style: TextStyle(color: contentTextColor),
                    )
                  : null,
              leading: showLeadingKnob
                  ? SelenicAvatar(
                      borderRadius: borderRadius,
                      backgroundColor: context.selenicColors!.jiren,
                      avatarSize: SelenicAvatarSize.lg,
                      content: const Icon(
                        MoonIcons.travel_airplane_32_regular,
                        size: 32,
                      ),
                    )
                  : null,
              trailing: showTrailingKnob
                  ? Icon(
                      MoonIcons.controls_chevron_right_24_light,
                      color: trailingColor,
                    )
                  : null,
            ),
            const SizedBox(height: 16),
            SelenicMenuItem(
              backgroundColor: backgroundColor,
              borderRadius: borderRadius,
              menuItemCrossAxisAlignment: menuItemCrossAxisAlignmentKnob,
              onTap: isDisabledKnob ? null : () {},
              label: Text(
                "One-line menu item",
                style: TextStyle(color: labelTextColor),
              ),
              content: showContentKnob
                  ? Text(
                      'One-line content field example',
                      style: TextStyle(color: contentTextColor),
                    )
                  : null,
              leading: showLeadingKnob
                  ? SelenicAvatar(
                      borderRadius: borderRadius,
                      backgroundColor: context.selenicColors!.jiren,
                      avatarSize: SelenicAvatarSize.md,
                      content: const Icon(
                        MoonIcons.notifications_activity_32_regular,
                        size: 24,
                      ),
                    )
                  : null,
              trailing: showTrailingKnob
                  ? Icon(
                      MoonIcons.controls_chevron_right_24_light,
                      color: trailingColor,
                    )
                  : null,
            ),
            const TextDivider(text: "SelenicMenuItem with selection control"),
            SelenicMenuItem(
              borderRadius: borderRadius,
              backgroundColor: backgroundColor,
              menuItemCrossAxisAlignment: menuItemCrossAxisAlignmentKnob,
              onTap: isDisabledKnob
                  ? null
                  : () =>
                      setState(() => checkboxIsSelected = !checkboxIsSelected!),
              label: Text(
                "Menu item with SelenicCheckbox",
                style: TextStyle(color: labelTextColor),
              ),
              leading: showLeadingKnob
                  ? Icon(
                      MoonIcons.other_frame_24_light,
                      color: leadingColor,
                    )
                  : null,
              trailing: showTrailingKnob
                  ? SelenicCheckbox(
                      value: checkboxIsSelected,
                      tapAreaSizeValue: 24,
                      onChanged: (bool? isSelected) =>
                          setState(() => checkboxIsSelected = isSelected),
                    )
                  : null,
            ),
            const SizedBox(height: 16),
            SelenicMenuItem(
              borderRadius: borderRadius,
              backgroundColor: backgroundColor,
              menuItemCrossAxisAlignment: menuItemCrossAxisAlignmentKnob,
              onTap: isDisabledKnob
                  ? null
                  : () => setState(() => switchIsSelected = !switchIsSelected),
              label: Text(
                "Menu item with SelenicSwitch",
                style: TextStyle(color: labelTextColor),
              ),
              leading: showLeadingKnob
                  ? Icon(
                      MoonIcons.other_frame_24_light,
                      color: leadingColor,
                    )
                  : null,
              trailing: showTrailingKnob
                  ? SelenicSwitch(
                      switchSize: SelenicSwitchSize.x2s,
                      value: switchIsSelected,
                      onChanged: (bool isSelected) =>
                          setState(() => switchIsSelected = isSelected),
                    )
                  : null,
            ),
            const TextDivider(text: "Expandable SelenicMenuItem with divider"),
            SelenicAccordion<SelenicMenuItem>(
              shadows: const [],
              isDisabled: isDisabledKnob,
              hasContentOutside: true,
              borderRadius: borderRadius,
              accordionSize: SelenicAccordionSize.md,
              iconColor: trailingColor,
              backgroundColor: backgroundColor ?? Colors.transparent,
              expandedBackgroundColor:
                  backgroundColor ?? context.selenicColors!.heles,
              label: Text(
                'Expandable menu item',
                style: context.selenicTypography!.body.textDefault.copyWith(
                  color: labelTextColor,
                  fontWeight: FontWeight.w400,
                ),
              ),
              leading: showLeadingKnob
                  ? Icon(
                      MoonIcons.other_frame_24_light,
                      color: leadingColor ?? context.selenicColors!.iconPrimary,
                    )
                  : null,
              childrenPadding:
                  const EdgeInsets.only(top: 8, bottom: 8, left: 24),
              children: SelenicMenuItem.divideMenuItems(
                context: context,
                menuItems: List.generate(
                  2,
                  (index) => SelenicMenuItem(
                    backgroundColor: backgroundColor,
                    borderRadius: borderRadius,
                    menuItemCrossAxisAlignment: menuItemCrossAxisAlignmentKnob,
                    onTap: () => setState(
                      () => currentlySelectedMenuItem = MenuItem.values[index],
                    ),
                    label: Text(
                      "Menu item ${index + 1} with SelenicRadio",
                      style: TextStyle(color: labelTextColor),
                    ),
                    leading: showLeadingKnob
                        ? SelenicRadio<MenuItem>(
                            value: MenuItem.values[index],
                            groupValue: currentlySelectedMenuItem,
                            tapAreaSizeValue: 24,
                            onChanged: (MenuItem? selectedMenuItem) => setState(
                              () =>
                                  currentlySelectedMenuItem = selectedMenuItem!,
                            ),
                          )
                        : null,
                    trailing: showTrailingKnob
                        ? Icon(
                            MoonIcons.other_frame_24_light,
                            color: trailingColor,
                          )
                        : null,
                  ),
                ),
              ).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
