import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutterstuff/data/db/database.dart';
import 'package:flutterstuff/misc/constants.dart';
import 'package:flutterstuff/screens/task_details/task_details_screen.dart';
import 'package:flutterstuff/screens/todo_list_home/todo_list.dart';

class TodoItem extends StatefulWidget {
  AppDatabase database;
  Task task;

  TodoItem(this.task, this.database);

  @override
  State<StatefulWidget> createState() {
    return TodoItemState(task, database);
  }
}

class TodoItemState extends State<TodoItem> {
  Task task;
  AppDatabase database;

  TodoItemState(this.task, this.database);

  @override
  Widget build(BuildContext context) {
    return Slidable(
      actionPane: SlidableDrawerActionPane(),
      secondaryActions: [
        IconSlideAction(
          icon: Icons.delete,
          caption: "Delete",
          color: Colors.red,
          onTap: () {
            database.deleteTask(task);
          },
        ),
      ],
      child: Card(
        child: GestureDetector(
          child: CheckboxListTile(
            title: Text(task.name),
            subtitle: Text(task.description),
            value: task.isComplete,
            onChanged: (bool value) {
              database.updateTask(task.copyWith(isComplete: value));
            },
          ),
          onTap: () {
            Navigator.pushNamed(context, TaskDetailsScreen.routeName,
                arguments: TaskDetailsArguments(task.id));
          },
        ),
      ),
    );
  }
}
