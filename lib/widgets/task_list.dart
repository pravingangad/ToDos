import 'package:flutter/material.dart';
import 'package:todos/widgets/task_tile.dart';
import 'package:provider/provider.dart';
import 'package:todos/models/task_Data.dart';

class TaskList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(
      builder: (context, TaskData, child) {
        return ListView.builder(
          itemBuilder: (context, index) {
            final task = TaskData.tasks[index];
            return TaskTile(
              taskTitle: task.name,
              isChecked: task.isDone,
              checkboxCallback: (bool checkBoxState) {
                TaskData.updateTask(task);
              },
              longPressCallback: () {
                TaskData.deleteTask(task);
              },
            );
          },
          itemCount: TaskData.taskCount,
        );
      },
    );
  }
}
