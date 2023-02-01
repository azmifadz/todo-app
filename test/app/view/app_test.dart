import 'package:flutter_test/flutter_test.dart';
import 'package:todo_flutter/app/feature/main_todo/main_todo.dart';
import 'package:todo_flutter/app/todo_app.dart';

void main() {
  group('App', () {
    testWidgets('renders CounterPage', (tester) async {
      await tester.pumpWidget(const TodoApp());
      expect(find.byType(MainTodoPage), findsOneWidget);
    });
  });
}
