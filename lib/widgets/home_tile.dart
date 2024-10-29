import 'package:flutter/material.dart';

import '../detail_screen.dart';
import '../models/reminder_model.dart';

class HomeTile extends StatelessWidget {
  final ReminderModel reminderItem;
  const HomeTile({super.key, required this.reminderItem});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
            color: Colors.green), // Set your desired border color here
        borderRadius: BorderRadius.circular(10),
      ),
      child: ListTile(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => DetailScreen(
                      reminderItem: reminderItem,
                    )),
          );
        },
        leading: CircleAvatar(
          backgroundImage: AssetImage(reminderItem.createdByUser.image),
        ),
        title: Text(reminderItem.title),
        subtitle: Text(reminderItem.description),
        trailing: trailingTextStyle(reminderItem.priority),
      ),
    );
  }

  Widget trailingTextStyle(TaskPriority priorityType) {
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
}
