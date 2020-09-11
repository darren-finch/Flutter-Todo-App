import 'package:flutter/cupertino.dart';
import 'package:flutterstuff/data/db/main_repository.dart';
import 'package:flutterstuff/data/models/task.dart';
import 'package:flutterstuff/screens/todo_item.dart';

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
    MainRepository.repo.getTasks().then(
          (value) => setState(
            () {
              allTasks = value;
            },
          ),
        );
    return ListView.builder(
      padding: const EdgeInsets.all(8.0),
      itemCount: allTasks.length,
      itemBuilder: (context, index) {
        return TodoItem(allTasks[index]);
      },
    );
  }
}
