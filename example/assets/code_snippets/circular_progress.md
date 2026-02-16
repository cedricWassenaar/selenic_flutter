import 'package:flutter/material.dart';
import 'package:selenic_design/selenic_design.dart';

class CircularProgress extends StatelessWidget {
  const CircularProgress({super.key});

  @override
  Widget build(BuildContext context) {
    return const SelenicCircularProgress(
      value: 0.75,
      circularProgressSize: SelenicCircularProgressSize.sm,
    );
  }
}

