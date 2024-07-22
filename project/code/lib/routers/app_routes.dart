import 'package:code/models/book.dart';
import 'package:flutter/material.dart';
import 'package:code/hooks/screens.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case '/login':
      return MaterialPageRoute(builder: (context) => const LoginPage());
    case '/':
      return MaterialPageRoute(builder: (context) => const MyHomePage());
    case '/tasks':
      final args = settings.arguments as Map<String, dynamic>? ?? {};
      return MaterialPageRoute(
        builder: (context) => AddTaskScreen(
          title: 'TaskPage',
          initialTask: args['initialTask'] ?? '',
          isUpdate: args['isUpdate'] ?? false,
          taskId: args['taskId'],
        ),
      );
    case '/book':
      final args = settings.arguments as Map<String, dynamic>?;
      if (args == null || args['book'] == null) {
        return MaterialPageRoute(builder: (context) => const NotFound());
      }
      final Book book = args['book'];
      return MaterialPageRoute(
        builder: (context) => BookDetailScreen(book: book),
      );
    default:
      return MaterialPageRoute(builder: (context) => const NotFound());
  }
}
