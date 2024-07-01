import 'package:flutter/material.dart';
import 'task_page.dart';

void main() => runApp(TodoApp());

class TodoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Todo App',
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Map<String, dynamic>> todos = [];

  void _addOrUpdateTodo({
    required Map<String, dynamic> todo,
    int? index,
  }) {
    setState(() {
      if (index == null) {
        todos.add(todo);
      } else {
        todos[index] = todo;
      }
    });
  }

  void _toggleTodoStatus(int index) {
    setState(() {
      todos[index]['completed'] = !todos[index]['completed'];
    });
  }

  void _deleteTodo(int index) {
    setState(() {
      todos.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Todo App'),
      ),
      body: ListView.builder(
        itemCount: todos.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Checkbox(
              value: todos[index]['completed'],
              onChanged: (value) {
                _toggleTodoStatus(index);
              },
            ),
            title: Text(todos[index]['title']),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: Icon(Icons.edit),
                  onPressed: () async {
                    final result = await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => TaskPage(
                          task: todos[index],
                        ),
                      ),
                    );
                    if (result != null) {
                      _addOrUpdateTodo(
                        todo: result,
                        index: index,
                      );
                    }
                  },
                ),
                IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () {
                    _deleteTodo(index);
                  },
                ),
              ],
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () async {
          final result = await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => TaskPage(),
            ),
          );
          if (result != null) {
            _addOrUpdateTodo(
              todo: result,
            );
          }
        },
      ),
    );
  }
}
