import 'package:dartz/dartz.dart';
import 'package:plan_manager/core/error/exceptions.dart';
import 'package:plan_manager/core/error/failure.dart';
import 'package:plan_manager/my_plan/data/datasources/database_helper.dart';
import 'package:plan_manager/my_plan/data/models/plan_model.dart';
import 'package:plan_manager/my_plan/domain/repositories/plan_repository_imp.dart';
import 'package:plan_manager/my_plan/domain/usecases/insert_plan_usecase.dart';
import 'package:plan_manager/my_plan/domain/usecases/update_plan.dart';

class TasksRepository extends BaseTaskRepositoryImp {
  final BaseTaskLocalDataSource dataSource;

  TasksRepository(this.dataSource);

  @override
  Future<Either<Failure, List<TaskModel>>> getTasks() async {
    try {
      final result = await dataSource.getTasks();
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<TaskModel>>> insertTask(
      AddParameters plan) async {
    try {
      final result = await dataSource.insertTask(plan);
      return Right(result); // Return the plan with the new ID
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<TaskModel>>> updateTask(
      UpdateParameters plan) async {
    try {
      final result = await dataSource.updateTask(plan);
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<TaskModel>>> deleteTask(int id) async {
    try {
      final result = await dataSource.deleteTask(id);
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<TaskModel>>> deleteAllTasks() async {
    try {
      final result = await dataSource.deleteAllTasks();
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }
}
