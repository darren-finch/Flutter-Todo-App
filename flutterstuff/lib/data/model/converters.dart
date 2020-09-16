import 'package:flutterstuff/data/db/database.dart';
import 'package:flutterstuff/data/model/mutable_task.dart';

MutableTask taskToMutableTask(Task task) =>
    MutableTask(task.id, task.name, task.description, task.isComplete);

Task mutableTaskToTask(MutableTask mutableTask) => Task(
    id: mutableTask.id,
    name: mutableTask.name,
    description: mutableTask.description,
    isComplete: mutableTask.isComplete);
