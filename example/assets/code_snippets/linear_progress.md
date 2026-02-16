import 'package:flutter/material.dart';
import 'package:selenic_design/selenic_design.dart';

class LinearProgress extends StatelessWidget {
  const LinearProgress({super.key});

  @override
  Widget build(BuildContext context) {
    return const SelenicLinearProgress(
      value: 0.75,
      linearProgressSize: SelenicLinearProgressSize.x4s,
    );
  }
}