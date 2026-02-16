import 'package:example/src/storybook/common/constants.dart';
import 'package:example/src/storybook/common/widgets/logo.dart';
import 'package:example/src/storybook/common/widgets/version.dart';
import 'package:example/src/storybook/routing/route_aware_stories.dart';
import 'package:flutter/material.dart';
import 'package:selenic_design/selenic_design.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

class StorybookPage extends StatelessWidget {
  const StorybookPage({super.key});

  static final _plugins = initializePlugins(
    enableCodeView: true,
    enableCompactLayoutDeviceFrame: false,
    initialDeviceFrameData: (
      isFrameVisible: true,
      device: Devices.ios.iPhone12ProMax,
      orientation: Orientation.portrait,
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Storybook(
      initialStory: "Home",
      plugins: _plugins,
      enableLayout: false,
      autoLayoutThreshold: storybookAutoLayoutThreshold,
      canvasColor: Colors.white,
      logoWidget: const SelenicLogoWidget(),
      routeWrapperBuilder: RouteWrapperBuilder(
        title: "Selenic Design for Flutter",
        theme: ThemeData.light().copyWith(
          scaffoldBackgroundColor: const Color(0xFFF6F7F9), // Gohan light.
          extensions: <ThemeExtension<dynamic>>[
            SelenicTheme(
              tokens: SelenicTokens.light.copyWith(
                colors: mdsLightColors,
                typography: SelenicTypography.typography.copyWith(
                  heading: SelenicTypography.typography.heading.apply(
                    fontFamily: "DMSans",
                    fontWeightDelta: -1,
                    fontVariations: [const FontVariation('wght', 500)],
                  ),
                  body: SelenicTypography.typography.body.apply(
                    fontFamily: "DMSans",
                  ),
                ),
              ),
            ),
          ],
        ),
        darkTheme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: const Color(0xFF1F1F1F), // Gohan dark.
          extensions: <ThemeExtension<dynamic>>[
            SelenicTheme(
              tokens: SelenicTokens.dark.copyWith(
                colors: mdsDarkColors,
                typography: SelenicTypography.typography.copyWith(
                  heading: SelenicTypography.typography.heading.apply(
                    fontFamily: "DMSans",
                    fontWeightDelta: -1,
                    fontVariations: [const FontVariation('wght', 500)],
                  ),
                  body: SelenicTypography.typography.body.apply(
                    fontFamily: "DMSans",
                  ),
                ),
              ),
            ),
          ],
        ),
        wrapperBuilder: (BuildContext context, Widget? child) => Scaffold(
          extendBody: true,
          extendBodyBehindAppBar: true,
          resizeToAvoidBottomInset: true,
          body: SafeArea(
            top: false,
            bottom: false,
            child: child ?? const SizedBox.shrink(),
          ),
        ),
      ),
      brandingWidget: const SelenicVersionWidget(),
      stories: routeAwareStories,
    );
  }
}
