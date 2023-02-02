import 'package:flutter/material.dart';

typedef StringCallback = void Function(String value);

class TdlFormTextField extends StatelessWidget {
  const TdlFormTextField({
    required this.hintText,
    required this.onTextChanged,
    this.initialValue,
    super.key,
  });

  final String hintText;
  final StringCallback onTextChanged;
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
      onChanged: onTextChanged,
      initialValue: initialValue,
      textInputAction: TextInputAction.done,
    );
  }
}
