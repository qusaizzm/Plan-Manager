import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:plan_manager/core/error/failure.dart';
import 'package:plan_manager/core/usecase/base_usecase.dart';
import 'package:plan_manager/my_plan/domain/entities/plan_entites.dart';
import 'package:plan_manager/my_plan/domain/repositories/plan_repository_imp.dart';

class InsertTaskUsecase extends BaseUseCase<List<TaskEntites>, AddParameters> {
  final BaseTaskRepositoryImp repository;

  InsertTaskUsecase(this.repository);

  @override
  Future<Either<Failure, List<TaskEntites>>> call(
      AddParameters parameters) async {
    return await repository.insertTask(parameters);
  }
}

class AddParameters extends Equatable {
  final TaskEntites planEntites;

  const AddParameters({required this.planEntites});

  @override
  List<Object> get props => [planEntites];
}
