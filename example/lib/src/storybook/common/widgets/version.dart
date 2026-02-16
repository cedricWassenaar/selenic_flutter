import 'dart:ui';

import 'package:example/src/storybook/common/constants.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:package_info_plus/package_info_plus.dart';

import 'package:selenic_design/selenic_design.dart';

class SelenicVersionWidget extends StatefulWidget {
  const SelenicVersionWidget({super.key});

  @override
  State<SelenicVersionWidget> createState() => _SelenicVersionWidgetState();
}

class _SelenicVersionWidgetState extends State<SelenicVersionWidget> {
  bool isLargeScreen =
      MediaQueryData.fromView(PlatformDispatcher.instance.implicitView!)
              .size
              .width >
          storybookAutoLayoutThreshold;

  String? _version = "";

  @override
  Future<void> didChangeDependencies() async {
    super.didChangeDependencies();

    final PackageInfo packageInfo = await PackageInfo.fromPlatform();

    if (mounted) setState(() => _version = packageInfo.version);
  }

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      child: Material(
        color: Colors.transparent,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: isLargeScreen
                ? MainAxisAlignment.center
                : MainAxisAlignment.end,
            children: [
              SvgPicture.asset(
                "assets/svg/github_logo.svg",
                width: 24.0,
                height: 24.0,
              ),
              if (isLargeScreen) ...[
                const SizedBox(width: 8.0),
                Text(
                  "Selenic Design",
                  style: SelenicTypography.typography.heading.text14,
                ),
              ],
              const SizedBox(width: 6.0),
              Text(
                "v$_version",
                style: SelenicTypography.typography.heading.text14,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
