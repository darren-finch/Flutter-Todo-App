import 'package:flutterstuff/data/models/task.dart';

class MainRepository {
  MainRepository._();

  int idCounter = 0;

  var _tasks = List<Task>();

  static final repo = MainRepository._();

  Future<List<Task>> getTasks() {
    return Future<List<Task>>.value(_tasks);
  }

  Future<Task> getTask(int taskId) {
    return Future<Task>.value(
        _tasks.singleWhere((element) => element.id == taskId));
  }

  void insertTask(Task newTask) {
    newTask.id = idCounter++;
    _tasks.add(newTask);
  }

  void updateTask(int oldTaskId, Task newTaskData) {
    _tasks.insert(oldTaskId, newTaskData);
  }

  bool deleteTask(int oldTaskId) {
    return _tasks
        .remove(_tasks.singleWhere((element) => element.id == oldTaskId));
  }
}
