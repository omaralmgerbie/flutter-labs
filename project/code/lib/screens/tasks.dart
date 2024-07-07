import 'package:flutter/material.dart';
import '../db/db_manager.dart';
import '../components/task_container.dart';

class TasksScreen extends StatefulWidget {
  const TasksScreen({super.key, required this.title});
  final String title;

  @override
  State<TasksScreen> createState() => _TasksScreenState();
}

class _TasksScreenState extends State<TasksScreen> {
  final dbManager = DbManager.instance;
  final GlobalKey<TaskContainerState> taskContainerKey =
      GlobalKey<TaskContainerState>();

  @override
  void initState() {
    super.initState();
  }

  Future<void> _handleLoadAddTodoScreen() async {
    final result = await Navigator.of(context).pushNamed("/task-screen");
    if (result == true) {
      taskContainerKey.currentState?.listAllTasks();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: TaskContainer(key: taskContainerKey, dbManager: dbManager),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _handleLoadAddTodoScreen,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
