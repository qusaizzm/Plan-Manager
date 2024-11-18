import 'package:plan_manager/core/utils/enums.dart';
import 'package:plan_manager/core/utils/get_random_id.dart';
import 'package:plan_manager/my_plan/domain/entities/plan_entites.dart';

class TaskModel extends TaskEntites {
  const TaskModel({
    super.id,
    required super.title,
    required super.completed,
    required super.lastCompletedDate,
    required super.alratDay,
  });

  // Add the copyWith method
  TaskModel copyWith({
    int? id,
    String? title,
    bool? completed,
    String? lastCompletedDate,
    List<AlertDay>? alratDay,
  }) {
    return TaskModel(
      id: id ?? generateRandomId(),
      title: title ?? this.title,
      completed: completed ?? this.completed,
      lastCompletedDate: lastCompletedDate ?? this.lastCompletedDate,
      alratDay: alratDay ?? this.alratDay,
    );
  }

  factory TaskModel.fromMap(Map<String, dynamic> map) {
    return TaskModel(
      id: map['id'],
      title: map['title'],
      completed: map['completed'] == 1,
      lastCompletedDate: map['lastCompletedDate'] ?? DateTime.now().toString(),
      alratDay: map['alratDay'],
    );
  }
}
