import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:todo_flutter/app/models/todo.dart';
import 'package:todo_flutter/app/repositories/todos_repository.dart';

part 'add_todo_state.dart';

class AddTodoCubit extends Cubit<AddTodoState> {
  AddTodoCubit({
    required this.todosRepository,
    required Todo? initialTodo,
  }) : super(
          AddTodoState(
            initialTodo: initialTodo,
            title: initialTodo?.title ?? '',
            startDate: initialTodo?.startDate ?? '',
            endDate: initialTodo?.endDate ?? '',
          ),
        );

  final TodosRepository todosRepository;

  void onTitleChanged(String title) {
    emit(state.copyWith(title: title));
  }

  void onStartDateChanged(String startDate) {
    emit(state.copyWith(startDate: startDate));
  }

  void onEndDateChanged(String endDate) {
    emit(state.copyWith(endDate: endDate));
  }

  Future<void> onSubmitted() async {
    final todo = (state.initialTodo ?? Todo(title: '')).copyWith(
      title: state.title,
      startDate: state.startDate,
      endDate: state.endDate,
    );

    todosRepository.saveTodo(todo);
    emit(
      state.copyWith(status: AddTodoStatus.success),
    );
  }
}
