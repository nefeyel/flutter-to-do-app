import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:todo_app_flutter/model/task_data.dart';
import 'task_tile.dart';

class TasksList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(
      builder: (context, taskData, child) {
        return ListView.builder(
          itemBuilder: (context, index) {
            //used bellow in multiple places
            final task = taskData.tasks[index];
            return TaskTile(
              //tapping into tasks list item passing object into the state
              taskTitle: task.name,
              isChecked: task.isDone,
              checkboxCallback: (checkboxState) {
                taskData.updateTask(task);
              },
              longPressDelete: () {
                taskData.removeTask(task);
              },
            );
          },
          itemCount: taskData.taskCount,
        );
      },
    );
  }
}
