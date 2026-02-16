import 'package:flutter/material.dart';
import 'package:selenic_design/selenic_design.dart';

class DotIndicator extends StatelessWidget {
  const DotIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return const SelenicDotIndicator(
      dotCount: 4,
      selectedDot: 2,
    );
  }
}