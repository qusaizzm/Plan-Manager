import 'dart:async';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plan_manager/core/usecase/base_usecase.dart';
import 'package:plan_manager/core/utils/enums.dart';
import 'package:plan_manager/l10n/generated/l10n.dart';
import 'package:plan_manager/my_plan/domain/entities/plan_entites.dart';
import 'package:plan_manager/my_plan/domain/usecases/delete_all_plan.dart';
import 'package:plan_manager/my_plan/domain/usecases/delete_plan.dart';
import 'package:plan_manager/my_plan/domain/usecases/get_plan_usecase.dart';
import 'package:plan_manager/my_plan/domain/usecases/insert_plan_usecase.dart';
import 'package:plan_manager/my_plan/domain/usecases/update_plan.dart';

part 'plans_event.dart';
part 'plans_state.dart';

class TaskBloc extends Bloc<TaskEvent, TaskState> {
  TaskBloc(
    this.getTasksUseCase,
    this.addTaskUseCase,
    this.updateTaskUsecase,
    this.deleteTasksUseCase,
    this.deleteAll,
  )
  //  this.getRecommendationUseCase)
  : super(const TaskState()) {
    on<GetTaskEvent>(_getTasks);
    on<AddTaskEvent>(_addTasks);
    on<UpdateTaskEvent>(_updateTasks);
    on<DeleteTaskEvent>(_deleteTasks);
    on<DeleteAllEvent>(_deleteAllTasks);
  }

  final InsertTaskUsecase addTaskUseCase;
  final GetTasksUseCase getTasksUseCase;
  final UpdateTaskUsecase updateTaskUsecase;
  final DeleteTaskUsecase deleteTasksUseCase;
  final DeleteAllTaskUsecase deleteAll;

  ///
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final addTaskController = TextEditingController();
  final timeController = TextEditingController();
  final addTaskFocusNode = FocusNode();
  final timeFocusNode = FocusNode();
  TimeOfDay? selectedTime;
  bool isObscureText = true;

  bool isValidForTextField = false;

  //
  FutureOr<void> _getTasks(GetTaskEvent event, Emitter<TaskState> emit) async {
    final result = await getTasksUseCase(const NoParameters());

    result.fold(
      (l) =>
          emit(state.copyWith(getState: RStates.error, getMessage: l.message)),
      (r) => emit(state.copyWith(getTasks: r, getState: RStates.done)),
    );
  }

  FutureOr<void> _addTasks(AddTaskEvent event, Emitter<TaskState> emit) async {
    final result =
        await addTaskUseCase(AddParameters(planEntites: event.planEntites));

    result.fold(
      (l) =>
          emit(state.copyWith(addState: RStates.error, addMessage: l.message)),
      (r) {
        clear();
        emit(state.copyWith(getTasks: r, addState: RStates.done));
      },
    );
  }

  FutureOr<void> _updateTasks(
      UpdateTaskEvent event, Emitter<TaskState> emit) async {
    final result = await updateTaskUsecase(
        UpdateParameters(planEntites: event.planEntites));

    result.fold((l) {
      emit(state.copyWith(getState: RStates.error, getMessage: l.message));
    }, (r) {
      clear();
      emit(state.copyWith(getTasks: r, getState: RStates.done));
    });
  }

  Future<void> _deleteTasks(
      DeleteTaskEvent event, Emitter<TaskState> emit) async {
    final result = await deleteTasksUseCase(DeleteAddParameters(id: event.id));
    result.fold(
      (failure) => emit(
          state.copyWith(getState: RStates.error, getMessage: failure.message)),
      (success) async {
        emit(state.copyWith(getState: RStates.done));
      },
    );
  }

  Future<void> _deleteAllTasks(
      DeleteAllEvent e, Emitter<TaskState> emit) async {
    final result = await deleteAll(const NoParameters());
    result.fold(
      (failure) => emit(
          state.copyWith(getState: RStates.error, getMessage: failure.message)),
      (success) async {
        emit(state.copyWith(getState: RStates.done));
      },
    );
  }

// Assuming these are the necessary controllers for your form
// Validation method
  String? validate(BuildContext context, {required String value}) {
    if (value.isEmpty) {
      isValidForTextField = false;
      return Languages.of(context).cannotBeEmpty;
    }
    isValidForTextField = true;
    return null;
  }

  bool isValid() {
    final valid =
        addTaskController.text.isNotEmpty && timeController.text.isNotEmpty;
    emit(state.copyWith(isValid: valid)); // Update state with isValid
    return valid;
  }

  clear() {
    addTaskController.clear();
  }
}
