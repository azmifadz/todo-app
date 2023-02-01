import 'package:auto_route/auto_route.dart';
import 'package:todo_flutter/app/feature/add_todo/view/add_todo_page.dart';
import 'package:todo_flutter/app/feature/main_todo/main_todo.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: [
    AutoRoute<void>(
      page: MainTodoPage,
      name: 'MainTodoRoute',
      path: '/home',
      initial: true,
    ),
    AutoRoute(page: AddTodoPage),
  ],
)
class $AppRouter {}
