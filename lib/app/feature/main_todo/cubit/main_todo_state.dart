part of 'main_todo_cubit.dart';

enum MainTodoStatus { initial, success }

class MainTodoState {
  const MainTodoState({
    this.status = MainTodoStatus.initial,
    this.todos = const [],
  });

  final MainTodoStatus status;
  final List<Todo> todos;

  MainTodoState copyWith({
    MainTodoStatus? status,
    List<Todo>? todos,
  }) {
    return MainTodoState(
      status: status ?? this.status,
      todos: todos ?? this.todos,
    );
  }

  List<Object?> get props => [status, todos];
}
