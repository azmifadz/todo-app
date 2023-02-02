import 'package:flutter_test/flutter_test.dart';
import 'package:todo_flutter/app/feature/main_todo/main_todo.dart';

import '../../../../helpers/helpers.dart';

void main() {
  group('MainTodoPage', () {
    testWidgets('renders CounterView', (tester) async {
      await tester.pumpApp(const MainTodoPage());
      expect(find.byType(MainTodoPage), findsOneWidget);
    });
  });
}
