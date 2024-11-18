import 'package:flutter/material.dart';

/// File: navigation_helper.dart
///
/// Author: Qusai Alsimat
///
/// Date: March 21, 2024
///
/// **Description: This file contains helper functions and extensions related to navigation within the app.**
///
/// Pushes the specified route onto the navigator and replaces the current route with it.

/// Extension providing navigation helper methods on BuildContext.
extension Navigation on BuildContext {
  /// Pushes a named route onto the navigator stack.
  Future<Object?> pushNamed(String route, {Object? arguments}) async {
    return await Navigator.of(this).pushNamed(route, arguments: arguments);
  }

  /// Replaces the current route with a named route on the navigator stack.
  Future<Object?> pushNamedAndReplaceScreen(String route, {Object? arg}) async {
    return await Navigator.of(this).pushReplacementNamed(route, arguments: arg);
  }

  /// Pushes a named route onto the navigator stack and removes all previous routes until a specified predicate is true.
  Future<dynamic> pushNamedAndRemoveUntil(String routeName,
      {Object? arguments, required RoutePredicate predicate}) async {
    return await Navigator.of(this)
        .pushNamedAndRemoveUntil(routeName, predicate, arguments: arguments);
  }

  /// Pushes the specified route onto the navigator.
  Future<Object?> pushReplace(Widget screen) async {
    return await Navigator.pushReplacement(
      this,
      MaterialPageRoute(builder: (BuildContext context) => screen),
    );
  }

  /// Pushes the specified route onto the navigator.
  Future<Object?> pushScreen(Widget screen) async {
    return await Navigator.of(this)
        .push(MaterialPageRoute(builder: (context) => screen));
  }

  /// Pops the current route off the navigator stack.
  void pop({Object? arg}) {
    return Navigator.of(this).pop(arg);
  }
}
