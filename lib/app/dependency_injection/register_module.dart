import 'package:injectable/injectable.dart';
import 'package:todo_flutter/app/routes/app_router.gr.dart';

@module
abstract class RegisterModule {
  @singleton
  AppRouter get appRouter => AppRouter();
}
