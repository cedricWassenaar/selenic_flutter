import 'package:flutter/material.dart';
import 'package:selenic_design/selenic_design.dart';

class Drawer extends StatelessWidget {
  const Drawer({super.key});

  @override
  Widget build(BuildContext context) {
    return OverflowBox(
      maxHeight: MediaQuery.of(context).size.height,
      maxWidth: MediaQuery.of(context).size.width,
      child: Scaffold(
        drawer: SelenicDrawer(
          width: MediaQuery.of(context).size.width * 0.4,
          child: const Align(
            child: Text("SelenicDrawer"),
          ),
        ),
        body: Builder(
          builder: (BuildContext context) {
            return Center(
              child: SelenicFilledButton(
                onTap: () => Scaffold.of(context).openDrawer(),
                label: const Text("Open SelenicDrawer"),
              ),
            );
          },
        ),
      ),
    );
  }
}