import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_project2/providers/todo_provider.dart';
import 'package:flutter_project2/models/todo.dart';
import 'task_page.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Todo List'),
      ),
      body: Consumer<TodoProvider>(
        builder: (context, todoProvider, child) {
          return ListView.builder(
            itemCount: todoProvider.todos.length,
            itemBuilder: (context, index) {
              final todo = todoProvider.todos[index];
              return ListTile(
                title: Text(todo.title),
                trailing: Checkbox(
                  value: todo.isCompleted,
                  onChanged: (bool? value) {
                    todoProvider.toggleTodoStatus(todo);
                  },
                ),
                onLongPress: () {
                  todoProvider.deleteTodo(todo);
                },
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    '/task',
                    arguments: TaskArguments(todo: todo),
                  );
                },
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(
            context,
            '/task',
            arguments: TaskArguments(todo: null),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
