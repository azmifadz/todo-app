import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_flutter/app/dependency_injection/dependency_injection.dart';
import 'package:todo_flutter/app/feature/add_todo/add_todo.dart';
import 'package:todo_flutter/app/feature/main_todo/cubit/main_todo_cubit.dart';
import 'package:todo_flutter/app/models/todo.dart';
import 'package:todo_flutter/app/repositories/todos_repository.dart';
import 'package:todo_flutter/app/routes/app_router.gr.dart';
import 'package:todo_flutter/app/translations/locale_keys.g.dart';
import 'package:todo_flutter/app/utils/date_time_helper.dart';
import 'package:todo_flutter/app/widgets/tdl_form_datepicker.dart';
import 'package:todo_flutter/app/widgets/tdl_form_text_field.dart';
import 'package:todo_flutter/app/widgets/tdl_form_title_text.dart';

class AddTodoPage extends StatelessWidget {
  const AddTodoPage({this.todo, super.key});

  final Todo? todo;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => AddTodoCubit(
        todosRepository: TodosRepository.instance,
        initialTodo: todo,
      ),
      child: BlocListener<AddTodoCubit, AddTodoState>(
        listenWhen: (previous, current) => previous.status != current.status && current.status == AddTodoStatus.success,
        listener: (context, state) {
          getIt<MainTodoCubit>().onLoadTodos();
          getIt<AppRouter>().pop();
        },
        child: const AddTodoView(),
      ),
    );
  }
}

class AddTodoView extends StatelessWidget {
  const AddTodoView({super.key});

  @override
  Widget build(BuildContext context) {
    final isNewTodo = context.select((AddTodoCubit cubit) => cubit.state.isNewTodo);
    final title = context.select((AddTodoCubit cubit) => cubit.state.title);
    final startDate = context.select((AddTodoCubit cubit) => cubit.state.startDate);
    final endDate = context.select((AddTodoCubit cubit) => cubit.state.endDate);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          isNewTodo ? LocaleKeys.add_todo_appbar_title.tr() : LocaleKeys.add_todo_appbar_title_edit.tr(),
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Form(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const SizedBox(height: 24),
                TdlFormTitleText(title: LocaleKeys.add_todo_title.tr()),
                const SizedBox(height: 8),
                TdlFormTextField(
                  hintText: LocaleKeys.add_todo_title_hint.tr(),
                  onTextChanged: (String value) => context.read<AddTodoCubit>().onTitleChanged(value),
                  initialValue: title,
                ),
                const SizedBox(height: 24),
                TdlFormTitleText(title: LocaleKeys.add_todo_start_date.tr()),
                const SizedBox(height: 8),
                TdlFormDatePicker(
                  onSelectedDate: (DateTime value) =>
                      context.read<AddTodoCubit>().onStartDateChanged(formattedDateOnly(value)),
                  selectedDate: formattedDateTimeFromString(startDate),
                ),
                const SizedBox(height: 24),
                TdlFormTitleText(title: LocaleKeys.add_todo_end_date.tr()),
                const SizedBox(height: 8),
                TdlFormDatePicker(
                  onSelectedDate: (DateTime value) =>
                      context.read<AddTodoCubit>().onEndDateChanged(formattedDateOnly(value)),
                  selectedDate: formattedDateTimeFromString(endDate),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: Container(
          width: double.infinity,
          color: Colors.black,
          child: TextButton(
            onPressed: () => context.read<AddTodoCubit>().onSubmitted(),
            child: Text(
              isNewTodo ? LocaleKeys.add_todo_create_now.tr() : LocaleKeys.add_todo_edit_todo.tr(),
              style: const TextStyle(color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
