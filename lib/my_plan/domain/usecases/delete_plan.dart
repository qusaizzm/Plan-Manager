import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:plan_manager/core/error/failure.dart';
import 'package:plan_manager/core/usecase/base_usecase.dart';
import 'package:plan_manager/my_plan/domain/entities/plan_entites.dart';
import 'package:plan_manager/my_plan/domain/repositories/plan_repository_imp.dart';

class DeleteTaskUsecase
    extends BaseUseCase<List<TaskEntites>, DeleteAddParameters> {
  final BaseTaskRepositoryImp repository;

  DeleteTaskUsecase(this.repository);

  @override
  Future<Either<Failure, List<TaskEntites>>> call(
      DeleteAddParameters parameters) async {
    return await repository.deleteTask(parameters.id);
  }
}

class DeleteAddParameters extends Equatable {
  final int id;

  const DeleteAddParameters({required this.id});

  @override
  List<Object> get props => [id];
}
