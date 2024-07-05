import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_project2/models/todo.dart';
import 'package:flutter_project2/providers/todo_provider.dart';

class TaskArguments {
  final Todo? todo;

  TaskArguments({required this.todo});
}

class TaskPage extends StatefulWidget {
  final TaskArguments taskArguments;

  TaskPage({required this.taskArguments});

  @override
  _TaskPageState createState() => _TaskPageState();
}

class _TaskPageState extends State<TaskPage> {
  final _formKey = GlobalKey<FormState>();
  late String _title;

  @override
  Widget build(BuildContext context) {
    final todoProvider = Provider.of<TodoProvider>(context);
    final isEditing = widget.taskArguments.todo != null;
    final titleController = TextEditingController(
      text: isEditing ? widget.taskArguments.todo!.title : '',
    );

    return Scaffold(
      appBar: AppBar(
        title: Text(isEditing ? 'Edit Task' : 'New Task'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: titleController,
                decoration: InputDecoration(labelText: 'Title'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a title';
                  }
                  return null;
                },
                onSaved: (value) {
                  _title = value!;
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    if (isEditing) {
                      todoProvider.updateTodo(
                          widget.taskArguments.todo!, _title);
                    } else {
                      todoProvider.addTodoAsync(_title);
                    }
                    Navigator.pop(context);
                  }
                },
                child: Text('Save'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
