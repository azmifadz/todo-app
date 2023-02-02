import 'package:flutter/material.dart';

class TdlFormTitleText extends StatelessWidget {
  const TdlFormTitleText({
    required this.title,
    super.key,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: Theme.of(context).textTheme.titleMedium!.copyWith(
            color: Colors.grey[500],
            fontWeight: FontWeight.bold,
          ),
    );
  }
}
