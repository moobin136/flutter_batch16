import 'package:flutter/material.dart';
import 'package:flutter_batch16/export.dart';

class TaskHomeScreen extends StatefulWidget {
  const TaskHomeScreen({super.key});

  @override
  State<TaskHomeScreen> createState() => _TaskHomeScreenState();
}

class _TaskHomeScreenState extends State<TaskHomeScreen> {
  final List<Map<String, dynamic>> tasks = [
    {
      'title': 'Design mobile app wireframe',
      'subtitle':
          'Create a clear and modern interface for the learning app dashboard...',
      'status': 'In Progress',
      'statusColor': const Color(0xFF00A3FF),
    },
    {
      'title': 'Design mobile app wireframe',
      'subtitle':
          'Create a clear and modern interface for the learning app dashboard...',
      'status': 'Pending',
      'statusColor': const Color(0xFF8A2BE2),
    },
    {
      'title': 'Design mobile app wireframe',
      'subtitle':
          'Create a clear and modern interface for the learning app dashboard...',
      'status': 'Completed',
      'statusColor': const Color(0xFF00C853),
    },
    {
      'title': 'Design mobile app wireframe',
      'subtitle':
          'Create a clear and modern interface for the learning app dashboard...',
      'status': 'Overdue',
      'statusColor': const Color(0xFFFF3D00),
    },
    {
      'title': 'Design mobile app wireframe',
      'subtitle':
          'Create a clear and modern interface for the learning app dashboard...',
      'status': 'Overdue',
      'statusColor': const Color(0xFF00A3FF),
    },
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        body: Column(
          children: [
            const SizedBox(
              // color: Colors.white,
              child: TabBar(
                dividerColor: Colors.transparent,
                isScrollable: false,
                labelColor: AppColors.primaryAppColor,
                unselectedLabelColor: Colors.black,
                indicatorColor: AppColors.primaryAppColor,
                indicatorSize: TabBarIndicatorSize.label,
                labelStyle:
                    TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                tabs: [
                  Tab(text: 'All'),
                  Tab(text: 'Pending'),
                  Tab(text: 'In Progress'),
                  Tab(text: 'Completed'),
                ],
              ),
            ),
            Expanded(
              child: TabBarView(
                children: [
                  _buildTaskList(),
                  _buildTaskList(),
                  _buildTaskList(),
                  _buildTaskList(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTaskList() {
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: tasks.length,
      itemBuilder: (context, index) {
        final task = tasks[index];
        return Card(
          elevation: 0,
          margin: const EdgeInsets.only(bottom: 12),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
            side: BorderSide(color: Colors.grey.shade200),
          ),
          child: Padding(
            padding: const EdgeInsets.all(14),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  task['title'],
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  task['subtitle'],
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey.shade600,
                    height: 1.3,
                  ),
                ),
                const SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Status Badge
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 4),
                      decoration: BoxDecoration(
                        color: task['statusColor'],
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        task['status'],
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 11,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        IconButton(
                          constraints: const BoxConstraints(),
                          padding: const EdgeInsets.all(4),
                          icon: const Icon(Icons.edit_note,
                              color: Color(0xFF00C853), size: 22),
                          onPressed: () {},
                        ),
                        const SizedBox(width: 8),
                        IconButton(
                          constraints: const BoxConstraints(),
                          padding: const EdgeInsets.all(4),
                          icon: const Icon(Icons.delete_outline,
                              color: Colors.redAccent, size: 20),
                          onPressed: () {},
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
