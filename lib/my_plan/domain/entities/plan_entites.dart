import 'package:equatable/equatable.dart';
import 'package:plan_manager/core/utils/enums.dart';
import 'package:plan_manager/core/utils/get_random_id.dart';

class TaskEntites extends Equatable {
  final int? id;
  final String title;
  final bool completed;
  final List<AlertDay> alratDays;
  final String? lastCompletedDate;

  const TaskEntites({
    this.id,
    required this.title,
    required this.completed,
    this.lastCompletedDate,
    required this.alratDays,
  });
  Map<String, dynamic> toMap() {
    return {
      'id': id ?? generateRandomId(),
      'title': title,
      'completed': completed ? 1 : 0,
      'lastCompletedDate': lastCompletedDate,
      'alratDays': _alertDaysToString(alratDays),
    };
  }

  /// Convert the AlertDay list to a string for storage
  static String _alertDaysToString(List<AlertDay> alertDays) {
    return alertDays
        .map((alertDay) => alertDay.toString().split('.').last)
        .join(',');
  }

  @override
  List<Object?> get props => [
        id,
        title,
        completed,
        lastCompletedDate,
        alratDays,
      ];
}
