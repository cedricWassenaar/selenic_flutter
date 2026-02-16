import 'package:flutter/material.dart';
import 'package:selenic_design/selenic_design.dart';

class TextArea extends StatelessWidget {
  const TextArea({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Builder(
        builder: (BuildContext context) {
          return Column(
            children: [
              SelenicTextArea(
                height: 200,
                validator: (String? value) => value?.length != null && value!.length < 5 
                  ? "The text should be longer than 5 characters." 
                  : null,
              ),
              SelenicFilledButton(
                onTap: () => Form.of(context).validate(),
                label: const Text("Submit"),
              ),
            ],
          );
        },
      ),
    );
  }
}