import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plan_manager/core/utils/enums.dart';
import 'package:plan_manager/l10n/controller/localization_cubit.dart';
import 'package:plan_manager/core/services/service_locator.dart';
import 'package:plan_manager/l10n/generated/l10n.dart';
import 'package:plan_manager/my_plan/presentation/controller/plans_bloc.dart';
import 'package:plan_manager/my_plan/presentation/screens/add_update.dart';
import 'package:plan_manager/my_plan/presentation/screens/daily_task_body.dart';

class DailyTaskScreen extends StatelessWidget {
  const DailyTaskScreen({super.key});
  void _changeLanguage(BuildContext context) {
    final currentLocale = BlocProvider.of<LocalizationCubit>(context).state;
    // Change to the opposite language
    final newLocale =
        currentLocale.languageCode == 'en' ? Locale('ar') : Locale('en');
    context.read<LocalizationCubit>().changeLocale(newLocale);
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context3) => sl<TaskBloc>()..add(GetTaskEvent()),
      lazy: true,
      child: BlocListener<TaskBloc, TaskState>(
        listener: (context, state) {
          if (state.addState == RStates.done) {
            // if (Navigator.canPop(context)) {
            Navigator.of(context).pop();
            // }
          }
        },
        child: Scaffold(
          appBar: AppBar(
            title: Text(Languages.of(context).title),
            actions: [
              IconButton(
                icon: Icon(Icons.language),
                onPressed: () {
                  _changeLanguage(context);
                },
              ),
            ],
          ),
          body: GetAllTaskBody(),
          floatingActionButton: Builder(
            builder: (context3) => FloatingActionButton(
              onPressed: () => _addTaskDialog(context3),
              child: Icon(Icons.add),
            ),
          ),
        ),
      ),
    );
  }

  _addTaskDialog(BuildContext context) {
    showModalBottomSheet(
      elevation: 0,
      backgroundColor: Colors.white,
      isScrollControlled: true,
      isDismissible: true,
      context: context,
      builder: (context3) {
        return BlocProvider.value(
          value: context.read<TaskBloc>(),
          child: AddUpdateTask(),
        );
      },
    );
  }
}
