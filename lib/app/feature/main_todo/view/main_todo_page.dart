import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_flutter/app/dependency_injection/dependency_injection.dart';
import 'package:todo_flutter/app/feature/main_todo/cubit/main_todo_cubit.dart';
import 'package:todo_flutter/app/routes/app_router.gr.dart';
import 'package:todo_flutter/app/translations/locale_keys.g.dart';

class MainTodoPage extends StatelessWidget {
  const MainTodoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => MainTodoCubit(),
      child: const CounterView(),
    );
  }
}

class CounterView extends StatelessWidget {
  const CounterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          LocaleKeys.main_todo_title.tr(),
        ),
      ),
      body: Center(
        child: Text('Hello', style: Theme.of(context).textTheme.displayLarge),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => getIt<AppRouter>().push(const AddTodoRoute()),
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
