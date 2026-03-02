import 'package:example/src/storybook/common/methods/wrapper.dart';
import 'package:example/src/storybook/routing/route_aware_stories.dart';
import 'package:flutter/material.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

class StorybookPage extends StatelessWidget {
  const StorybookPage({super.key});

  static final _plugins = initializePlugins(
    initialDeviceFrameData: (
      isFrameVisible: true,
      device: Devices.ios.iPhone16Pro,
      orientation: Orientation.portrait,
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Storybook(
      initialStory: "Home",
      plugins: _plugins,
      wrapperBuilder: selenicWrapper,
      stories: routeAwareStories,
    );
  }
}
