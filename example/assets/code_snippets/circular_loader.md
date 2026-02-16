import 'package:flutter/material.dart';
import 'package:selenic_design/selenic_design.dart';

class CircularLoader extends StatelessWidget {
  const CircularLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return const SelenicCircularLoader(
      circularLoaderSize: SelenicCircularLoaderSize.sm,
    );
  }
}