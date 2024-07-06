import 'package:flutter/material.dart';
import '../db/db_manager.dart';
import '../widgets/task_container.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
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
