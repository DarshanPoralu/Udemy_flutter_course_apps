import 'package:flutter/material.dart';
import 'task_tile.dart';
import 'package:provider/provider.dart';
import '../models/task_data.dart';

class TasksList extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(
      builder: (context, taskData, child){
        return ListView.builder(
          itemBuilder: (context, index) {
            return TaskTile(
                taskTitle: taskData.getTasks[index].name,
                isChecked: taskData.getTasks[index].isDone,
                checkBoxCallBack: (bool ?newValue){
                    taskData.updateTasks(taskData.getTasks[index]);
                },
                onPress: (){
                  taskData.deleteTask(taskData.getTasks[index]);
                },
            );
          },
          itemCount: taskData.taskCount,
        );
      },
    );
  }
}
