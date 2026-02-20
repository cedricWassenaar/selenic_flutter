import 'package:example/src/storybook/common/color_options.dart';
import 'package:example/src/storybook/common/widgets/text_divider.dart';
import 'package:flutter/material.dart';
import 'package:selenic_design/selenic_design.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

class TabBarStory extends StatefulWidget {
  static const path = '/primitives/tab_bar';

  const TabBarStory({super.key});

  @override
  State<TabBarStory> createState() => _TabBarStoryState();
}

class _TabBarStoryState extends State<TabBarStory>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();

    _tabController = TabController(length: 3, vsync: this, initialIndex: 1);
  }

  @override
  void dispose() {
    _tabController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final tabsSizeKnob = context.knobs.nullable.options(
      label: "tabBarSize",
      description: "Size variants for SelenicTabBar.",
      enabled: false,
      initial: SelenicTabBarSize.md,
      options: const [
        Option(label: "sm", value: SelenicTabBarSize.sm),
        Option(label: "md", value: SelenicTabBarSize.md),
      ],
    );

    final textColorKnob = context.knobs.nullable.options(
      label: "textColor",
      description: "SelenicColors variants for SelenicTabBar default text.",
      enabled: false,
      initial: 0,
      options: colorOptions,
    );

    final textColor = colorTable(context)[textColorKnob ?? 40];

    final selectedTextColorKnob = context.knobs.nullable.options(
      label: "selectedTextColor",
      description:
          "SelenicColors variants for SelenicTabBar selected tab text.",
      enabled: false,
      initial: 0,
      options: colorOptions,
    );

    final selectedTextColor = colorTable(context)[selectedTextColorKnob ?? 40];

    final indicatorColorKnob = context.knobs.nullable.options(
      label: "indicatorColor",
      description: "SelenicColors variants for SelenicTabBar indicator.",
      enabled: false,
      initial: 0,
      options: colorOptions,
    );

    final indicatorColor = colorTable(context)[indicatorColorKnob ?? 40];

    final selectedTabColorKnob = context.knobs.nullable.options(
      label: "selectedTabColor",
      description:
          "SelenicColors variants for pill SelenicTabBar selected tab.",
      enabled: false,
      initial: 0,
      options: colorOptions,
    );

    final selectedTabColor = colorTable(context)[selectedTabColorKnob ?? 40];

    final borderRadiusKnob = context.knobs.nullable.sliderInt(
      label: "borderRadius",
      description: "Border radius for pill SelenicTabBar.",
      enabled: false,
      initial: 8,
      max: 32,
    );

    final indicatorHeightKnob = context.knobs.nullable.sliderInt(
      label: "indicatorHeight",
      description: "Indicator height for SelenicTabBar.",
      enabled: false,
      initial: 2,
      max: 4,
    );

    final gapKnob = context.knobs.nullable.sliderInt(
      label: "gap",
      description: "Gap between SelenicTabBar tabs.",
      enabled: false,
      initial: 4,
      max: 12,
    );

    final showLeadingKnob = context.knobs.boolean(
      label: "leading",
      description: "Show widget in SelenicTabBar leading slot.",
    );

    final showLabelKnob = context.knobs.boolean(
      label: "label",
      description: "Show widget in SelenicTabBar label slot.",
      initial: true,
    );

    final showTrailingKnob = context.knobs.boolean(
      label: "trailing",
      description: "Show widget in SelenicTabBar trailing slot.",
    );

    final isExpandedKnob = context.knobs.boolean(
      label: "isExpanded",
      description: "Expand SelenicTabBar horizontally.",
    );

    final tabStyle = SelenicTabStyle(
      textColor: textColor,
      selectedTextColor: selectedTextColor,
      indicatorColor: indicatorColor,
      indicatorHeight: indicatorHeightKnob?.toDouble(),
    );

    final pillTabStyle = SelenicPillTabStyle(
      textColor: textColor,
      selectedTextColor: selectedTextColor,
      selectedTabColor: selectedTabColor,
      borderRadius: borderRadiusKnob != null
          ? BorderRadius.circular(borderRadiusKnob.toDouble())
          : null,
    );

    return Center(
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 64.0, horizontal: 16.0),
        child: Column(
          children: [
            const TextDivider(
              text: "SelenicTabBar",
              paddingTop: 0,
            ),
            Column(
              children: [
                SelenicTabBar(
                  tabBarSize: tabsSizeKnob,
                  isExpanded: isExpandedKnob,
                  gap: gapKnob?.toDouble(),
                  tabs: List.generate(
                    3,
                    (int index) => SelenicTab(
                      leading: showLeadingKnob
                          ? const Icon(MoonIcons.other_frame_24_light)
                          : null,
                      label: showLabelKnob ? Text('Tab${index + 1}') : null,
                      trailing: showTrailingKnob
                          ? const Icon(MoonIcons.other_frame_24_light)
                          : null,
                      tabStyle: tabStyle,
                    ),
                  ),
                ),
                const TextDivider(text: "SelenicTabBar with disabled tab"),
                SelenicTabBar(
                  tabBarSize: tabsSizeKnob,
                  isExpanded: isExpandedKnob,
                  gap: gapKnob?.toDouble(),
                  tabs: List.generate(
                    4,
                    (int index) => SelenicTab(
                      disabled: index == 1,
                      trailing: const Icon(MoonIcons.other_frame_24_light),
                      tabStyle: tabStyle,
                    ),
                  ),
                ),
                const TextDivider(text: "Pill SelenicTabBar"),
                SelenicTabBar.pill(
                  tabBarSize: tabsSizeKnob,
                  isExpanded: isExpandedKnob,
                  gap: gapKnob?.toDouble(),
                  pillTabs: List.generate(
                    3,
                    (int index) => SelenicPillTab(
                      leading: showLeadingKnob
                          ? const Icon(MoonIcons.other_frame_24_light)
                          : null,
                      label: showLabelKnob ? Text('Tab${index + 1}') : null,
                      trailing: showTrailingKnob
                          ? const Icon(MoonIcons.other_frame_24_light)
                          : null,
                      tabStyle: pillTabStyle,
                    ),
                  ),
                ),
                const TextDivider(text: "Custom SelenicTabBar with TabBarView"),
                SelenicTabBar(
                  isExpanded: true,
                  tabController: _tabController,
                  tabs: List.generate(
                    3,
                    (int index) => SelenicTab(
                      label: Text('Tab${index + 1}'),
                      tabStyle: tabStyle,
                    ),
                  ),
                ),
                SizedBox(
                  height: 112,
                  child: TabBarView(
                    controller: _tabController,
                    children: [
                      Container(
                        color: context.selenicColors!.supportive_6_60,
                        padding: const EdgeInsets.all(16),
                        child: Stack(
                          children: [
                            const Align(
                              child: Text('Tab1'),
                            ),
                            Align(
                              alignment: Alignment.centerRight,
                              child: SelenicButton.icon(
                                onTap: () => _tabController.animateTo(1),
                                icon: const Icon(
                                  MoonIcons.controls_chevron_right_24_light,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        color: context.selenicColors!.supportive_1_60,
                        padding: const EdgeInsets.all(16),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SelenicButton.icon(
                              onTap: () => _tabController.animateTo(0),
                              icon: const Icon(
                                MoonIcons.controls_chevron_left_24_light,
                              ),
                            ),
                            const Text('Tab2'),
                            SelenicButton.icon(
                              onTap: () => _tabController.animateTo(2),
                              icon: const Icon(
                                MoonIcons.controls_chevron_right_24_light,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        color: context.selenicColors!.supportive_6_60,
                        padding: const EdgeInsets.all(16),
                        child: Stack(
                          children: [
                            const Align(
                              child: Text('Tab3'),
                            ),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: SelenicButton.icon(
                                onTap: () => _tabController.animateTo(1),
                                icon: const Icon(
                                  MoonIcons.controls_chevron_left_24_light,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
