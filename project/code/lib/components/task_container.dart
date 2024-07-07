import 'package:code/models/task.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import '../widgets/task_box.dart';
import '../db/db_manager.dart';
import './toast.dart';

class TaskContainer extends StatefulWidget {
  const TaskContainer({super.key, required this.dbManager});
  final DbManager dbManager;

  @override
  State<TaskContainer> createState() => TaskContainerState();
}

class TaskContainerState extends State<TaskContainer> {
  List<Task> tasks = [];

  @override
  void initState() {
    super.initState();
    listAllTasks();
  }

  Future<void> listAllTasks() async {
    try {
      final allTasks = await widget.dbManager.findAll();
      setState(() {
        tasks = allTasks.map((task) => task).toList();
      });
      if (tasks.isEmpty) {
        showToast("لا يوجد اي مهام!");
      } else {
        showToastSuccess("تم تحميل المهام...");
      }
    } catch (error) {
      showToastError("حدث خطأ في الاتصال بقاعدة البيانات!");
    }
  }

  void _deleteTask(int id) async {
    try {
      await widget.dbManager.delete(id);
      listAllTasks();
    } catch (error) {
      showToast("حدث خطأ!");
    }
  }

  void _updateTask(Task task) async {
    try {
      final result = await Navigator.of(context).pushNamed(
        '/task-screen',
        arguments: {
          'title': 'Update Task',
          'initialTask': task.title,
          'isUpdate': true,
          'taskId': task.id,
        },
      );
      if (result is bool && result) {
        listAllTasks();
      }
    } catch (error) {
      showToast("حدث خطأ!");
    }
  }

  void _done(Task task) async {
    try {
      await widget.dbManager.update(task);
    } catch (error) {
      showToast("حدث خطأ!");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            ...tasks.mapIndexed((index, task) => TaskBox(
                  key: Key(index.toString()),
                  task: task,
                  onDeletePreesed: _deleteTask,
                  onUpdatePressed: _updateTask,
                  isDone: _done,
                )),
          ],
        ),
      ),
    );
  }
}
