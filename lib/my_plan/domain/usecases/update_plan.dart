import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:plan_manager/core/error/failure.dart';
import 'package:plan_manager/core/usecase/base_usecase.dart';
import 'package:plan_manager/my_plan/domain/entities/plan_entites.dart';
import 'package:plan_manager/my_plan/domain/repositories/plan_repository_imp.dart';

class UpdateTaskUsecase
    extends BaseUseCase<List<TaskEntites>, UpdateParameters> {
  final BaseTaskRepositoryImp repository;

  UpdateTaskUsecase(this.repository);

  @override
  Future<Either<Failure, List<TaskEntites>>> call(
      UpdateParameters parameters) async {
    return await repository.updateTask(parameters);
  }
}

class UpdateParameters extends Equatable {
  final TaskEntites planEntites;

  const UpdateParameters({required this.planEntites});

  @override
  List<Object> get props => [planEntites];
}
