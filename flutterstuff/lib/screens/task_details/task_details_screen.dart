import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterstuff/data/db/database.dart';
import 'package:flutterstuff/screens/todo_list_home/todo_list_screen.dart';
import 'package:provider/provider.dart';

class TaskDetailsScreen extends StatefulWidget {
  static const routeName = '/taskDetails';

  @override
  TaskDetailsScreenState createState() {
    return TaskDetailsScreenState();
  }
}

class TaskDetailsScreenState extends State<TaskDetailsScreen> {
  TextEditingController _taskNameController = TextEditingController();
  TextEditingController _taskDescriptionController = TextEditingController();
  bool _isComplete = false;

  bool _hasRetrievedTask = false;

  @override
  Widget build(BuildContext context) {
    final TaskDetailsArguments arguments =
        ModalRoute.of(context).settings.arguments;

    final shouldRetrieveTask = arguments.taskId > -1;

    final database = Provider.of<AppDatabase>(context);

    if (shouldRetrieveTask && !_hasRetrievedTask) {
      database.getSingleTask(arguments.taskId).then((value) {
        setState(() {
          _taskNameController.text = value.name;
          _taskDescriptionController.text = value.description;
          _isComplete = value.isComplete;
          _hasRetrievedTask = true;
        });
      });
    }
    // if (!shouldRetrieveTask && !_hasRetrievedTask) {
    //   _taskData = taskToMutableTask(defaultTask);
    //   _hasRetrievedTask = true;
    // }

    return Scaffold(
      appBar: AppBar(
        title: Text("Edit Task"),
        actions: [
          GestureDetector(
            child: Icon(Icons.save),
            onTap: () {
              final currentTaskData = Task(
                  id: shouldRetrieveTask ? arguments.taskId : null,
                  name: _taskNameController.text,
                  description: _taskDescriptionController.text,
                  isComplete: _isComplete);

              if (shouldRetrieveTask) {
                database.updateTask(currentTaskData);
              } else {
                database.insertTask(currentTaskData);
              }

              Navigator.of(context)
                  .pushReplacementNamed(TodoListScreen.routeName);
            },
          )
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextField(
              decoration: InputDecoration(hintText: "Task Name"),
              controller: _taskNameController,
            ),
            TextField(
              decoration: InputDecoration(hintText: "Task Description"),
              controller: _taskDescriptionController,
            ),
            Row(children: [
              Checkbox(
                  onChanged: (value) {
                    setState(() {
                      _isComplete = value;
                    });
                  },
                  value: _isComplete),
              Text("Is Complete")
            ])
          ],
        ),
      ),
    );
  }
}

class TaskDetailsArguments {
  final int taskId;

  TaskDetailsArguments(this.taskId);
}
