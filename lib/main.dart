// import 'package:device_preview/device_preview.dart';
// import 'export.dart';
//
// void main() {
//   runApp(
//     DevicePreview(
//       builder: (context) => const MyApp(),
//     ),
//   );
// }

import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    DevicePreview(
      builder: (context) => const TaskiApp(),
    ),
  );
}

// Task Model
class TodoTask {
  String title;
  bool isCompleted;

  TodoTask({
    required this.title,
    this.isCompleted = false,
  });
}

class TaskiApp extends StatefulWidget {
  const TaskiApp({super.key});

  @override
  State<TaskiApp> createState() => _TaskiAppState();
}

class _TaskiAppState extends State<TaskiApp> {
  final List<TodoTask> _tasks = [
    TodoTask(title: 'Buy groceries'),
    TodoTask(title: 'Complete Flutter Assignment', isCompleted: true),
    TodoTask(title: 'Walk the dog'),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Taski Todo App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => HomeScreen(
              tasks: _tasks,
              onTaskChanged: () => setState(() {}),
            ),
        '/create-task': (context) => CreateTaskScreen(
              onTaskAdded: (newTitle) {
                setState(() {
                  _tasks.add(TodoTask(title: newTitle));
                });
              },
            ),
      },
    );
  }
}

// Home Screen
class HomeScreen extends StatefulWidget {
  final List<TodoTask> tasks;
  final VoidCallback onTaskChanged;

  const HomeScreen({
    super.key,
    required this.tasks,
    required this.onTaskChanged,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final pendingTasks = widget.tasks.where((t) => !t.isCompleted).toList();
    final completedTasks = widget.tasks.where((t) => t.isCompleted).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(_selectedIndex == 0 ? 'Todo Tasks' : 'Completed Tasks'),
        centerTitle: true,
        backgroundColor: Colors.blue.shade100,
      ),
      body: _selectedIndex == 0
          ? _buildTaskList(pendingTasks, isCompletedTab: false)
          : _buildTaskList(completedTasks, isCompletedTab: true),
      floatingActionButton: _selectedIndex == 0
          ? FloatingActionButton(
              onPressed: () => Navigator.pushNamed(context, '/create-task'),
              child: const Icon(Icons.add),
            )
          : null,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) => setState(() => _selectedIndex = index),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'Todo',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.check_circle),
            label: 'Completed',
          ),
        ],
      ),
    );
  }

  Widget _buildTaskList(List<TodoTask> currentTasks,
      {required bool isCompletedTab}) {
    if (currentTasks.isEmpty) {
      return const Center(
        child: Text(
          'No tasks found!',
          style: TextStyle(fontSize: 18, color: Colors.grey),
        ),
      );
    }

    return ListView.builder(
      padding: const EdgeInsets.all(8),
      itemCount: currentTasks.length,
      itemBuilder: (context, index) {
        final task = currentTasks[index];

        return Container(
          margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.15),
                spreadRadius: 2,
                blurRadius: 6,
              )
            ],
          ),
          child: ListTile(
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
            leading: Checkbox(
              value: task.isCompleted,
              onChanged: (bool? value) {
                setState(() {
                  task.isCompleted = value ?? false;
                });
                widget.onTaskChanged();
              },
            ),
            title: Text(
              task.title,
              style: TextStyle(
                decoration:
                    task.isCompleted ? TextDecoration.lineThrough : null,
                color: task.isCompleted ? Colors.grey : Colors.black87,
                fontSize: 16,
              ),
            ),
            trailing: IconButton(
              icon: const Icon(Icons.delete, color: Colors.redAccent),
              onPressed: () {
                setState(() {
                  widget.tasks.remove(task);
                });
                widget.onTaskChanged();
              },
            ),
          ),
        );
      },
    );
  }
}

// Create New Task Screen
class CreateTaskScreen extends StatefulWidget {
  final Function(String) onTaskAdded;

  const CreateTaskScreen({super.key, required this.onTaskAdded});

  @override
  State<CreateTaskScreen> createState() => _CreateTaskScreenState();
}

class _CreateTaskScreenState extends State<CreateTaskScreen> {
  final TextEditingController _controller = TextEditingController();

  void submitData() {
    final text = _controller.text.trim();
    if (text.isEmpty) return;

    widget.onTaskAdded(text);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create New Task'),
        backgroundColor: Colors.blue.shade100,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _controller,
              decoration: const InputDecoration(
                labelText: 'Task Title',
                border: OutlineInputBorder(),
                hintText: 'What needs to be done?',
              ),
              autofocus: true,
              onSubmitted: (_) => submitData(),
            ),
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text('Cancel'),
                ),
                const SizedBox(width: 12),
                ElevatedButton(
                  onPressed: submitData, // ← Fixed here
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 24, vertical: 12),
                  ),
                  child: const Text('Save Task'),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
