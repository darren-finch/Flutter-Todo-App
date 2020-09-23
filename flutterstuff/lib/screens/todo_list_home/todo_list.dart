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
    AppDatabase database = Provider.of<AppDatabase>(context);

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
            // ignore: unnecessary_statements
            _deleteTask() async {
              database.deleteTask(task);
            }

            _deleteTask();
          },
        ),
      ],
      child: Card(
        child: ListTile(
          title: Text(task.name),
          subtitle: Text(task.description),
          leading: Checkbox(
            onChanged: (bool value) {
              // ignore: unnecessary_statements
              _updateTask() async {
                database.updateTask(task.copyWith(isComplete: value));
              }

              _updateTask();
            },
            value: task.isComplete,
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
