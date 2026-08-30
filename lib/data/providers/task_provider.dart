import 'dart:collection';

import '../../export.dart';

class TaskProvider extends ChangeNotifier {
  final List<Task> _tasks = [];

  List<Task> get tasks => UnmodifiableListView(_tasks);

  int get totalTasks => _tasks.length;

  int get completedTasks => _tasks.where((task) => task.isCompleted).length;

  int get pendingTasks => totalTasks - completedTasks;

  void addTask(String title, String description) {
    final trimmedTitle = title.trim();
    final trimmedDescription = description.trim();

    if (trimmedTitle.isEmpty) {
      return;
    }

    _tasks.add(
      Task(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        title: trimmedTitle,
        description: trimmedDescription,
      ),
    );
    notifyListeners();
  }

  void toggleTaskStatus(String taskId) {
    final taskIndex = _tasks.indexWhere((task) => task.id == taskId);
    if (taskIndex == -1) {
      return;
    }

    _tasks[taskIndex] = _tasks[taskIndex].copyWith(
      isCompleted: !_tasks[taskIndex].isCompleted,
    );
    notifyListeners();
  }

  void deleteTask(String taskId) {
    _tasks.removeWhere((task) => task.id == taskId);
    notifyListeners();
  }
}
