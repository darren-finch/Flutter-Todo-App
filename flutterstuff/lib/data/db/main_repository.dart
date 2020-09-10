import 'package:flutterstuff/data/models/task.dart';

class MainRepository {
  MainRepository._();

  static final repo = MainRepository._();

  Future<List<Task>> getTasks() {
    List<Task>.from(
      {
        Task(0, "Clean room", "NOOOOO"),
        Task(1, "Clean truck", "NOOOOOO"),
        Task(2, "Workout", "YASSSSS")
      },
    );
  }
}
