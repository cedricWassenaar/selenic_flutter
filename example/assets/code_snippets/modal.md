import 'package:flutter/material.dart';
import 'package:selenic_design/selenic_design.dart';

class Modal extends StatelessWidget {
  const Modal({super.key});

  @override
  Widget build(BuildContext context) {
    Future<void> modalBuilder(BuildContext context) {
      return showSelenicModal<void>(
        context: context,
        builder: (BuildContext context) {
          return SelenicModal(
            child: SizedBox(
              height: 150,
              width: MediaQuery.of(context).size.width - 64,
              child: const Center(
                child: Text("This is SelenicModal."),
              ),
            ),
          );
        },
      );
    }

    return Center(
      child: Builder(
        builder: (BuildContext context) {
          return SelenicFilledButton(
            label: const Text("Open SelenicModal"),
            onTap: () => modalBuilder(context),
          );
        },
      ),
    );
  }
}