part of 'plans_bloc.dart';

class TaskState extends Equatable {
  const TaskState({
    this.getTasks = const [],
    this.getState = RStates.loading,
    this.getMessage = '',
    this.addState = RStates.loading,
    this.addMessage = '',
  });

  final List<TaskEntites> getTasks;
  final RStates addState;
  final String addMessage;
  final RStates getState;
  final String getMessage;

  TaskState copyWith({
    List<TaskEntites>? getTasks,
    RStates? getState,
    String? getMessage,
    RStates? addState,
    String? addMessage,
    bool? isValid,
    // required RStates taskState,
  }) {
    return TaskState(
      addState: addState ?? this.addState,
      addMessage: addMessage ?? this.addMessage,
      getTasks: getTasks ?? this.getTasks,
      getState: getState ?? this.getState,
      getMessage: getMessage ?? this.getMessage,
    );
  }

  @override
  List<Object?> get props =>
      [getTasks, addState, addMessage, getState, getMessage];
}
