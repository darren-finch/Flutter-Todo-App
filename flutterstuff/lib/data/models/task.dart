class Task {
  int id;
  String name;
  String description;
  bool isComplete;

  static Task defaultTask = Task(-1, "", "", false);

  Task(this.id, this.name, this.description, this.isComplete);
}
