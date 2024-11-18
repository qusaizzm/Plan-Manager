import 'package:equatable/equatable.dart';
import 'package:plan_manager/core/utils/enums.dart';

class TaskEntites extends Equatable {
  final int? id;
  final String title;
  final bool completed;
  final List<AlertDay> alratDay;
  final String? lastCompletedDate;

  const TaskEntites({
    this.id,
    required this.title,
    required this.completed,
    this.lastCompletedDate,
    required this.alratDay,
  });
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'completed': completed ? 1 : 0,
      'lastCompletedDate': lastCompletedDate,
      'alratDay': alratDay,
    };
  }

  @override
  List<Object?> get props => [
        id,
        title,
        completed,
        lastCompletedDate,
        alratDay,
      ];
}
