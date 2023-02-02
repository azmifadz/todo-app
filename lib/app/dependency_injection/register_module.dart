import 'package:injectable/injectable.dart';
import 'package:todo_flutter/app/feature/main_todo/cubit/main_todo_cubit.dart';
import 'package:todo_flutter/app/repositories/todos_repository.dart';
import 'package:todo_flutter/app/routes/app_router.gr.dart';

@module
abstract class RegisterModule {
  @singleton
  AppRouter get appRouter => AppRouter();

  @singleton
  MainTodoCubit get mainTodoCubit => MainTodoCubit(todosRepository: TodosRepository.instance);
}
