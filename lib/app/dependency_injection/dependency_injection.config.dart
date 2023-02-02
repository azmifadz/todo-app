// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:todo_flutter/app/dependency_injection/register_module.dart'
    as _i5;
import 'package:todo_flutter/app/feature/main_todo/cubit/main_todo_cubit.dart'
    as _i4;
import 'package:todo_flutter/app/routes/app_router.gr.dart' as _i3;

/// ignore_for_file: unnecessary_lambdas
/// ignore_for_file: lines_longer_than_80_chars
extension GetItInjectableX on _i1.GetIt {
  /// initializes the registration of main-scope dependencies inside of [GetIt]
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final registerModule = _$RegisterModule();
    gh.singleton<_i3.AppRouter>(registerModule.appRouter);
    gh.singleton<_i4.MainTodoCubit>(registerModule.mainTodoCubit);
    return this;
  }
}

class _$RegisterModule extends _i5.RegisterModule {}
