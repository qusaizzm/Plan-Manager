import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:plan_manager/core/local_store/user_store.dart';
import 'package:plan_manager/core/utils/helper.dart';
import 'package:plan_manager/l10n/controller/localization_cubit.dart';
import 'package:plan_manager/l10n/generated/l10n.dart';
import 'package:plan_manager/my_plan/presentation/screens/daily_task_screen.dart';
import 'core/services/service_locator.dart';
import 'core/theme/theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await UserStore.instance.init();
  ServicesLocator().init();
  final initialLocale = Locale(UserStore.instance.currentLocale);
  runApp(MyApp(initialLocale: initialLocale));
}

class MyApp extends StatelessWidget {
  final Locale initialLocale;

  const MyApp({super.key, required this.initialLocale});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => LocalizationCubit()..changeLocale(initialLocale),
      child: BlocBuilder<LocalizationCubit, Locale>(
        builder: (context, locale) {
          return ScreenUtilInit(
              designSize: const Size(375, 812),
              minTextAdapt: true,
              builder: (context, child) {
                return MaterialApp(
                  title: 'Languages.of(context).title',
                  locale: locale,
                  scaffoldMessengerKey: scaffoldMessengerKey,
                  localizationsDelegates: [
                    Languages.delegate,
                    GlobalMaterialLocalizations.delegate,
                    GlobalWidgetsLocalizations.delegate,
                    GlobalCupertinoLocalizations.delegate,
                  ],
                  supportedLocales: Languages.delegate.supportedLocales,
                  home: const DailyTaskScreen(),
                  debugShowCheckedModeBanner: false,
                  themeMode: ThemeMode.system,
                  theme: ThemeClass.lightTheme,
                  darkTheme: ThemeClass.darkTheme,
                );
              });
        },
      ),
    );
  }
}
