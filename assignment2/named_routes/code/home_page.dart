import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'task_provider.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final taskProvider = Provider.of<TaskProvider>(context);

    return Scaffold(
      appBar: AppBar(title: Text('Todo App')),
      body: ListView.builder(
        itemCount: taskProvider.tasks.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(taskProvider.tasks[index]),
            trailing: IconButton(
              icon: Icon(Icons.delete),
              onPressed: () {
                taskProvider.deleteTask(index);
              },
            ),
            onTap: () {
              Navigator.pushNamed(
                context,
                '/update',
                arguments: taskProvider.tasks[index],
              ).then((updatedTask) {
                if (updatedTask != null) {
                  taskProvider.updateTask(index, updatedTask as String);
                }
              });
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final result = await Navigator.pushNamed(context, '/create');
          if (result != null) {
            taskProvider.addTask(result as String);
          }
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

