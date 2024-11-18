// import 'package:flutter/material.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// import 'package:intl/intl.dart';
// import '../../my_plan/data/models/plan_model.dart';
// import '../../my_plan/domain/repositories/plan_repository.dart';
// import 'package:timezone/data/latest.dart' as tz;
// import 'package:timezone/timezone.dart' as tz;

// class DailyResetService {
//   final FlutterLocalNotificationsPlugin notificationsPlugin =
//       FlutterLocalNotificationsPlugin();
//   final TaskRepository planRepository;

//   DailyResetService(this.planRepository);

//   Future<void> initializeNotifications() async {
//     const android = AndroidInitializationSettings('@mipmap/ic_launcher');
//     const ios = DarwinInitializationSettings();
//     const initSettings = InitializationSettings(android: android, iOS: ios);
//     await notificationsPlugin.initialize(initSettings);

//     // Initialize timezone data
//     tz.initializeTimeZones();
//   }

//   Future<void> scheduleDailyNotification() async {
//     const androidDetails = AndroidNotificationDetails(
//       'daily_reminder',
//       'Daily Reminder',
//       channelDescription: 'Daily task reminder at 6 AM',
//       importance: Importance.max,
//       priority: Priority.high,
//     );
//     const notificationDetails = NotificationDetails(android: androidDetails);

//     // Set the time for 6 AM
//     final now = DateTime.now();
//     final time = tz.TZDateTime.local(now.year, now.month, now.day, 6, 0, 0);
//     final scheduledTime =
//         time.isBefore(now) ? time.add(Duration(days: 1)) : time;

//     await notificationsPlugin.zonedSchedule(
//       0,
//       'Daily Reminder',
//       'Time to check your tasks for today!',
//       scheduledTime,
//       notificationDetails,
//       androidAllowWhileIdle: true,
//       uiLocalNotificationDateInterpretation:
//           UILocalNotificationDateInterpretation.absoluteTime,
//       matchDateTimeComponents:
//           DateTimeComponents.time, // Schedule it daily at the same time
//     );

//     await resetTasks();
//   }

//   Future<void> resetTasks() async {
//     final plans = await planRepository.getTasks();
//     final now = DateTime.now();
//     final today = DateFormat('yyyy-MM-dd').format(now);

//     for (var plan in plans) {
//       final lastCompleted = plan.lastCompletedDate != null
//           ? DateFormat('yyyy-MM-dd').format(plan.lastCompletedDate!)
//           : null;

//       if (lastCompleted != today) {
//         final updatedTask = TaskModel(
//           id: plan.id,
//           title: plan.title,
//           completed: false,
//           lastCompletedDate: now,
//         );
//         await planRepository.updateTask(updatedTask);
//       }
//     }
//   }
// }

// class NotificationServices {
//   // Initialize FlutterLocalNotificationsPlugin
//   static FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
//       FlutterLocalNotificationsPlugin();

//   // GlobalKey for navigation
//   static GlobalKey<NavigatorState> globalKey = GlobalKey<NavigatorState>();

//   // Notification details
//   static NotificationDetails notificationDetails = const NotificationDetails(
//     android: AndroidNotificationDetails(
//       "channelId",
//       "channelName",
//       priority: Priority.high,
//       importance: Importance.high,
//       icon: "@mipmap/ic_launcher",
//     ),
//   );

//   // Initialize method
//   static Future<void> init() async {
//     AndroidInitializationSettings androidInitializationSettings =
//         const AndroidInitializationSettings("@mipmap/ic_launcher");
//     InitializationSettings initializationSettings = InitializationSettings(
//       android: androidInitializationSettings,
//     );
//     await flutterLocalNotificationsPlugin.initialize(
//       initializationSettings,
//       onDidReceiveNotificationResponse: onDidReceiveNotificationResponse,
//       onDidReceiveBackgroundNotificationResponse:
//           onDidReceiveBackgroundNotificationResponse,
//     );
//   }

//   // // Method to request notification permission
//   // static void askForNotificationPermission() {
//   //   Permission.notification.request().then((permissionStatus) {
//   //     if (permissionStatus != PermissionStatus.granted) {
//   //       AppSettings.openAppSettings(type: AppSettingsType.notification);
//   //     }
//   //   });
//   // }

//   // Method to send instant notification
//   static void sendInstantNotification(
//       {required String title, required String body, required String payload}) {
//     flutterLocalNotificationsPlugin.show(
//       0,
//       title,
//       body,
//       notificationDetails,
//       payload: payload,
//     );
//   }

//   // Method to send periodic notification
//   static void sendPeriodicNotification(
//       {required String title, required String body, required String payload}) {
//     flutterLocalNotificationsPlugin.periodicallyShow(
//       1,
//       title,
//       body,
//       RepeatInterval.everyMinute,
//       notificationDetails,
//       payload: payload,
//     );
//   }

//   // Method to cancel periodic notification
//   static Future<void> cancelPeriodicNotification() async {
//     await flutterLocalNotificationsPlugin.cancel(1);
//   }

//   // Method to handle notification response
//   static void onDidReceiveNotificationResponse(NotificationResponse response) {
//     debugPrint("onDidReceiveNotificationResponse");
//     // globalKey.currentState?.pushReplacement(
//     // MaterialPageRoute(
//     //   builder: (context) => DisplayPayload(
//     //     payloadData: response.payload,
//     //   ),
//     // ),
//     // );
//   }

//   // Method to handle background notification response
//   static void onDidReceiveBackgroundNotificationResponse(
//       NotificationResponse response) {
//     debugPrint("onDidReceiveBackgroundNotificationResponse");
//     // globalKey.currentState?.pushReplacement(
//     //   MaterialPageRoute(
//     //     builder: (context) => DisplayPayload(
//     //       payloadData: response.payload,
//     //     ),
//     //   ),
//     // );
//   }
// }
  

//   // if (isSelected) {
//   //                     NotificationServices.sendPeriodicNotification(
//   //                       title: "Test title 2",
//   //                       body: "Test body 2",
//   //                       payload: "Test payload 2",
//   //                     );
//   //                   } else {
//   //                     NotificationServices.cancelPeriodicNotification();
//   //                   }