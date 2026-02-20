import 'package:example/src/storybook/routing/route_aware_stories.dart';
import 'package:flutter/material.dart';
import 'package:selenic_design/selenic_design.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

/// Use this wrapper to wrap each story into a [MaterialApp] widget.
Widget selenicWrapper(BuildContext _, Widget? child) => MaterialApp(
      theme: ThemeData.light().copyWith(
        extensions: <ThemeExtension<dynamic>>[
          SelenicTheme(tokens: SelenicTokens.light),
        ],
      ),
      darkTheme: ThemeData.dark().copyWith(
        extensions: <ThemeExtension<dynamic>>[
          SelenicTheme(tokens: SelenicTokens.dark),
        ],
      ),
      themeMode: ThemeMode.dark,
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(child: child),
      ),
    );

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
