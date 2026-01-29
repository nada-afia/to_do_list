import 'dart:io';

import 'task.dart';
import 'taskStatus.dart';

class TaskManager {
  List<Task> tasks = [];

  TaskManager() {
    addTestData();
  }
  void addTestData() {
    for (int i = 1; i <= 20; i++) {
      Task task = Task(title: "task$i", dueDate: "$i/2/2026", description: '');
      tasks.add(task);
    }
  }

  void addTask() {
    print("Enter task title");
    String title = stdin.readLineSync()!;
    print("Enter dueDate");
    String dueDate = stdin.readLineSync()!;
    print("Enter short description ");
    String description = stdin.readLineSync()!;
    Task newTask = Task(
      title: title,
      description: description,
      dueDate: dueDate,
    );
    tasks.add(newTask);
  }

  void showAllTasks() {
    for (var task in tasks) {
      print('---------------');
      task.view();
    }
  }

  void removeTask(String title) {
    if (tasks.isNotEmpty) {
      tasks.removeWhere((task) => task.title == title);
      print("task with $title deleted");
    } else {
      print("No tasks to remove");
    }
  }

  void makeAsComplete(String title) {
    for (Task task in tasks) {
      if (task.title == title) {
        if (task.status == TaskStatus.uncomplete) {
          task.status = TaskStatus.complete;
          print("now task  is completed");
        } else {
          print("task already completed");
        }
        return;
      }
    }
  }

  void changeDueDate(String title) {
    for (Task task in tasks) {
      if (task.title == title) {
        print("Enter new dueDate");
        String newDueDate = stdin.readLineSync()!;
        task.dueDate = newDueDate;
      }
    }
  }

  void showMenu() {
    while (true) {
      print('1 - Add New task');
      print('2 - make task as complete');
      print('3 - delete task');
      print('4 - Show All tasks');
      print('5 - change dueDate');
      print('6 - Exit');
      print('Enter choice:');

      int choice = int.parse(stdin.readLineSync()!);

      switch (choice) {
        case 1:
          addTask();
          break;
        case 2:
          print(" enter task title");
          String title = stdin.readLineSync()!;
          makeAsComplete(title);
          break;
        case 3:
          print(" enter task title");
          String title = stdin.readLineSync()!;
          removeTask(title);
          break;
        case 4:
          showAllTasks();
          break;
        case 5:
          print(" enter task title");
          String title = stdin.readLineSync()!;
          changeDueDate(title);
        case 6:
          print('Exiting...');
          return;
        default:
          print('Invalid choice.');
      }
    }
  }
}
