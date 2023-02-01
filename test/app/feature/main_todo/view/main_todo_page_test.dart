import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:todo_flutter/app/feature/main_todo/main_todo.dart';

import '../../../../helpers/helpers.dart';

class MockCounterCubit extends MockCubit<int> implements MainTodoCubit {}

void main() {
  group('CounterPage', () {
    testWidgets('renders CounterView', (tester) async {
      await tester.pumpApp(const MainTodoPage());
      expect(find.byType(CounterView), findsOneWidget);
    });
  });
}
