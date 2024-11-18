// lib/domain/repositories/plan_repository_interface.dart
import 'package:dartz/dartz.dart';
import 'package:plan_manager/core/error/failure.dart';
import 'package:plan_manager/my_plan/data/models/plan_model.dart';
import 'package:plan_manager/my_plan/domain/usecases/insert_plan_usecase.dart';
import 'package:plan_manager/my_plan/domain/usecases/update_plan.dart';

abstract class BaseTaskRepositoryImp {
  Future<Either<Failure, List<TaskModel>>> getTasks();
  Future<Either<Failure, List<TaskModel>>> insertTask(AddParameters plan);
  Future<Either<Failure, List<TaskModel>>> updateTask(UpdateParameters plan);
  Future<Either<Failure, List<TaskModel>>> deleteTask(int id);
}
