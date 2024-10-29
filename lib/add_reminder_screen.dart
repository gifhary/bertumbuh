import 'package:bertumbuh/constant.dart';
import 'package:flutter/material.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';

import 'models/reminder_model.dart';
import 'models/user_model.dart';

class AddReminderScreen extends StatefulWidget {
  const AddReminderScreen({super.key});

  @override
  State<AddReminderScreen> createState() => _AddReminderScreenState();
}

class _AddReminderScreenState extends State<AddReminderScreen> {
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();
  TaskPriority? _priority;
  List<UserModel> _assignedToUser = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Reminder'),
        backgroundColor: Colors.green,
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextField(
                    controller: _titleController,
                    maxLines: 1,
                    decoration: const InputDecoration(
                      labelText: 'Title',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  TextField(
                    controller: _descriptionController,
                    maxLines: 3,
                    decoration: const InputDecoration(
                      labelText: 'Description',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  DropdownButtonFormField<String>(
                    decoration: const InputDecoration(
                      labelText: 'Priority',
                      border: OutlineInputBorder(),
                    ),
                    items: const [
                      DropdownMenuItem(value: 'Medium', child: Text('Medium')),
                      DropdownMenuItem(value: 'High', child: Text('High')),
                      DropdownMenuItem(value: 'Urgent', child: Text('Urgent')),
                    ],
                    onChanged: (value) {
                      setState(() {
                        if (value == 'Medium') {
                          _priority = TaskPriority.medium;
                        } else if (value == 'High') {
                          _priority = TaskPriority.high;
                        } else if (value == 'Urgent') {
                          _priority = TaskPriority.urgent;
                        }
                      });
                    },
                  ),
                  const SizedBox(height: 16.0),
                  MultiSelectDialogField<UserModel>(
                    items: Constant.employees
                        .map((user) =>
                            MultiSelectItem<UserModel>(user, user.name))
                        .toList(),
                    title: const Text("Assignees"),
                    selectedColor: Colors.green,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(5)),
                      border: Border.all(
                        color: Colors.grey,
                        width: 1,
                      ),
                    ),
                    buttonIcon: const Icon(
                      Icons.person,
                      color: Colors.green,
                    ),
                    buttonText: const Text(
                      "Select Assignees",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                      ),
                    ),
                    onConfirm: (results) {
                      setState(() {
                        _assignedToUser = results;
                      });
                    },
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.all(16.0),
                  backgroundColor: Colors.green,
                ),
                onPressed: () {
                  final newReminder = ReminderModel(
                    reminderId: Constant.reminders.length + 1,
                    title: _titleController.text,
                    description: _descriptionController.text,
                    priority: _priority ?? TaskPriority.medium,
                    status: TaskStatus.todo,
                    assignedToUser: [Constant.employees[0]],
                    createdByUser: Constant.employees[1],
                  );
                  Navigator.pop(context, newReminder);
                },
                child:
                    const Text('Save', style: TextStyle(color: Colors.white)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
