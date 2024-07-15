import 'package:flutter/material.dart';

class UpdateTaskPage extends StatelessWidget {
  final String task;
  final TextEditingController _controller = TextEditingController();

  UpdateTaskPage({required this.task});

  @override
  Widget build(BuildContext context) {
    _controller.text = task;

    return Scaffold(
      appBar: AppBar(title: Text('Update Task')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              decoration: InputDecoration(labelText: 'Task'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context, _controller.text);
              },
              child: Text('Update Task'),
            )
          ],
        ),
      ),
    );
  }
}
