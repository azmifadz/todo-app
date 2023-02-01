import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:todo_flutter/app/feature/main_todo/view/main_todo_page.dart';

/// supported locales in this app
/// the first locale will be the start and fallback locale
const supportedLocales = [Locale('en', 'US')];

class TodoApp extends StatelessWidget {
  const TodoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return EasyLocalization(
      supportedLocales: supportedLocales,
      startLocale: supportedLocales.first,
      fallbackLocale: supportedLocales.first,
      path: 'assets/translations',
      child: Builder(
        builder: (context) {
          return MaterialApp(
            theme: ThemeData(
              appBarTheme: const AppBarTheme(color: Color(0xFF13B9FF)),
              colorScheme: ColorScheme.fromSwatch(
                accentColor: const Color(0xFF13B9FF),
              ),
            ),
            localizationsDelegates: context.localizationDelegates,
            supportedLocales: context.supportedLocales,
            locale: context.locale,
            home: const MainTodoPage(),
          );
        },
      ),
    );
  }
}
