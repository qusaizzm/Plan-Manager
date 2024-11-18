import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plan_manager/core/utils/enums.dart';
import 'package:plan_manager/core/utils/helper.dart';
import 'package:plan_manager/core/widgets/app_button.dart';
import 'package:plan_manager/core/widgets/gap_speace.dart';
import 'package:plan_manager/core/widgets/text_field.dart';
import 'package:plan_manager/core/widgets/top_slider_icon.dart';
import 'package:plan_manager/l10n/generated/l10n.dart';
import 'package:plan_manager/my_plan/domain/entities/plan_entites.dart';
import 'package:plan_manager/my_plan/presentation/controller/plans_bloc.dart';

class AddUpdateTask extends StatelessWidget {
  const AddUpdateTask({super.key});

  @override
  Widget build(BuildContext context) {
    final taskBloc = context.read<TaskBloc>();
    return DraggableScrollableSheet(
      initialChildSize: 0.6,
      expand: false,
      builder: (context, scrollController) {
        return Padding(
          padding: EdgeInsets.only(
            left: 20,
            right: 20,
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: ListView(
            controller: scrollController,
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            children: [
              const GapSpeace(),
              const TopSliderIcon(),
              Form(
                key: taskBloc.formKey,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(Languages.of(context).AddTask,
                          textAlign: TextAlign.start,
                          style: Theme.of(context).textTheme.titleLarge),
                      const GapSpeace(),
                      AppTextFormField(
                        maxLength: 60,
                        controller: taskBloc.addTaskController,
                        focusNode: taskBloc.addTaskFocusNode,
                        onFieldSubmitted: (s) {
                          debugPrint(taskBloc.selectedTime.toString());
                          callTimePicker(context, taskBloc);
                        },
                        hintText: Languages.of(context).addTitle,
                        validationMessage: Languages.of(context).cannotBeEmpty,
                        validator: (v) =>
                            taskBloc.validate(context, value: v ?? ""),
                      ),
                      const GapSpeace(),
                      GestureDetector(
                        onTap: () async {
                          callTimePicker(context, taskBloc);
                        },
                        child: AbsorbPointer(
                          // Prevent keyboard input by absorbing touch
                          child: AppTextFormField(
                            controller: taskBloc.timeController,
                            focusNode: taskBloc.timeFocusNode,
                            textInputAction: TextInputAction.done,
                            labelText: "Select Time",
                            readOnly: true, // Prevents direct text input
                            validationMessage: "Please select a time",
                            validator: (v) {
                              if (v == null || v.isEmpty) {
                                return "Time is required";
                              }
                              return null;
                            },
                          ),
                        ),
                      ),
                      const GapSpeace(h: 20),
                      AppButton(
                        isValid: taskBloc.isValid(),
                        onPressed: () {
                          if (taskBloc.formKey.currentState!.validate()) {
                            final planEntites = TaskEntites(
                              title: taskBloc.addTaskController.text,
                              completed: false,
                              lastCompletedDate:
                                  taskBloc.addTaskController.text,
                              alratDay: [AlertDay.none],
                            );
                            _addTaskCall(context, planEntites);
                          } else {
                            showToast("Finsh the fields first");
                          }
                        },
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Future<TimeOfDay?> callTimePicker(
      BuildContext context, TaskBloc taskBloc) async {
    taskBloc.selectedTime = await showTimePicker(
      initialTime: taskBloc.selectedTime ?? TimeOfDay.now(),
      context: context,
      builder: (context, Widget? child) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: false),
          child: child!,
        );
      },
    );
    if (taskBloc.selectedTime != null) {
      // Capture formatted time before the async operation finishes
      // if (!context.mounted) return;
      final formattedTime = taskBloc.selectedTime?.format(context);
      // Update the controller with the selected time
      taskBloc.timeController.text = formattedTime ?? "";
    }
    return taskBloc.selectedTime;
  }

  _addTaskCall(BuildContext context, TaskEntites planEntites) {
    context.read<TaskBloc>().add(AddTaskEvent(planEntites));
  }
}
