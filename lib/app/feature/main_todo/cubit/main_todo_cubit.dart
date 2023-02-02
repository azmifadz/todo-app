import 'package:bloc/bloc.dart';
import 'package:todo_flutter/app/models/todo.dart';
import 'package:todo_flutter/app/repositories/todos_repository.dart';

part 'main_todo_state.dart';

class MainTodoCubit extends Cubit<MainTodoState> {
  MainTodoCubit({
    required this.todosRepository,
  }) : super(const MainTodoState());

  final TodosRepository todosRepository;

  Future<void> onLoadTodos() async {
    final todos = todosRepository.loadTodos();
    emit(state.copyWith(status: MainTodoStatus.success, todos: todos));
  }
}
