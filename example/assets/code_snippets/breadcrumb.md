import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:selenic_design/selenic_design.dart';

class BreadcrumbStory extends StatefulWidget {
  const BreadcrumbStory({super.key});

  @override
  State<BreadcrumbStory> createState() => _BreadcrumbStoryState();
}

class _BreadcrumbStoryState extends State<BreadcrumbStory> {
  bool _showDropdown = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // The default SelenicBreadcrumb. 
        // Expands horizontally to the full path when the indicated show more item is tapped.
        Column(
          children: [
            SelenicBreadcrumb(
              items: List.generate(
                6,
                (int index) {
                  return SelenicBreadcrumbItem(
                    onTap: () {},
                    label: Text('Page $index'),
                  );
                },
              ),
            ),
            // Provides an explicit method to restore the expanded breadcrumb path 
            // to its collapsed state, enabling external control.
            // By default, the state is automatically restored during rebuild.
            SelenicButton(
              onTap: () => setState(() => {}),
              label: const Text('Reset'),
            ),
          ],
        ),

        // SelenicBreadcrumb with the SelenicDropdown and a custom showMoreWidget.
        SelenicBreadcrumb(
          divider: Icon(
            Directionality.of(context) == TextDirection.ltr
                ? MoonIcons.controls_chevron_right_small_16_light
                : MoonIcons.controls_chevron_left_small_16_light,
          ),
          showMoreWidget: SelenicBreadcrumbItem(
            onTap: () => setState(() => _showDropdown = !_showDropdown),
            label: SelenicDropdown(
              show: _showDropdown,
              onTapOutside: () => setState(() => _showDropdown = false),
              content: Column(
                children: List.generate(
                  3,
                  (int index) => SelenicMenuItem(
                    onTap: () {},
                    label: Text('Page ${index + 1}'),
                  ),
                ),
              ),
              child: const Icon(MoonIcons.generic_burger_regular_16_light),
            ),
          ),
          items: List.generate(
            6,
            (int index) {
              return SelenicBreadcrumbItem(
                onTap: () {},
                label: Text('Page $index'),
              );
            },
          ),
        ),
      ],
    );
  }
}