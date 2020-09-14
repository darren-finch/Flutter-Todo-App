import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterstuff/data/models/task.dart';
import 'package:flutterstuff/screens/task_details/task_details_screen.dart';

class TodoItem extends StatelessWidget {
  final Task task;

  TodoItem(this.task);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(task.name),
        subtitle: Text(task.description),
        leading: Checkbox(
          value: task.isComplete,
          onChanged: (bool value) {
            print(
                "\"${task.name}\" is ${task.isComplete ? "complete." : "not complete."}");
          },
        ),
        onTap: () {
          Navigator.pushNamed(context, TaskDetailsScreen.routeName,
              arguments: TaskDetailsArguments(task.id));
        },
      ),
    );
  }
}
