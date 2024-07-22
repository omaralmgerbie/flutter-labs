import 'package:flutter/material.dart';
import './routers/app_routes.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  void _newTaskAddedToList(String newTask) {}
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Todo List Project',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      initialRoute: '/',
      onGenerateRoute: (settings) => generateRoute(settings),
    );
  }
}
