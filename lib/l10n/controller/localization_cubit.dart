import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plan_manager/core/local_store/user_store.dart';

class LocalizationCubit extends Cubit<Locale> {
  LocalizationCubit() : super(const Locale('en'));

  // Change the locale based on the passed locale
  void changeLocale(Locale locale) {
    UserStore.instance.currentLocale = locale.languageCode;
    emit(locale);
  }

  // You can also add a method to get the current locale
  Locale get currentLocale => state;

  // Optionally, add a method to toggle between languages (e.g., English and Spanish)
  void toggleLanguage() {
    final currentLanguage = state.languageCode;
    if (currentLanguage == 'en') {
      emit(const Locale('es')); // Switch to Spanish
    } else {
      emit(const Locale('en')); // Switch to English
    }
  }
}
