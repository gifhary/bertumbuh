import 'package:bertumbuh/constant.dart';
import 'package:bertumbuh/widgets/home_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import 'add_reminder_screen.dart';
import 'login_screen.dart';
import 'models/reminder_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late List<ReminderModel> reminders;

  @override
  void initState() {
    reminders = Constant.reminders;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.green,
          title: const Text(
            'Be Productive, Yusuf',
            style: TextStyle(color: Colors.white),
          ),
          actions: [
            PopupMenuButton<String>(
              onSelected: (String result) {
                switch (result) {
                  case 'History':
                    // Add your history logic here
                    break;
                  case 'Logout':
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LoginScreen()),
                    );
                    break;
                }
              },
              itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
                const PopupMenuItem<String>(
                  value: 'History',
                  child: Text('History'),
                ),
                const PopupMenuItem<String>(
                  value: 'Logout',
                  child: Text('Logout'),
                ),
              ],
              icon: const Icon(
                Icons.more_vert,
                color: Colors.white,
              ),
            ),
          ],
        ),
        body: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                backgroundColor: Colors.green,
                expandedHeight: 240.0,
                floating: false,
                pinned: true,
                flexibleSpace: FlexibleSpaceBar(
                  background: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      children: [
                        Expanded(
                            child: _buildStatusCard('To Do', TaskStatus.todo,
                                count: reminders
                                    .where((element) =>
                                        element.status == TaskStatus.todo)
                                    .length)),
                        Expanded(
                            child: _buildStatusCard(
                                'In Progress', TaskStatus.inProgress,
                                count: reminders
                                    .where((element) =>
                                        element.status == TaskStatus.inProgress)
                                    .length)),
                        Expanded(
                            child: _buildStatusCard(
                                'Resolved', TaskStatus.resolved,
                                count: reminders
                                    .where((element) =>
                                        element.status == TaskStatus.resolved)
                                    .length)),
                      ],
                    ),
                  ),
                ),
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
            ];
          },
          body: TabBarView(
            children: [
              _buildReminderList(TaskStatus.todo),
              _buildReminderList(TaskStatus.inProgress),
              _buildReminderList(TaskStatus.resolved),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.green,
          foregroundColor: Colors.white,
          onPressed: () async {
            final ReminderModel? data = await Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const AddReminderScreen()),
            );
            if (data != null) {
              setState(() {
                reminders.add(data);
              });
            }
          },
          child: const Icon(Icons.add),
        ),
      ),
    );
  }

  Widget _buildReminderList(TaskStatus status) {
    return ListView.builder(
      itemCount: reminders.length,
      padding: const EdgeInsets.all(16),
      itemBuilder: (context, index) {
        if (reminders[index].status != status) {
          return const SizedBox.shrink();
        }
        return Slidable(
          key: ValueKey(index),
          startActionPane: ActionPane(
            motion: const ScrollMotion(),
            dismissible: DismissiblePane(onDismissed: () {}),
            children: [
              if (reminders[index].status != TaskStatus.resolved)
                SlidableAction(
                  borderRadius: BorderRadius.circular(10.0),
                  onPressed: (context) {
                    if (reminders[index].status == TaskStatus.todo) {
                      _onReminderStatusChanged(index, TaskStatus.inProgress);
                    } else {
                      _onReminderStatusChanged(index, TaskStatus.resolved);
                    }
                  },
                  backgroundColor: Colors.green,
                  foregroundColor: Colors.white,
                  icon: Icons.chevron_right,
                  label: reminders[index].status == TaskStatus.todo
                      ? 'Start'
                      : 'Resolve',
                ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: HomeTile(
              reminderItem: reminders[index],
            ),
          ),
        );
      },
    );
  }

  Widget _buildStatusCard(String title, TaskStatus status, {int count = 0}) {
    return AspectRatio(
      aspectRatio: 1.0,
      child: Card(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                title.toUpperCase(),
                textAlign: TextAlign.center,
                style: const TextStyle(color: Colors.green, fontSize: 12),
              ),
              const SizedBox(height: 8),
              Text(
                '$count',
                style: const TextStyle(
                    color: Colors.black,
                    fontSize: 24,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _onReminderStatusChanged(int index, TaskStatus status) {
    setState(() {
      reminders[index] = reminders[index].copyWith(status: status);
    });
  }
}
