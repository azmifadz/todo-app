import 'package:bloc_test/bloc_test.dart';
import 'package:todo_flutter/app/feature/add_todo/add_todo.dart';
import 'package:todo_flutter/app/feature/main_todo/main_todo.dart';

export 'pump_app.dart';

class MockMainTodoCubit extends MockCubit<MainTodoState> implements MainTodoCubit {}

class MockAddTodoCubit extends MockCubit<AddTodoState> implements AddTodoCubit {}
