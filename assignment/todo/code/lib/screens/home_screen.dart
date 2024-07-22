import 'package:flutter/material.dart';
import 'package:collection/collection.dart';
import './task_screen.dart';
import '../widgets/task_box.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<String> tasks = [];

  void _newTaskAddedToList(String newTask) {
    setState(() {
      tasks.add(newTask);
    });
  }

  void _taskDelete(int index) {
    print(index);
    setState(() {
      tasks.removeAt(index);
    });
  }

  void _updateTask(int index, String updatedTask) {
    setState(() {
      tasks[index] = updatedTask;
    });
  }

  void _onPressed() {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return TaskPage(title: 'TaskPage', onTaskCreated: _newTaskAddedToList);
    }));
  }

  void _onTaskUpdatePressed(int index, String currentTask) {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return TaskPage(
        title: 'Update Task',
        onTaskCreated: (updatedTask) => _updateTask(index, updatedTask),
        initialTask: currentTask,
        isUpdate: true,
      );
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              ...tasks
                  .mapIndexed((index, task) => TaskBox(
                        key: Key(index.toString()),
                        index: index,
                        title: task,
                        onDeletePreesed: _taskDelete,
                        onUpdatePressed: _onTaskUpdatePressed,
                      ))
                  .toList(),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _onPressed,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
