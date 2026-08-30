import '../../../export.dart';

class TaskManagerScreen extends StatelessWidget {
  const TaskManagerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Task Manager'),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showAddTaskDialog(context),
        child: const Icon(Icons.add),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const TaskStatistics(),
            const SizedBox(height: 20),
            const Text(
              'Tasks',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            Expanded(
              child: Consumer<TaskProvider>(
                builder: (context, provider, _) {
                  if (provider.tasks.isEmpty) {
                    return const Center(
                      child: Text(
                        'No tasks yet',
                        style: TextStyle(fontSize: 18, color: Colors.grey),
                      ),
                    );
                  }

                  return ListView.builder(
                    itemCount: provider.tasks.length,
                    itemBuilder: (context, index) {
                      final task = provider.tasks[index];

                      return TaskListItem(
                        task: task,
                        onToggle: () => context.read<TaskProvider>().toggleTaskStatus(task.id),
                        onDelete: () => context.read<TaskProvider>().deleteTask(task.id),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _showAddTaskDialog(BuildContext context) async {
    final titleController = TextEditingController();
    final descriptionController = TextEditingController();

    await showDialog(
      context: context,
      builder: (dialogContext) {
        return AlertDialog(
          title: const Text('Add New Task'),
          content: SizedBox(
            width: double.maxFinite,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  key: const ValueKey('taskTitleField'),
                  controller: titleController,
                  decoration: const InputDecoration(
                    labelText: 'Task Title',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 12),
                TextField(
                  key: const ValueKey('taskDescriptionField'),
                  controller: descriptionController,
                  maxLines: 3,
                  decoration: const InputDecoration(
                    labelText: 'Description',
                    border: OutlineInputBorder(),
                  ),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(dialogContext),
              child: const Text('Cancel'),
            ),
            FilledButton(
              onPressed: () {
                final title = titleController.text;
                final description = descriptionController.text;

                if (title.trim().isNotEmpty) {
                  context.read<TaskProvider>().addTask(title, description);
                  Navigator.pop(dialogContext);
                }
              },
              child: const Text('Save Task'),
            ),
          ],
        );
      },
    );
  }
}
