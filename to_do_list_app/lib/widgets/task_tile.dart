import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {

  final bool isChecked;
  final String taskTitle;
  final Function(bool?) checkBoxCallBack;
  final Function() onPress;

  TaskTile({required this.taskTitle, required this.isChecked, required this.checkBoxCallBack, required this.onPress});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onLongPress: onPress,
      title: Text(
        taskTitle,
        style: TextStyle(
            decoration: isChecked ? TextDecoration.lineThrough : null
        ),
      ),
      trailing: Checkbox(
        value: isChecked,
        onChanged: checkBoxCallBack,
        activeColor: Colors.lightBlueAccent,
      ),
    );
  }
}
