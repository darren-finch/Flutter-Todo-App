import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterstuff/screens/task_details/task_details_screen.dart';
import 'package:flutterstuff/screens/todo_list_home/todo_list.dart';

import '../../style.dart';

class TodoListScreen extends StatelessWidget {
  static const routeName = '/';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Daily Tasks"),
      ),
      body: TodoList(),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.pushNamed(context, TaskDetailsScreen.routeName,
              arguments: TaskDetailsArguments(-1));
        },
      ),
      backgroundColor: backgroundColor,
    );
  }
}
