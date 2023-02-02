// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i3;
import 'package:flutter/material.dart' as _i4;

import '../feature/add_todo/view/add_todo_page.dart' as _i2;
import '../feature/main_todo/main_todo.dart' as _i1;
import '../models/todo.dart' as _i5;

class AppRouter extends _i3.RootStackRouter {
  AppRouter([_i4.GlobalKey<_i4.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i3.PageFactory> pagesMap = {
    MainTodoRoute.name: (routeData) {
      return _i3.MaterialPageX<void>(
        routeData: routeData,
        child: const _i1.MainTodoPage(),
      );
    },
    AddTodoRoute.name: (routeData) {
      final args = routeData.argsAs<AddTodoRouteArgs>(
          orElse: () => const AddTodoRouteArgs());
      return _i3.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i2.AddTodoPage(
          todo: args.todo,
          key: args.key,
        ),
      );
    },
  };

  @override
  List<_i3.RouteConfig> get routes => [
        _i3.RouteConfig(
          '/#redirect',
          path: '/',
          redirectTo: '/home',
          fullMatch: true,
        ),
        _i3.RouteConfig(
          MainTodoRoute.name,
          path: '/home',
        ),
        _i3.RouteConfig(
          AddTodoRoute.name,
          path: '/add-todo-page',
        ),
      ];
}

/// generated route for
/// [_i1.MainTodoPage]
class MainTodoRoute extends _i3.PageRouteInfo<void> {
  const MainTodoRoute()
      : super(
          MainTodoRoute.name,
          path: '/home',
        );

  static const String name = 'MainTodoRoute';
}

/// generated route for
/// [_i2.AddTodoPage]
class AddTodoRoute extends _i3.PageRouteInfo<AddTodoRouteArgs> {
  AddTodoRoute({
    _i5.Todo? todo,
    _i4.Key? key,
  }) : super(
          AddTodoRoute.name,
          path: '/add-todo-page',
          args: AddTodoRouteArgs(
            todo: todo,
            key: key,
          ),
        );

  static const String name = 'AddTodoRoute';
}

class AddTodoRouteArgs {
  const AddTodoRouteArgs({
    this.todo,
    this.key,
  });

  final _i5.Todo? todo;

  final _i4.Key? key;

  @override
  String toString() {
    return 'AddTodoRouteArgs{todo: $todo, key: $key}';
  }
}
