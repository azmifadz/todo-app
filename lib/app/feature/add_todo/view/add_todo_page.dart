import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:todo_flutter/app/translations/locale_keys.g.dart';

class AddTodoPage extends StatelessWidget {
  const AddTodoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          LocaleKeys.add_todo_title.tr(),
        ),
      ),
      body: Center(
        child: Text('Hello', style: Theme.of(context).textTheme.displayLarge),
      ),
    );
  }
}
