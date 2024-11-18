import 'package:flutter/material.dart';
import 'package:plan_manager/core/routing/routes.dart';
import 'package:plan_manager/my_plan/presentation/screens/daily_task_screen.dart';

///
/// File: app_router.dart
///
/// Author: Qusai Alsimat
///
/// Date: March 21, 2024
///
/// **Description: This file contains the AppRouter class, which generates routes for navigation in the application.**
///
/// ####  AppRouter Class that generates routes for navigation in the application.

class AppRouter {
  /// Generates the appropriate route based on the provided [settings].
  Route generateRoute(RouteSettings settings) {
    final arguments = settings.arguments as Map<String, dynamic>?;
    debugPrint("ROUTE");
    switch (settings.name) {
      case Routes.homeAppScreen:
        return MaterialPageRoute(
          builder: (_) => const DailyTaskScreen(),
        );
      // case Routes.documentScreen:
      //   if (arguments is Map<String, dynamic> &&
      //       arguments.containsKey('bioselfie')) {
      //     final Bioselfie bioselfie = arguments['bioselfie'];
      //     return MaterialPageRoute(
      //       builder: (_) => DocumentScreen(bioSelfieResult: bioselfie),
      //     );
      //   } else {
      //     // If the arguments are not as expected, return a fallback route
      //     return _handleDefaultRoute();
      //   }

      default:
        return _handleDefaultRoute();
    }
  }

  /// Handles the default route logic when an unrecognized route is encountered.
  Route _handleDefaultRoute() {
    debugPrint("_handleDefaultRoute");
    // int userStatus = UserStore.instance.userStatus;
    // String? userToken = UserStore.instance.userToken;
    // bool hasTravelerDataAndLoggedIn =
    //     ((userToken != null) && (userStatus == 1 || userStatus == 2));

    // Widget defaultWidget = hasTravelerDataAndLoggedIn
    //     ? const LoginScreen(isUserLocallySaved: true)
    //     : const SignUpScreen();
    Widget defaultWidget = const DailyTaskScreen();
    return MaterialPageRoute(
      builder: (_) => defaultWidget,
    );
  }
}
