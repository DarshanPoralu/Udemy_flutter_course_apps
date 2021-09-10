import 'package:flutter/cupertino.dart';
import 'task.dart';
import 'dart:collection';

class TaskData extends ChangeNotifier{
  List<Task> _tasks = [
    Task(name: 'Buy milk'),
  ];

  UnmodifiableListView get getTasks{
    return UnmodifiableListView(_tasks);
  }

  int get taskCount{
    return _tasks.length;
  }

  void addTasks(String taskTitle){
    _tasks.add(Task(name: taskTitle));
    notifyListeners();
  }

  void updateTasks(Task task){
    task.toggleDone();
    notifyListeners();
  }

  void deleteTask(Task task){
    _tasks.remove(task);
    notifyListeners();
  }

}