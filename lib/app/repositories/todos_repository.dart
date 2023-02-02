import 'package:todo_flutter/app/models/todo.dart';

class TodosRepository {
  TodosRepository._();

  static final instance = TodosRepository._();

  final todos = <Todo>[];

  List<Todo> loadTodos() => todos;

  void saveTodo(Todo todo) {
    final todoIndex = todos.indexWhere((t) => t.id == todo.id);
    if (todoIndex >= 0) {
      todos[todoIndex] = todo;
    } else {
      todos.add(todo);
    }
  }
}
