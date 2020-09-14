import 'package:flutterstuff/data/models/task.dart';

class MainRepository {
  MainRepository._();

  int idCounter = 4;

  static List<Task> _tasks = List.from(
    {
      Task(0, "Clean room", "NOOOOO", false),
      Task(1, "Clean truck", "NOOOOOO", true),
      Task(2, "Workout", "YASSSSS", true),
      Task(3, "Go to work", "OMG NOOOOOOOOOOO", false),
    },
  );

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
