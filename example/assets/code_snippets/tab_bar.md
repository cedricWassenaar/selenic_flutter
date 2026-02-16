import 'package:flutter/material.dart';
import 'package:selenic_design/selenic_design.dart';

class TabBar extends StatefulWidget {
  const TabBar({super.key});

  @override
  State<TabBar> createState() => _TabBarState();
}

class _TabBarState extends State<TabBar> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();

    _tabController = TabController(length: 3, vsync: this);
  }
  
  @override
  void dispose() {
    _tabController.dispose();
  
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SelenicTabBar(
          tabBarSize: SelenicTabBarSize.sm,
          tabs: List.generate(
            3,
            (int index) => SelenicTab(
              leading: const Icon(MoonIcons.other_frame_24_light),
              label: Text('Tab${index + 1}'),
              trailing: const Icon(MoonIcons.other_frame_24_light),
            ),
          ),
        ),
        SelenicTabBar.pill(
          tabBarSize: SelenicTabBarSize.sm,
          pillTabs: List.generate(
            3,
            (int index) => SelenicPillTab(
              leading: const Icon(MoonIcons.other_frame_24_light),
              label: Text('Tab${index + 1}'),
              trailing: const Icon(MoonIcons.other_frame_24_light),
            ),
          ),
        ),

        // SelenicTabBar with TabBarView.
        SelenicTabBar(
          isExpanded: true,
          tabController: _tabController,
          tabs: List.generate(
            3,
            (int index) => SelenicTab(
              label: Text('Tab${index + 1}'),
            ),
          ),
        ),
        SizedBox(
          height: 112,
          child: TabBarView(
            controller: _tabController,
            children: [
              Container(
                color: context.selenicColors!.whis60,
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
                        icon: const Icon(MoonIcons.controls_chevron_right_24_light),
                      ),                    
                    ),
                  ],
                ),
              ),
              Container(
                color: context.selenicColors!.frieza60,
                padding: const EdgeInsets.all(16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SelenicButton.icon(
                      onTap: () => _tabController.animateTo(0),
                      icon: const Icon(MoonIcons.controls_chevron_left_24_light),
                    ),                    
                    const Text('Tab2'),
                    SelenicButton.icon(
                      onTap: () => _tabController.animateTo(2),
                      icon: const Icon(MoonIcons.controls_chevron_right_24_light),
                    ),                  
                  ],
                ),
              ),
              Container(
                color: context.selenicColors!.whis60,
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
    );
  }
}
