import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:plan_manager/core/error/failure.dart';
import 'package:plan_manager/core/usecase/base_usecase.dart';
import 'package:plan_manager/my_plan/domain/entities/plan_entites.dart';
import 'package:plan_manager/my_plan/domain/repositories/plan_repository_imp.dart';

class GetDetailsTaskUsecase
    extends BaseUseCase<List<TaskEntites>, GetDetailsAddParameters> {
  final BaseTaskRepositoryImp repository;

  GetDetailsTaskUsecase(this.repository);

  @override
  Future<Either<Failure, List<TaskEntites>>> call(
      GetDetailsAddParameters parameters) async {
    return await repository.getTasks();
  }
}

class GetDetailsAddParameters extends Equatable {
  final int id;

  const GetDetailsAddParameters({required this.id});

  @override
  List<Object> get props => [id];
}
