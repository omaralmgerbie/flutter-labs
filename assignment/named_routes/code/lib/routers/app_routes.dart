import 'package:flutter/material.dart';
import '../screens/home_screen.dart';
import '../screens/task_screen.dart';
import '../screens/not_found.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case '/':
      return MaterialPageRoute(
          builder: (context) => const MyHomePage(title: 'My Todos'));
    case '/task-screen':
      final args = settings.arguments as Map<String, dynamic>;
      return MaterialPageRoute(
        builder: (context) => TaskPage(
          title: 'TaskPage',
          initialTask: args['initialTask'] ?? '',
          isUpdate: args['isUpdate'] ?? false,
          taskId: args['taskId'],
        ),
      );
    default:
      return MaterialPageRoute(builder: (context) => const NotFound());
  }
}
