import 'package:bertumbuh/widgets/home_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import 'models/reminder_model.dart';
import 'models/user_model.dart';

final employees = [
  UserModel(
      employeeId: 0,
      name: 'Ucup',
      role: 'Dev',
      email: "user1@wolkk.com",
      image: 'assets/ucup.png'),
  UserModel(
      employeeId: 1,
      name: 'Ajiz',
      role: 'Dev',
      email: "user1@wolkk.com",
      image: 'assets/ajis.png'),
  UserModel(
      employeeId: 2,
      name: 'Fran',
      role: 'Dev',
      email: "user1@wolkk.com",
      image: 'assets/fran.png'),
  UserModel(
      employeeId: 3,
      name: 'Gipari',
      role: 'Dev',
      email: "user1@wolkk.com",
      image: 'assets/saye.png'),
  UserModel(
      employeeId: 4,
      name: 'Ivanov',
      role: 'Dev',
      email: "user1@wolkk.com",
      image: 'assets/ivan.png'),
];

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int? _expandedId;

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
      ),
    );
  }

  Widget _buildReminderList(TaskStatus status) {
    return ListView.builder(
      itemCount: employees.length,
      padding: const EdgeInsets.all(16),
      itemBuilder: (context, index) {
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
          child: HomeTile(
            expanded: employees[index].employeeId == _expandedId,
            user: employees[index],
            onTap: () {
              setState(() {
                _expandedId = _expandedId != employees[index].employeeId
                    ? employees[index].employeeId
                    : null;
              });
            },
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
