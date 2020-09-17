import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutterstuff/data/db/database.dart';
import 'package:flutterstuff/screens/todo_list_home/todo_item.dart';
import 'package:provider/provider.dart';

class TodoList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return TodoListState();
  }
}

class TodoListState extends State<TodoList> {
  List<Task> allTasks = List.empty();

  @override
  Widget build(BuildContext context) {
    final database = Provider.of<AppDatabase>(context);

    return StreamBuilder(
      stream: database.watchAllTasks(),
      builder: (context, AsyncSnapshot<List<Task>> snapshot) {
        final tasks = snapshot.data ?? List();

        return ListView.builder(
          itemCount: tasks.length,
          itemBuilder: (_, index) {
            return _buildTodoItem(tasks[index], database);
          },
        );
      },
    );
  }

  Widget _buildTodoItem(Task task, AppDatabase database) {
    return TodoItem(task, database);
  }
}
