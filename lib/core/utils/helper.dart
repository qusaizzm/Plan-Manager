import 'package:flutter/material.dart';

final GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey =
    GlobalKey<ScaffoldMessengerState>();

void showToast(String? message) {
  final snackBar = SnackBar(
    behavior: SnackBarBehavior.floating,
    content: Center(child: Text(message ?? 'Error !!')),
  );
  scaffoldMessengerKey.currentState?.showSnackBar(snackBar);
}

Future<TimeOfDay?> stringToTimeOfDay(String timeString) async {
  try {
    // Split the string into hours and minutes
    final parts = timeString.split(':');
    if (parts.length != 2) {
      throw FormatException('Invalid time format');
    }

    final hour = int.parse(parts[0]);
    final minute = int.parse(parts[1]);

    // Check if the hour and minute are in valid ranges
    if (hour < 0 || hour > 23 || minute < 0 || minute > 59) {
      throw FormatException('Time values are out of range');
    }

    return TimeOfDay(hour: hour, minute: minute);
  } catch (e) {
    // If parsing fails, return null
    debugPrint('Error parsing time string: $e');
    return null;
  }
}
