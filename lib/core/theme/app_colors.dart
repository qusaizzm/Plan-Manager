import 'package:flutter/material.dart';

///
/// File: app_colors.dart
///
/// Author: Qusai Alsimat
///
/// Date:  March 21, 2024
///
/// **Description: This file contains the AppColor class and the AppThemeManager class, which handle the theme configuration of the application.**
///

///
/// A class representing the application Colors.
///
class AppColor {
  final Color primaryColor;
  final Color secondaryColor;
  final Color tertiaryColor;

  final Color primaryBGColor;
  final Color secondaryBGColor;
  final Color tertiaryBGColor;
  final Color primaryTextColor;
  final Color secondaryTextColor;
  final Color tertiaryTextColor;
  final Color greenColor;
  final Color pending;
  final Color primaryColorDark;
  final Color primaryColorLight;
  final Color primaryTextColorGrey;
  final Color primaryTextColorWhite;
  final Color primaryTextColorMaroon;
  final Color noValueTextColor;
  final Color bottomSheetColor;
  final Color textFieldBorderColor;
  final Color textFieldBorderFouceColor;
  final Color textFieldBackgroundColor;
  final Color registrationBackground;
  final Color cardBackground;
  final Color navigationBarBackground;
  final Color navigationBarIcon;
  final Color primaryIconBackground;
  final Color secondaryIconBackground;
  final Color primaryCardBackground;
  final Color primaryIconColor;
  final Color secondaryIconColor;
  final Color tertiaryIconColor;

  ///
  /// Creates an [AppColor] instance.
  ///
  AppColor({
    required this.tertiaryIconColor,
    required this.primaryCardBackground,
    required this.primaryIconBackground,
    required this.secondaryIconBackground,
    required this.textFieldBorderColor,
    required this.textFieldBorderFouceColor,
    required this.tertiaryColor,
    required this.bottomSheetColor,
    required this.tertiaryBGColor,
    required this.primaryBGColor,
    required this.secondaryColor,
    required this.greenColor,
    required this.pending,
    required this.primaryColorDark,
    required this.primaryColorLight,
    required this.secondaryBGColor,
    required this.primaryTextColor,
    required this.secondaryTextColor,
    required this.tertiaryTextColor,
    required this.primaryTextColorGrey,
    required this.primaryTextColorWhite,
    required this.primaryTextColorMaroon,
    required this.noValueTextColor,
    required this.primaryColor,
    required this.textFieldBackgroundColor,
    required this.registrationBackground,
    required this.cardBackground,
    required this.navigationBarBackground,
    required this.navigationBarIcon,
    required this.secondaryIconColor,
    required this.primaryIconColor,
  });
  // Light theme configuration
  static AppColor light = AppColor(
    primaryColor: const Color(0xFF0065DB), // done
    secondaryColor: const Color(0xFFFDA300),
    tertiaryColor: const Color(0xFFFDA300),
    primaryBGColor: const Color(0xFFF0EFEB), // done
    secondaryBGColor: const Color(0xFFFFFFFF), // done
    tertiaryBGColor: const Color(0xFFF0F0F0), // done
    primaryTextColor: const Color(0xFF172243), // done
    secondaryTextColor: const Color(0xFF6A7086), // done
    tertiaryTextColor: const Color(0xFF3C3C3C), // done
    greenColor: const Color(0xFF1AC5B0), // done
    pending: const Color(0xFFFDA300), // done
    primaryColorDark: const Color.fromARGB(255, 0, 44, 147), // done
    primaryColorLight: const Color(0xFF2596be), // done
    primaryTextColorGrey: const Color(0xFFFFFFFF), // done
    primaryTextColorWhite: const Color(0xFFFFFFFF), // done
    primaryTextColorMaroon: const Color(0xFFFDA300),
    noValueTextColor: const Color(0xFFFDA300),
    bottomSheetColor: const Color(0xFFFFFFFF), // done
    textFieldBorderColor: const Color(0xFF6A7086), // done
    textFieldBorderFouceColor: const Color(0xFF2596be), // done
    textFieldBackgroundColor: const Color(0xFFF5F5F5), // done
    registrationBackground: const Color(0xFFFFFFFF), // done
    primaryCardBackground: const Color(0xFF926d92), // done
    cardBackground: const Color(0xFFFFFFFF), // done
    navigationBarBackground: const Color(0xFF542344), // done
    navigationBarIcon: const Color(0xFF683C59), // done
    primaryIconBackground: const Color.fromARGB(255, 232, 247, 251), // done
    secondaryIconBackground: const Color.fromARGB(255, 245, 253, 255),
    primaryIconColor: const Color(0xFF0065DB), // done
    secondaryIconColor: const Color(0xFF926E92), // done
    tertiaryIconColor: const Color(0xFF0065DB), // done
  );
  // Dark theme configuration
  static AppColor dark = AppColor(
    primaryColor: const Color(0xFF0062FF),
    secondaryColor: const Color(0xFF888888),
    tertiaryColor: const Color(0xFF4D4D4D),
    primaryBGColor: const Color(0xFF121212), // done
    secondaryBGColor: const Color(0xFF202020), // done
    tertiaryBGColor: const Color(0xFF2B2B2B), // done
    primaryTextColor: const Color(0xFFFFFFFF), // done
    secondaryTextColor: const Color(0xFFD3D3D3), // done
    tertiaryTextColor: const Color(0xFF888888), // done
    greenColor: const Color(0xFF1AC5B0),
    pending: const Color(0xFFFDA300), // done
    primaryColorDark: const Color.fromARGB(255, 0, 44, 147), // done
    primaryColorLight: const Color(0xFF2596be),
    primaryTextColorGrey: const Color(0xFF2B2B2B), // done
    primaryTextColorWhite: const Color(0xFFFFFFFF), // done
    primaryTextColorMaroon: const Color(0xFF3D3D3D),
    noValueTextColor: const Color(0xFF3D3D3D),
    bottomSheetColor: const Color(0xFF232323),
    textFieldBorderColor: const Color(0xFF2B2B2B), // done
    textFieldBorderFouceColor: const Color(0xFF2596be), // done
    textFieldBackgroundColor: const Color(0xFF202020), // done
    registrationBackground: const Color(0xFF121212), // done
    primaryCardBackground: const Color(0xFF424242), // done
    cardBackground: const Color(0xFF363636), // done
    navigationBarBackground: const Color(0xFF2B2B2B), // done
    navigationBarIcon: const Color(0xFF494949), // done
    primaryIconBackground: const Color(0xFF383838), // done
    secondaryIconBackground: const Color(0xFF444444),
    primaryIconColor: const Color(0xFFE6E7F2), // done
    secondaryIconColor: const Color(0xFF9B9B9B), // done
    tertiaryIconColor: const Color(0xFF2596be), // done
  );
}

///
/// A class responsible for managing the application theme.
///
class AppThemeManager with ChangeNotifier {
  static final AppThemeManager _current = AppThemeManager._();

  AppThemeManager._();

  // Default theme
  AppColor currentTheme = AppColor.light;

  // ///
  // /// Changes the theme mode of the application.
  // ///
  // static void changeThemeMode(
  //     BuildContext context, ThemeMode selectedThemeModeApp) {
  //   if (selectedThemeModeApp == ThemeMode.light) {
  //     setTheme(AppColor.light);
  //     BioSelfieApp.setThemeMode(context, selectedThemeModeApp);
  //   } else {
  //     setTheme(AppColor.dark);
  //     BioSelfieApp.setThemeMode(context, selectedThemeModeApp);
  //   }
  // }

  // ///
  // /// Sets the theme of the application.
  // ///
  // static setTheme(AppColor theme) {
  //   if (theme == AppColor.light) {
  //     UserStore.instance.currentModeDark = "light";
  //     AppThemeManager._current.currentTheme = AppColor.light;
  //   } else {
  //     UserStore.instance.currentModeDark = "dark";
  //     AppThemeManager._current.currentTheme = AppColor.dark;
  //   }
  // }

  // ///
  // /// Gets the current theme mode.
  // ///
  // static ThemeMode getMode() {
  //   String themeMode = UserStore.instance.currentModeDark;
  //   if (themeMode == "light") {
  //     return _mode(ThemeMode.light);
  //   }
  //   return _mode(ThemeMode.dark);
  // }

  ///
  // /// Checks if the current theme is light.
  // ///
  // static bool get isLight {
  //   final mode = getMode();
  //   return mode == ThemeMode.light;
  // }

  // static ThemeMode _mode(ThemeMode themeMode) {
  //   return themeMode;
  // }

  static Color get primaryColor =>
      AppThemeManager._current.currentTheme.primaryColor;
  static Color get secondaryColor =>
      AppThemeManager._current.currentTheme.secondaryColor;
  static Color get tertiaryColor =>
      AppThemeManager._current.currentTheme.tertiaryColor;
  static Color get scanProgressBackground =>
      AppThemeManager._current.currentTheme.primaryBGColor;
  static Color get primaryBGColor =>
      AppThemeManager._current.currentTheme.primaryBGColor;

  static Color get secondaryBGColor =>
      AppThemeManager._current.currentTheme.secondaryBGColor;
  static Color get tertiaryBGColor =>
      AppThemeManager._current.currentTheme.tertiaryBGColor;
  static Color get primaryTextColor =>
      AppThemeManager._current.currentTheme.primaryTextColor;
  static Color get secondaryTextColor =>
      AppThemeManager._current.currentTheme.secondaryTextColor;
  static Color get tertiaryTextColor =>
      AppThemeManager._current.currentTheme.tertiaryTextColor;
  static Color get greenColor =>
      AppThemeManager._current.currentTheme.greenColor;
  static Color get pending => AppThemeManager._current.currentTheme.pending;
  static Color get primaryColorDark =>
      AppThemeManager._current.currentTheme.primaryColorDark;
  static Color get primaryColorLight =>
      AppThemeManager._current.currentTheme.primaryColorLight;
  static Color get primaryTextColorGrey =>
      AppThemeManager._current.currentTheme.primaryTextColorGrey;
  static Color get primaryTextColorWhite =>
      AppThemeManager._current.currentTheme.primaryTextColorWhite;
  static Color get primaryTextColorMaroon =>
      AppThemeManager._current.currentTheme.primaryTextColorMaroon;
  static Color get noValueTextColor =>
      AppThemeManager._current.currentTheme.noValueTextColor;
  static Color get bottomSheetColor =>
      AppThemeManager._current.currentTheme.bottomSheetColor;
  static Color get textFieldBorderColor =>
      AppThemeManager._current.currentTheme.textFieldBorderColor;
  static Color get textFieldBorderFouceColor =>
      AppThemeManager._current.currentTheme.textFieldBorderFouceColor;

  static Color get textFieldBackgroundColor =>
      AppThemeManager._current.currentTheme.textFieldBackgroundColor;

  static Color get registrationBackground =>
      AppThemeManager._current.currentTheme.registrationBackground;

  static Color get cardBackground =>
      AppThemeManager._current.currentTheme.cardBackground;

  static Color get navigationBarBackground =>
      AppThemeManager._current.currentTheme.navigationBarBackground;

  static Color get navigationBarIcon =>
      AppThemeManager._current.currentTheme.navigationBarIcon;
  static Color get primaryIconBackground =>
      AppThemeManager._current.currentTheme.primaryIconBackground;
  static Color get secondaryIconBackground =>
      AppThemeManager._current.currentTheme.secondaryIconBackground;
  static Color get primaryCardBackground =>
      AppThemeManager._current.currentTheme.primaryCardBackground;
  static Color get secondaryIconColor =>
      AppThemeManager._current.currentTheme.secondaryIconColor;
  static Color get primaryIconColor =>
      AppThemeManager._current.currentTheme.primaryIconColor;
  static Color get tertiaryIconColor =>
      AppThemeManager._current.currentTheme.tertiaryIconColor;

  static const nullColor = Color(0xffB9B9B9);
  static const upColor = Color(0xff00B288);
  static const midColor = Color(0xffFF6726);
  static const lowerColor = Color(0xffE8000E);
  static List<Color> languagesLinearGradient = [
    AppThemeManager.primaryColorDark,
    const Color(0xFF2596be).withOpacity(0.6),
  ];
  static List<Color> leadingIconLinearGradient = [
    AppThemeManager.primaryIconBackground,
    AppThemeManager.secondaryIconBackground,
  ];
}

//text
