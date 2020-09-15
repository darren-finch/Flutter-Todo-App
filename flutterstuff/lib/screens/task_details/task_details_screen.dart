import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterstuff/data/db/main_repository.dart';
import 'package:flutterstuff/data/models/task.dart';
import 'package:flutterstuff/screens/todo_list_home/todo_list_screen.dart';

class TaskDetailsScreen extends StatefulWidget {
  static const routeName = '/taskDetails';

  @override
  TaskDetailsScreenState createState() {
    return TaskDetailsScreenState();
  }
}

class TaskDetailsScreenState extends State<TaskDetailsScreen> {
  Task _taskData;
  TextEditingController _taskNameController = TextEditingController();
  TextEditingController _taskDescriptionController = TextEditingController();

  bool _hasRetrievedTask = false;

  @override
  Widget build(BuildContext context) {
    final TaskDetailsArguments arguments =
        ModalRoute.of(context).settings.arguments;

    final shouldRetrieveTask = arguments.taskId > -1;

    if (shouldRetrieveTask && !_hasRetrievedTask) {
      MainRepository.repo.getTask(arguments.taskId).then((value) {
        setState(() {
          _taskData = value;
          _taskNameController.text = _taskData.name;
          _taskDescriptionController.text = _taskData.description;
          _hasRetrievedTask = true;
        });
      });
    } else {
      _taskData = Task.defaultTask;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("Edit Task"),
        actions: [
          GestureDetector(
            child: Icon(Icons.save),
            onTap: () {
              _getTaskData();

              if (shouldRetrieveTask) {
                MainRepository.repo.updateTask(_taskData.id, _taskData);
              } else {
                print("WT FRICK");
                MainRepository.repo.insertTask(_taskData);
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
                      _taskData.isComplete = value;
                    });
                  },
                  value: _taskData.isComplete),
              Text("Is Complete")
            ])
          ],
        ),
      ),
    );
  }

  void _getTaskData() {
    _taskData.name = _taskNameController.text;
    _taskData.description = _taskDescriptionController.text;
  }
}

class TaskDetailsArguments {
  final int taskId;

  TaskDetailsArguments(this.taskId);
}
