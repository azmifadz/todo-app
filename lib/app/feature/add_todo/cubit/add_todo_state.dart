part of 'add_todo_cubit.dart';

enum AddTodoStatus { initial, success }

class AddTodoState extends Equatable {
  const AddTodoState({
    this.status = AddTodoStatus.initial,
    this.initialTodo,
    this.title = '',
    this.startDate = '',
    this.endDate = '',
  });

  final AddTodoStatus status;
  final Todo? initialTodo;
  final String title;
  final String startDate;
  final String endDate;

  bool get isNewTodo => initialTodo == null;

  AddTodoState copyWith({
    AddTodoStatus? status,
    Todo? initialTodo,
    String? title,
    String? startDate,
    String? endDate,
  }) {
    return AddTodoState(
      status: status ?? this.status,
      initialTodo: initialTodo ?? this.initialTodo,
      title: title ?? this.title,
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
    );
  }

  @override
  List<Object?> get props => [status, initialTodo, title, startDate, endDate];
}
