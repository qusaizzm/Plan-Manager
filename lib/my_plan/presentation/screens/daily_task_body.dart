import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:plan_manager/core/utils/enums.dart';
import 'package:plan_manager/core/utils/helper.dart';
import 'package:plan_manager/core/widgets/gap_speace.dart';
import 'package:plan_manager/my_plan/domain/entities/plan_entites.dart';
import 'package:plan_manager/my_plan/presentation/controller/plans_bloc.dart';

class GetAllTaskBody extends StatelessWidget {
  const GetAllTaskBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TaskBloc, TaskState>(
      builder: (context, state) {
        switch (state.getState) {
          case RStates.loading:
            return const Center(child: CircularProgressIndicator());
          case RStates.done:
            return _body(state);
          case RStates.error:
            return Center(child: Text(state.getMessage));
        }
      },
    );
  }

  Widget _body(TaskState state) {
    final plans = state.getTasks;
    return ListView.builder(
      itemCount: plans.length,
      itemBuilder: (context, index) {
        final plan = plans[index];
        return Dismissible(
          key: ValueKey(plan),
          onResize: () {
            debugPrint("onResize");
          },
          background: Container(
            color: Colors.green,
            alignment: Alignment.centerRight,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: const Icon(Icons.delete, color: Colors.white),
          ),
          onDismissed: (_) {
            _deleteTaskDialog(context, plan.id!); // Delete the task
            showToast("Task deleted");
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              GapSpeace(w: 3),
              Container(
                height: 40.h,
                width: 3,
                decoration: BoxDecoration(
                  color: plan.completed ? Colors.green : Colors.red,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              Expanded(
                child: ListTile(
                  title: Text(plan.title),
                  subtitle: Text(plan.completed ? "Completed" : "Incomplete"),
                  onTap: () {
                    _updateTaskDialog(context, plan);
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  _deleteTaskDialog(BuildContext context, int id) {
    context.read<TaskBloc>().add(DeleteTaskEvent(id));
  }

  void _updateTaskDialog(BuildContext outerContext, TaskEntites planEntites) {
    final titleController = TextEditingController();
    titleController.text = planEntites.title;
    showDialog(
      context: outerContext,
      builder: (context) => AlertDialog(
        title: Text("Update Task"),
        content: TextField(
          controller: titleController,
          decoration: InputDecoration(hintText: "Enter task title"),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text("Cancel"),
          ),
          TextButton(
            onPressed: () {
              if (titleController.text.isNotEmpty) {
                final newTask = TaskEntites(
                  id: planEntites.id,
                  title: titleController.text,
                  completed: false,
                  lastCompletedDate: DateTime.now().toString(),
                  alratDays: [AlertDay.none],
                );
                // Use outerContext to access TaskBloc
                outerContext.read<TaskBloc>().add(UpdateTaskEvent(newTask));
                Navigator.pop(context);
              }
            },
            child: const Text("Update"),
          ),
        ],
      ),
    );
  }
}
