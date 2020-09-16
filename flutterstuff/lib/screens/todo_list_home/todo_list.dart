import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutterstuff/data/db/database.dart';
import 'package:flutterstuff/screens/task_details/task_details_screen.dart';
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
