import 'package:flutter/material.dart';
import 'package:selenic_design/selenic_design.dart';

class BottomSheet extends StatelessWidget {
  const BottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    Future<dynamic> bottomSheetBuilder(BuildContext context) {
      return showSelenicModalBottomSheet(
        context: context,
        enableDrag: true,
        height: MediaQuery.of(context).size.height * 0.7,
        builder: (BuildContext context) => Column(
          children: [
            // Drag handle for the bottom sheet.
            Container(
              height: 4,
              width: 40,
              margin: const EdgeInsets.symmetric(vertical: 8),
              decoration: ShapeDecoration(
                color: context.selenicColors!.beerus,
                shape: SelenicSquircleBorder(
                  borderRadius: BorderRadius.circular(16).squircleBorderRadius(context),
                ),
              ),
            ),
            const Expanded(
              child: Align(
                child: Text('SelenicBottomSheet example'),
              ),
            ),
          ],
        ),
      );
    }

    return Center(
      child: SelenicFilledButton(
        onTap: () => bottomSheetBuilder(context),
        label: const Text("Tap me"),
      ),
    );
  }
}