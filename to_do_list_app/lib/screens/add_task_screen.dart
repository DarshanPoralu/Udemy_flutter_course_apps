import 'package:flutter/material.dart';
import '../models/task_data.dart';
import 'package:provider/provider.dart';

class AddTaskScreen extends StatelessWidget {

  String newTaskTitle = '';
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xff757575),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 20.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(20.0),
            topLeft: Radius.circular(20.0),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Add Task',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.lightBlueAccent, fontSize: 30.0),
            ),
            SizedBox(
              height: 10.0,
            ),
            TextField(
              autofocus: true,
              textAlign: TextAlign.center,
              onChanged: (value){
                newTaskTitle = value;
              },
            ),
            SizedBox(
              height: 20.0,
            ),
            TextButton(
              onPressed: () {
                Provider.of<TaskData>(context, listen: false).addTasks(newTaskTitle);
                Navigator.pop(context);
              },
              child: Text(
                'Add',
                style: TextStyle(color: Colors.white, fontSize: 18.0),
              ),
              style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all<Color>(Colors.lightBlueAccent),
              ),
            )
          ],
        ),
      ),
    );
  }
}
