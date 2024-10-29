import 'models/reminder_model.dart';
import 'models/user_model.dart';

class Constant {
  static final employees = [
    UserModel(
        employeeId: 1,
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
        employeeId: 1,
        name: 'Fran',
        role: 'Dev',
        email: "user1@wolkk.com",
        image: 'assets/fran.png'),
    UserModel(
        employeeId: 1,
        name: 'Gipari',
        role: 'Dev',
        email: "user1@wolkk.com",
        image: 'assets/saye.png'),
    UserModel(
        employeeId: 1,
        name: 'Ivanov',
        role: 'Dev',
        email: "user1@wolkk.com",
        image: 'assets/ivan.png'),
  ];

  static final List<ReminderModel> reminders = [
    ReminderModel(
      reminderId: 1,
      title: 'Fill quisioner',
      description: 'Create a new project for the client',
      priority: TaskPriority.high,
      status: TaskStatus.todo,
      assignedToUser: UserModel(
          employeeId: 1,
          name: 'Ucup',
          role: 'Dev',
          email: "user1@wolkk.com",
          image: 'assets/ucup.png'),
      createdByUser: UserModel(
          employeeId: 1,
          name: 'Ajiz',
          role: 'Dev',
          email: "user1@wolkk.com",
          image: 'assets/ajis.png'),
    ),
    ReminderModel(
      reminderId: 2,
      title: 'Create a new project',
      description: 'Create a new project for the client',
      priority: TaskPriority.medium,
      status: TaskStatus.inProgress,
      assignedToUser: UserModel(
          employeeId: 1,
          name: 'Ucup',
          role: 'Dev',
          email: "user1@wolkk.com",
          image: 'assets/ucup.png'),
      createdByUser: UserModel(
          employeeId: 1,
          name: 'Ajiz',
          role: 'Dev',
          email: "user1@wolkk.com",
          image: 'assets/ajis.png'),
    ),
    ReminderModel(
      reminderId: 3,
      title: 'Create a new project',
      description: 'Create a new project for the client',
      priority: TaskPriority.low,
      status: TaskStatus.resolved,
      assignedToUser: UserModel(
          employeeId: 1,
          name: 'Ucup',
          role: 'Dev',
          email: "user1@wolkk.com",
          image: 'assets/ucup.png'),
      createdByUser: UserModel(
          employeeId: 1,
          name: 'Ajiz',
          role: 'Dev',
          email: "user1@wolkk.com",
          image: 'assets/ajis.png'),
    ),
    ReminderModel(
      reminderId: 4,
      title: 'Fill wolkk camp quisioner',
      description: 'please fill this link: https://wolkk.com',
      priority: TaskPriority.high,
      status: TaskStatus.todo,
      assignedToUser: UserModel(
          employeeId: 1,
          name: 'Ucup',
          role: 'Dev',
          email: "user1@wolkk.com",
          image: 'assets/ucup.png'),
      createdByUser: UserModel(
          employeeId: 1,
          name: 'Ajiz',
          role: 'Dev',
          email: "user1@wolkk.com",
          image: 'assets/ajis.png'),
    ),
    ReminderModel(
      reminderId: 5,
      title: 'Review the code',
      description: 'PR link: https://github.com',
      priority: TaskPriority.high,
      status: TaskStatus.todo,
      assignedToUser: UserModel(
          employeeId: 1,
          name: 'Ucup',
          role: 'Dev',
          email: "user1@wolkk.com",
          image: 'assets/ucup.png'),
      createdByUser: UserModel(
          employeeId: 1,
          name: 'Fran',
          role: 'Dev',
          email: "user1@wolkk.com",
          image: 'assets/fran.png'),
    ),
    ReminderModel(
      reminderId: 6,
      title: 'Request meeting',
      description: 'meet at 12.00 PM',
      priority: TaskPriority.high,
      status: TaskStatus.todo,
      assignedToUser: UserModel(
          employeeId: 1,
          name: 'Ucup',
          role: 'Dev',
          email: "user1@wolkk.com",
          image: 'assets/ucup.png'),
      createdByUser: UserModel(
          employeeId: 1,
          name: 'Fran',
          role: 'Dev',
          email: "user1@wolkk.com",
          image: 'assets/fran.png'),
    ),
  ];
}
