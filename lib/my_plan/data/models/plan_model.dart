import 'package:plan_manager/core/utils/enums.dart';
import 'package:plan_manager/core/utils/get_random_id.dart';
import 'package:plan_manager/my_plan/domain/entities/plan_entites.dart';

class TaskModel extends TaskEntites {
  const TaskModel({
    super.id,
    required super.title,
    required super.completed,
    required super.lastCompletedDate,
    required super.alratDays,
  });

  // Add the copyWith method
  TaskModel copyWith({
    int? id,
    String? title,
    bool? completed,
    String? lastCompletedDate,
    List<AlertDay>? alratDays,
  }) {
    return TaskModel(
      id: id ?? generateRandomId(),
      title: title ?? this.title,
      completed: completed ?? this.completed,
      lastCompletedDate: lastCompletedDate ?? this.lastCompletedDate,
      alratDays: alratDays ?? this.alratDays,
    );
  }

  // // Convert the AlertDay list to a string for storage
  // static String _alertDaysToString(List<AlertDay> alertDays) {
  //   return alertDays
  //       .map((alertDay) => alertDay.toString().split('.').last)
  //       .join(',');
  // }

  // Convert a string back to a list of AlertDay enums
  static List<AlertDay> _stringToAlertDays(String alertDaysString) {
    return alertDaysString
        .split(',')
        .map((day) => AlertDay.values
            .firstWhere((e) => e.toString().split('.').last == day))
        .toList();
  }

  factory TaskModel.fromMap(Map<String, dynamic> map) {
    return TaskModel(
      id: map['id'] as int?,
      title: map['title'],
      completed: map['completed'] == 1,
      lastCompletedDate: map['lastCompletedDate'] ?? DateTime.now().toString(),
      alratDays:
          map['alratDays'] != null ? _stringToAlertDays(map['alratDays']) : [],
    );
  }

  // Map<String, dynamic> toMap() {
  //   return {
  //     'id': id,
  //     'title': title,
  //     'completed': completed ? 1 : 0,
  //     'lastCompletedDate': lastCompletedDate,
  //     // Use the static method _alertDaysToString to convert the list to a string
  //     'alratDays': _alertDaysToString(alratDays),
  //   };
  // }
}
