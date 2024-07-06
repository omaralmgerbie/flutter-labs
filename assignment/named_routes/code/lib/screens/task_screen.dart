import 'package:code/components/toat.dart';
import 'package:code/db/db_manager.dart';
import 'package:code/models/task.dart';
import 'package:flutter/material.dart';

class TaskPage extends StatefulWidget {
  const TaskPage({
    super.key,
    required this.title,
    this.initialTask = '',
    this.isUpdate = false,
    this.taskId,
  });

  final String title;
  final String initialTask;
  final bool isUpdate;
  final int? taskId;

  @override
  State<TaskPage> createState() => _TaskPageState();
}

class _TaskPageState extends State<TaskPage> {
  final myController = TextEditingController();
  final dbManager = DbManager.instance;

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

  void _handleSubmit() async {
    String taskText = _latestValue();
    if (taskText.isNotEmpty) {
      try {
        if (widget.isUpdate) {
          Task task = Task(id: widget.taskId!, title: taskText, isDone: false);
          await dbManager.update(task);
        } else {
          Task task = Task(title: taskText, isDone: false);
          await dbManager.createTask(task);
        }
        Navigator.pop(context, true);
      } catch (error) {
        showToastError("حدث خطأ!");
      }
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
              child: const Text('Submit'),
              onPressed: _handleSubmit,
            )
          ],
        ),
      )),
    );
  }
}
