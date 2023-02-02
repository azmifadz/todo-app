import 'package:flutter/material.dart';

class TdlFormTextField extends StatelessWidget {
  const TdlFormTextField({
    required this.hintText,
    required this.onTextChanged,
    this.initialValue,
    super.key,
  });

  final String hintText;
  final Function(String) onTextChanged;
  final String? initialValue;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        enabledBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.zero,
        ),
        hintText: hintText,
      ),
      maxLines: 5,
      onChanged: (value) {
        onTextChanged(value);
      },
      initialValue: initialValue,
      textInputAction: TextInputAction.done,
    );
  }
}
