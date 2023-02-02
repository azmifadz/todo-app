import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:todo_flutter/app/dependency_injection/dependency_injection.dart';
import 'package:todo_flutter/app/feature/main_todo/main_todo.dart';
import 'package:todo_flutter/app/widgets/tdl_todo_card.dart';

import '../../../../helpers/helpers.dart';

void main() {
  late MainTodoCubit mainTodoCubit;

  setUpAll(() {
    configureDependencies();
    mainTodoCubit = MockMainTodoCubit();
  });

  group('MainTodoPage', () {
    testWidgets('renders MainTodoPage', (tester) async {
      await tester.pumpApp(const MainTodoPage());
      expect(find.byType(MainTodoPage), findsOneWidget);
    });

    testWidgets('renders empty view', (tester) async {
      when(() => mainTodoCubit.state).thenReturn(const MainTodoState());
      await tester.pumpApp(const MainTodoPage());
      expect(find.byType(TodoCard), findsNothing);
    });
  });
}
