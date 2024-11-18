import 'package:get_it/get_it.dart';
import 'package:plan_manager/my_plan/data/datasources/database_helper.dart';
import 'package:plan_manager/my_plan/data/repository/plans_repository.dart';
import 'package:plan_manager/my_plan/domain/repositories/plan_repository_imp.dart';
import 'package:plan_manager/my_plan/domain/usecases/delete_all_plan.dart';
import 'package:plan_manager/my_plan/domain/usecases/delete_plan.dart';
import 'package:plan_manager/my_plan/domain/usecases/get_plan_usecase.dart';
import 'package:plan_manager/my_plan/domain/usecases/insert_plan_usecase.dart';
import 'package:plan_manager/my_plan/domain/usecases/update_plan.dart';
import 'package:plan_manager/my_plan/presentation/controller/plans_bloc.dart';

final sl = GetIt.instance;

class ServicesLocator {
  void init() {
    /// Bloc
    sl.registerFactory(() => TaskBloc(sl(), sl(), sl(), sl(), sl()));

    /// Repository
    sl.registerLazySingleton<BaseTaskRepositoryImp>(
        () => TasksRepository(sl()));

    /// Use Cases
    sl.registerLazySingleton(() => GetTasksUseCase(sl()));
    sl.registerLazySingleton(() => InsertTaskUsecase(sl()));
    sl.registerLazySingleton(() => UpdateTaskUsecase(sl()));
    sl.registerLazySingleton(() => DeleteTaskUsecase(sl()));
    sl.registerLazySingleton(() => DeleteAllTaskUsecase(sl()));

    /// DATA SOURCE
    // sl.registerLazySingleton<BaseMovieRemoteDataSource>(
    //     () => MovieRemoteDataSource());
    sl.registerLazySingleton<BaseTaskLocalDataSource>(
        () => TaskLocalDataSource());
  }
}
