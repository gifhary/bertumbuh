import 'user_model.dart';

enum TaskPriority { low, medium, high }

enum TaskStatus { todo, inProgress, resolved }

class ReminderModel {
  final UserModel createdByUser;
  final UserModel assignedToUser;
  final TaskPriority priority;
  final TaskStatus status;
  final String title;
  final String description;
  final int reminderId;
  final String? feedBack;

  ReminderModel({
    required this.createdByUser,
    required this.assignedToUser,
    required this.priority,
    required this.status,
    required this.title,
    required this.description,
    required this.reminderId,
    this.feedBack,
  });
}
