import 'dart:math';

import 'package:example/src/storybook/common/color_options.dart';
import 'package:example/src/storybook/common/widgets/text_divider.dart';
import 'package:flutter/material.dart';
import 'package:selenic_design/selenic_design.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

class BreadcrumbStory extends StatefulWidget {
  static const path = '/primitives/breadcrumb';

  const BreadcrumbStory({super.key});

  @override
  State<BreadcrumbStory> createState() => _BreadcrumbStoryState();
}

class _BreadcrumbStoryState extends State<BreadcrumbStory> {
  bool _showDropdown = false;

  @override
  Widget build(BuildContext context) {
    final itemColorKnob = context.knobs.nullable.options(
      label: "Item color",
      description: "MoonColors variants for SelenicBreadcrumb item.",
      enabled: false,
      initial: 0,
      // piccolo
      options: colorOptions,
    );

    final itemColor = colorTable(context)[itemColorKnob ?? 40];

    final currentItemColorKnob = context.knobs.nullable.options(
      label: "Current item color",
      description: "MoonColors variants for SelenicBreadcrumb current item.",
      enabled: false,
      initial: 0,
      // piccolo
      options: colorOptions,
    );

    final currentItemColor = colorTable(context)[currentItemColorKnob ?? 40];

    final hoverEffectColorKnob = context.knobs.nullable.options(
      label: "hoverEffectColor",
      description: "MoonColors variants for SelenicBreadcrumb item on hover.",
      enabled: false,
      initial: 0,
      // piccolo
      options: colorOptions,
    );

    final hoverEffectColor = colorTable(context)[hoverEffectColorKnob ?? 40];

    final dividerColorKnob = context.knobs.nullable.options(
      label: "dividerColor",
      description: "MoonColors variants for SelenicBreadcrumb divider.",
      enabled: false,
      initial: 0,
      // piccolo
      options: colorOptions,
    );

    final dividerColor = colorTable(context)[dividerColorKnob ?? 40];

    final itemCountKnob = context.knobs.nullable.sliderInt(
      label: "Item count",
      description: "Total count of items for SelenicBreadcrumb.",
      enabled: false,
      initial: 7,
      max: 12,
    );

    final visibleItemCountKnob = context.knobs.nullable.sliderInt(
      label: "visibleItemCount",
      description: "Number of items to display for SelenicBreadcrumb.",
      enabled: false,
      initial: 3,
      max: 12,
    );

    final gapKnob = context.knobs.nullable.sliderInt(
      label: "gap",
      description: "Gap between SelenicBreadcrumb items.",
      enabled: false,
      initial: 8,
      max: 16,
    );

    final showLeadingKnob = context.knobs.boolean(
      label: "leading",
      description: "Show widget in SelenicBreadcrumb item leading slot.",
    );

    final showTrailingKnob = context.knobs.boolean(
      label: "trailing",
      description: "Show widget in SelenicBreadcrumb item trailing slot.",
    );

    final List<SelenicBreadcrumbItem> breadcrumbItems = List.generate(
      itemCountKnob ?? 7,
      (int index) {
        final bool isHomePage = index == 0;

        return SelenicBreadcrumbItem(
          semanticLabel: index.toString(),
          onTap: () => SelenicToast.show(
            context,
            displayDuration: const Duration(seconds: 1),
            label: Text(isHomePage ? 'Home Page' : 'Page $index'),
          ),
          leading: showLeadingKnob && isHomePage
              ? const Icon(
                  MoonIcons.generic_home_16_light,
                  size: 16,
                )
              : null,
          label: Text(isHomePage ? 'Home' : 'Page $index'),
          trailing: showTrailingKnob && isHomePage
              ? const Icon(
                  MoonIcons.generic_home_16_light,
                  size: 16,
                )
              : null,
        );
      },
    );

    return Center(
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 64.0, horizontal: 16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const TextDivider(
              text: "SelenicBreadcrumb",
              paddingTop: 0,
            ),
            SelenicBreadcrumb(
              visibleItemCount: visibleItemCountKnob ?? 3,
              gap: gapKnob?.toDouble(),
              padding: const EdgeInsets.symmetric(horizontal: 16),
              hoverEffectColor: hoverEffectColor,
              dividerColor: dividerColor,
              itemTextStyle: TextStyle(color: itemColor),
              currentItemTextStyle: TextStyle(color: currentItemColor),
              items: breadcrumbItems,
            ),
            const SizedBox(height: 32),
            SelenicButton(
              backgroundColor: context.selenicColors!.piccolo,
              onTap: () => setState(() => {}),
              label: Text(
                'Reset',
                style: TextStyle(color: context.selenicColors!.goten),
              ),
            ),
            const TextDivider(
                text: "Custom SelenicBreadcrumb with SelenicDropdown"),
            StatefulBuilder(
              builder: (BuildContext context, StateSetter setState) {
                return SelenicBreadcrumb(
                  visibleItemCount: visibleItemCountKnob ?? 3,
                  gap: gapKnob?.toDouble(),
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  hoverEffectColor: hoverEffectColor,
                  dividerColor: dividerColor,
                  itemTextStyle: TextStyle(color: itemColor),
                  currentItemTextStyle: TextStyle(color: currentItemColor),
                  itemDecoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  divider: Icon(
                    Directionality.of(context) == TextDirection.ltr
                        ? MoonIcons.controls_chevron_right_small_16_light
                        : MoonIcons.controls_chevron_left_small_16_light,
                  ),
                  showMoreWidget: SelenicBreadcrumbItem(
                    onTap: () => setState(() => _showDropdown = !_showDropdown),
                    label: SelenicDropdown(
                      maxHeight: 250,
                      maxWidth: 150,
                      show: _showDropdown,
                      onTapOutside: () => setState(() => _showDropdown = false),
                      content: ListView(
                        shrinkWrap: true,
                        padding: EdgeInsets.zero,
                        children: List.generate(
                          max(
                            (itemCountKnob ?? 7) - (visibleItemCountKnob ?? 3),
                            0,
                          ),
                          (int index) => SelenicMenuItem(
                            onTap: () => SelenicToast.show(
                              context,
                              displayDuration: const Duration(seconds: 1),
                              label: Text('Page ${index + 1}'),
                            ),
                            label: Text('Page ${index + 1}'),
                          ),
                        ),
                      ),
                      child: const Icon(
                        MoonIcons.generic_burger_regular_16_light,
                      ),
                    ),
                  ),
                  items: breadcrumbItems,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
