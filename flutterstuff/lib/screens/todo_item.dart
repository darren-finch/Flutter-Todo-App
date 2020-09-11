import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterstuff/data/models/task.dart';

class TodoItem extends StatelessWidget {
  final Task task;

  TodoItem(this.task);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(task.title),
        subtitle: Text(task.description),
        leading: Checkbox(
          value: task.isComplete,
          onChanged: (bool value) {
            print(
                "\"${task.title}\" is ${task.isComplete ? "complete." : "not complete."}");
          },
        ),
      ),
    );
  }
}
