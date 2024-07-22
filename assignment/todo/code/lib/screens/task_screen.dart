import 'package:flutter/material.dart';

class TaskPage extends StatefulWidget {
  const TaskPage({
    super.key,
    required this.title,
    required this.onTaskCreated,
    this.initialTask = '',
    this.isUpdate = false,
  });
  final String title;
  final Function(String) onTaskCreated;
  final String initialTask;
  final bool isUpdate;

  @override
  State<TaskPage> createState() => _TaskPageState();
}

class _TaskPageState extends State<TaskPage> {
  final myController = TextEditingController();

  @override
  void initState() {
    super.initState();
    myController.text = widget.initialTask;
    myController.addListener(_latestValue);
  }

  @override
  void dispose() {
    myController.dispose();
    super.dispose();
  }

  String _latestValue() {
    final text = myController.text;
    return text;
  }

  void _handleSubmit() {
    String taskText = _latestValue();
    if (taskText.isNotEmpty) {
      widget.onTaskCreated(taskText);
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: Center(
          child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Task Todo',
              ),
              controller: myController,
            ),
            TextButton(
              child: const Text('submit'),
              onPressed: () => _handleSubmit(),
            )
          ],
        ),
      )),
    );
  }
}
