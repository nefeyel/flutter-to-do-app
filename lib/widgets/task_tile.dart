import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {
  final bool isChecked;
  final String taskTitle;
  final Function checkboxCallback;
  final Function longPressDelete;

  TaskTile(
      {this.isChecked,
      this.taskTitle,
      this.checkboxCallback,
      this.longPressDelete});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onLongPress: longPressDelete,
      title: Text(
        taskTitle,
        style: TextStyle(
          fontSize: 20.0,
          color: Colors.lightBlueAccent,
          decoration:
              isChecked ? TextDecoration.lineThrough : TextDecoration.none,
        ),
      ),
      trailing: Checkbox(
        activeColor: Colors.lightBlueAccent,
        value: isChecked,
        onChanged: checkboxCallback,
      ),
    );
  }
}
