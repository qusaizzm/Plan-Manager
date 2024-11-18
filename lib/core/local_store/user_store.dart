import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:plan_manager/core/utils/preference_key.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// File: user_store.dart
///
/// Author: Qusai Alsimat
///
/// Date: March 21, 2024
///
/// **Description: This file contains the UserStore class, which manages user-related data stored locally using SharedPreferences.**
///
/// Store is an abstract class for the Local Store handling classes.
abstract class Store {
  /// Initializing the store.
  Future<void> init();
}

/// Class managing user-related data stored locally using SharedPreferences.
class UserStore implements Store {
  static SharedPreferences? _preferences;
  final PreferencesKey _keys = PreferencesKey();

  /// Private constructor.
  UserStore._();

  /// Initializes the store.
  @override
  Future<void> init() async {
    _preferences ??= await SharedPreferences.getInstance();
  }

  /// Public shared instance.
  static final instance = UserStore._();

  /// Indicates whether the get data.
  String getModel(String kay) {
    return _preferences?.getString(kay) ?? "";
  }

  saveModel(String key, dynamic model) {
    String jsonString = jsonEncode(model);
    _preferences?.setString(key, jsonString);
  }

  // /// Indicates whether the user is the main user.
  // bool get isMainUser {
  //   return _preferences?.getBool(_keys.userType) ?? true;
  // }

  // set isMainUser(bool traveler) {
  //   _preferences?.setBool(_keys.userType, traveler);
  // }

  // /// Gets the user token.
  // String? get userToken =>
  //     _preferences?.getString(_keys.userToken);

  // /// Sets the user token.
  // set userToken(String? token) {
  //   if (token != null) {
  //     _preferences?.setString(_keys.userToken, token);
  //   } else {
  //     _preferences?.remove(_keys.userToken);
  //   }
  // }

  /// Gets the current locale.
  String get currentLocale => _preferences?.getString(_keys.locale) ?? 'en';

  /// Sets the current locale.
  set currentLocale(String code) {
    _preferences?.setString(_keys.locale, code);
  }

  /// Sets the current Theme Mode.
  set currentModeDark(String code) {
    _preferences?.setString(_keys.themeMode, code);
  }

  /// Gets the current Theme Mode.
  String get currentModeDark =>
      _preferences?.getString(_keys.themeMode) ?? 'light';

  /// Clears all SharedPreferences data.
  Future<bool> clearSharedPreferences() async {
    try {
      if (_preferences != null) {
        await _preferences!.clear();
        debugPrint('SharedPreferences cleared.');
        return true;
      } else {
        debugPrint('SharedPreferences is null. Unable to clear.');
        return false;
      }
    } catch (e) {
      debugPrint('Error clearing SharedPreferences: $e');
      return false;
    }
  }
}
