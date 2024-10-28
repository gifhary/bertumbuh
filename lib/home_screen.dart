import 'package:bertumbuh/widgets/home_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import 'add_reminder_screen.dart';
import 'models/reminder_model.dart';
import 'models/user_model.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.green,
          title: const Text('Bertumbugh'),
          bottom: const TabBar(
            labelColor: Colors.white,
            indicatorColor: Colors.white,
            tabs: [
              Tab(text: 'To Do'),
              Tab(text: 'Progress'),
              Tab(text: 'Resolved'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            _buildReminderList(TaskStatus.todo),
            _buildReminderList(TaskStatus.inProgress),
            _buildReminderList(TaskStatus.resolved),
          ],
        ),
        floatingActionButton: FloatingActionButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const AddReminderScreen()),
              );
            },
            child: const Icon(Icons.add)),
      ),
    );
  }

  Widget _buildReminderList(TaskStatus status) {
    final List<ReminderModel> reminders = [
      ReminderModel(
        createdByUser: UserModel(
            employeeId: 1,
            name: 'User 1',
            role: 'Dev',
            email: "user1@wolkk.com",
            image: 'assets/ucup.png'),
        assignedToUser: UserModel(
            image: 'assets/ajis.png',
            role: 'Dev',
            employeeId: 2,
            name: 'User 2',
            email: "user2@wolkk.com"),
        priority: TaskPriority.high,
        status: TaskStatus.todo,
        title: 'Reminder 1',
        description: 'Description 1',
        reminderId: 1,
      ),
      ReminderModel(
        createdByUser: UserModel(
            image: 'assets/ivan.png',
            role: 'Tech Lead',
            employeeId: 1,
            name: 'User 3',
            email: "user3@wolkk.com"),
        assignedToUser: UserModel(
            image: 'assets/ivan.png',
            role: 'Dev',
            employeeId: 2,
            name: 'User 3',
            email: "user2@wolkk.com"),
        priority: TaskPriority.medium,
        status: TaskStatus.todo,
        title: 'Reminder 2',
        description: 'Description 2',
        reminderId: 2,
      ),
      ReminderModel(
        createdByUser: UserModel(
            image: 'assets/saye.png',
            employeeId: 1,
            role: 'Dev',
            name: 'User 3',
            email: "user3@wolkk.com"),
        assignedToUser: UserModel(
            role: 'Dev',
            image: 'assets/fran.png',
            employeeId: 2,
            name: 'User 3',
            email: "user2@wolkk.com"),
        priority: TaskPriority.low,
        status: TaskStatus.resolved,
        title: 'Reminder 3',
        description: 'Description 3',
        reminderId: 3,
      ),
    ];

    final filteredReminders =
        reminders.where((reminder) => reminder.status == status).toList();

    return ListView.builder(
      itemCount: filteredReminders.length,
      padding: const EdgeInsets.all(16),
      itemBuilder: (context, index) {
        final reminder = filteredReminders[index];
        return Slidable(
          key: ValueKey(index),
          startActionPane: ActionPane(
            motion: const ScrollMotion(),
            dismissible: DismissiblePane(onDismissed: () {}),
            children: [
              SlidableAction(
                onPressed: (context) {},
                backgroundColor: Colors.green,
                foregroundColor: Colors.white,
                icon: Icons.chevron_right,
                label: 'Start',
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: HomeTile(
              user: reminder.assignedToUser,
            ),
          ),
        );
      },
    );
  }

  Widget trailingTextStyle(TaskPriority priorityType) {
    switch (priorityType) {
      case TaskPriority.low:
        return const Text('Low', style: TextStyle(color: Colors.amber));
      case TaskPriority.medium:
        return const Text('Medium', style: TextStyle(color: Colors.orange));
      case TaskPriority.high:
        return const Text('High', style: TextStyle(color: Colors.red));
      default:
        return const Text('Low', style: TextStyle(color: Colors.amber));
    }
  }
}
