import 'dart:collection';

import 'package:flutter/material.dart';
import 'task.dart';

class TaskData extends ChangeNotifier {
  //making properties private is encapsulation, minimizes errors
  //and helps in the future
  List<Task> _tasks = [
    Task(name: 'Buy milk'),
    Task(name: 'Buy eggs'),
    Task(name: 'Buy bread'),
  ];

  //instead of List<Tasks> this class it unmodifiable.. throws errors if tried
  //to modify
  UnmodifiableListView<Task> get tasks => UnmodifiableListView(_tasks);

  int get taskCount {
    return _tasks.length;
  }

  void addTask(String newTaskTitle) {
    _tasks.add(Task(name: newTaskTitle));
    //update all the listeners on the latest state of Task object that they are
    //listening to by calling notifyListeners()
    notifyListeners();
  }

  void updateTask(Task task) {
    task.toggleDone();
    notifyListeners();
  }

  void removeTask(Task taskToRemove) {
    _tasks.remove(taskToRemove);
    notifyListeners();
  }
}
