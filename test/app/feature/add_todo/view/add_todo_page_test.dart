import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:todo_flutter/app/dependency_injection/dependency_injection.dart';
import 'package:todo_flutter/app/feature/add_todo/add_todo.dart';
import 'package:todo_flutter/app/translations/locale_keys.g.dart';

import '../../../../helpers/helpers.dart';

void main() {
  late AddTodoCubit addTodoCubit;

  setUpAll(() {
    getIt.allReady();

    addTodoCubit = MockAddTodoCubit();
  });

  group('AddTodoPage', () {
    testWidgets('renders AddTodoPage', (tester) async {
      await tester.pumpApp(const AddTodoPage());
      expect(find.byType(AddTodoPage), findsOneWidget);
    });

    testWidgets('renders empty view', (tester) async {
      when(() => addTodoCubit.state).thenReturn(const AddTodoState());
      await tester.pumpApp(const AddTodoPage());

      expect(find.text(LocaleKeys.add_todo_title_hint.tr()), findsOneWidget);
      expect(
        find.text(LocaleKeys.add_todo_select_date.tr()),
        findsAtLeastNWidgets(2),
      );
    });
  });
}
