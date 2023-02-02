import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_flutter/app/dependency_injection/dependency_injection.dart';
import 'package:todo_flutter/app/feature/main_todo/cubit/main_todo_cubit.dart';
import 'package:todo_flutter/app/routes/app_router.gr.dart';
import 'package:todo_flutter/app/translations/locale_keys.g.dart';
import 'package:todo_flutter/app/widgets/tdl_todo_card.dart';

class MainTodoPage extends StatelessWidget {
  const MainTodoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<MainTodoCubit>(),
      child: const MainTodoView(),
    );
  }
}

class MainTodoView extends StatelessWidget {
  const MainTodoView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          LocaleKeys.main_todo_appbar_title.tr(),
        ),
      ),
      body: BlocBuilder<MainTodoCubit, MainTodoState>(
        builder: (context, state) {
          final todos = state.todos;

          return ListView.builder(
            itemCount: todos.length,
            itemBuilder: (context, index) {
              final todo = todos[index];

              return InkWell(
                onTap: () => getIt<AppRouter>().push(AddTodoRoute(todo: todo)),
                child: TodoCard(
                  todo: todo,
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => getIt<AppRouter>().push(AddTodoRoute()),
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
