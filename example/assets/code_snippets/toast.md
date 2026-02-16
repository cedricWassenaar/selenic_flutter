import 'package:flutter/material.dart'; 
import 'package:selenic_design/selenic_design.dart';

class Toast extends StatelessWidget { 
  const Toast({super.key});

  @override
  Widget build(BuildContext context) {
    return SelenicFilledButton(
      onTap: () => SelenicToast.show(
        context,
        label: const Text('This is SelenicToast'),
      ),
      label: const Text("Show SelenicToast"),
    );
  }
}