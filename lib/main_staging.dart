import 'package:todo_flutter/app/config/flavor.dart';
import 'package:todo_flutter/app/todo_app.dart';
import 'package:todo_flutter/bootstrap.dart';

void main() {
  bootstrap(
    Flavor.staging(),
    () => const TodoApp(),
  );
}
