import 'package:to_do_list/taskStatus.dart';

class Task {
  String title;
  String description;
  String dueDate;
  TaskStatus status;

  Task({
    required this.title,
    required this.description,
    required this.dueDate,
    this.status = TaskStatus.uncomplete,
  });

  void view() {
    print("task title: $title");
    print("task description: $description");
    print("task dueDate: $dueDate");
    print("status: ${status.name}");
  }
}
