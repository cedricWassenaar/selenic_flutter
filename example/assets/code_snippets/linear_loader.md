import 'package:flutter/material.dart';
import 'package:selenic_design/selenic_design.dart';

class LinearLoader extends StatelessWidget {
  const LinearLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return const SelenicLinearLoader(
      linearLoaderSize: SelenicLinearLoaderSize.x4s,
    );
  }
}