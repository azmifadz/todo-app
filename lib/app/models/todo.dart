import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:uuid/uuid.dart';

@immutable
class Todo extends Equatable {
  Todo({
    String? id,
    this.title,
    this.startDate,
    this.endDate,
    this.isCompleted = false,
  })  : assert(
          id == null || id.isNotEmpty,
          'id can not be null and should be empty',
        ),
        id = id ?? const Uuid().v4();

  final String id;
  final String? title;
  final String? startDate;
  final String? endDate;
  final bool isCompleted;

  Todo copyWith({
    String? id,
    String? title,
    String? startDate,
    String? endDate,
    bool? isCompleted,
  }) {
    return Todo(
      id: id ?? this.id,
      title: title ?? this.title,
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
      isCompleted: isCompleted ?? this.isCompleted,
    );
  }

  @override
  List<Object?> get props => [id, title, startDate, endDate, isCompleted];
}
