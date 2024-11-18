part of 'plans_bloc.dart';

abstract class TaskEvent extends Equatable {
  const TaskEvent();
}

class GetTaskEvent extends TaskEvent {
  @override
  List<Object> get props => [];
}

class AddTaskEvent extends TaskEvent {
  final TaskEntites planEntites; // Include the plan data

  const AddTaskEvent(this.planEntites);
  @override
  List<Object> get props => [planEntites];
}

class UpdateTaskEvent extends TaskEvent {
  final TaskEntites planEntites; // Include the plan data

  const UpdateTaskEvent(this.planEntites);
  @override
  List<Object> get props => [planEntites];
}

class DeleteTaskEvent extends TaskEvent {
  final int id; // ID of the plan to be deleted

  const DeleteTaskEvent(this.id);
  @override
  List<Object> get props => [id];
}

class DeleteAllEvent extends TaskEvent {
  @override
  List<Object> get props => [];
}
