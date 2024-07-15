import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_project2/pages/task_provider.dart';
import 'package:flutter_project2/pages/home_page.dart';
import 'package:flutter_project2/pages/create_task_page.dart';
import 'package:flutter_project2/pages/update_task_page.dart';
import 'package:flutter_project2/pages/not_found_page.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => TaskProvider(),
      child: TodoApp(),
    ),
  );
}

class TodoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case '/':
            return MaterialPageRoute(builder: (_) => HomePage());
          case '/create':
            return MaterialPageRoute(builder: (_) => CreateTaskPage());
          case '/update':
            return MaterialPageRoute(
                builder: (_) =>
                    UpdateTaskPage(task: settings.arguments as String));
          default:
            return MaterialPageRoute(builder: (_) => NotFoundPage());
        }
      },
      onUnknownRoute: (settings) {
        return MaterialPageRoute(builder: (_) => NotFoundPage());
      },
    );
  }
}
