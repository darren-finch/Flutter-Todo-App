import 'package:flutterstuff/data/models/task.dart';

class MainRepository {
  MainRepository._();

  static final repo = MainRepository._();

  Future<List<Task>> getTasks() {
    return Future<List<Task>>.value(
      List<Task>.from(
        {
          Task(0, "Clean room", "NOOOOO", false),
          Task(1, "Clean truck", "NOOOOOO", true),
          Task(2, "Workout", "YASSSSS", true),
          Task(3, "Go to work", "OMG NOOOOOOOOOOO", false),
        },
      ),
    );
  }
}
