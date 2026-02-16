import 'package:example/src/storybook/common/pages/home_page.dart';
import 'package:example/src/storybook/routing/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:selenic_design/selenic_design.dart';

class SelenicLogoWidget extends StatefulWidget {
  const SelenicLogoWidget({super.key});

  @override
  State<SelenicLogoWidget> createState() => _SelenicLogoWidgetState();
}

class _SelenicLogoWidgetState extends State<SelenicLogoWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 28.0, left: 20.0),
      child: Align(
        alignment: Alignment.centerLeft,
        child: SelenicButton(
          showScaleEffect: false,
          hoverEffectColor: Colors.transparent,
          onTap: () => router.go(HomePage.path),
          label: SvgPicture.asset(
            "assets/svg/heart.svg",
            height: 16.0,
          ),
        ),
      ),
    );
  }
}
