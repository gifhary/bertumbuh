import 'package:flutter/material.dart';

import 'models/reminder_model.dart';

class DetailScreen extends StatelessWidget {
  final ReminderModel reminderItem;
  const DetailScreen({super.key, required this.reminderItem});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          AppBar(backgroundColor: Colors.green, title: const Text('Detail')),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ListTile(
              title: Text(reminderItem.title),
              subtitle: Text(reminderItem.description),
            ),
            ListTile(
              title: const Text('Priority'),
              subtitle: priorityText(reminderItem.priority),
            ),
            ListTile(
              title: const Text('Status'),
              subtitle: statusText(reminderItem.status),
            ),
            ListTile(
              title: const Text('Assigned From'),
              subtitle: Text(reminderItem.createdByUser.name),
              leading: CircleAvatar(
                backgroundImage: AssetImage(reminderItem.createdByUser.image),
              ),
            ),
            ListTile(
              title: const Text('Assigned To'),
              subtitle: Column(
                children: reminderItem.assignedToUser.map((user) {
                  return ListTile(
                    contentPadding: EdgeInsets.zero,
                    title: Text(user.name),
                    leading: CircleAvatar(
                      backgroundImage: AssetImage(user.image),
                    ),
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget priorityText(TaskPriority priorityType) {
    switch (priorityType) {
      case TaskPriority.urgent:
        return const Text('Urgent', style: TextStyle(color: Colors.red));
      case TaskPriority.medium:
        return const Text('Medium', style: TextStyle(color: Colors.green));
      case TaskPriority.high:
        return const Text('High', style: TextStyle(color: Colors.amber));
      default:
        return const Text('Urgent', style: TextStyle(color: Colors.red));
    }
  }

  Widget statusText(TaskStatus statusType) {
    switch (statusType) {
      case TaskStatus.todo:
        return const Text('To Do', style: TextStyle(color: Colors.amber));
      case TaskStatus.inProgress:
        return const Text('In Progress',
            style: TextStyle(color: Colors.orange));
      case TaskStatus.resolved:
        return const Text('Resolved', style: TextStyle(color: Colors.green));
      default:
        return const Text('To Do', style: TextStyle(color: Colors.amber));
    }
  }
}
