import 'package:flutter/material.dart';
import 'task.dart';

class HomePage extends StatefulWidget {
 const HomePage({super.key});
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Map<String, dynamic>> tasks = [
    {'title': 'Test task', 'completed': true},
    {'title': 'another test task', 'completed': false},
    {'title': 'Foo task', 'completed': false},
  ];

  void _addTask(String title) {
    setState(() {
      tasks.add({'title': title, 'completed': false});
    });
  }

  void _toggleTaskCompletion(int index) {
    setState(() {
      tasks[index]['completed'] = !tasks[index]['completed'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Todos'),
      ),
      body: Container(
        color: const Color(0xFF9B86BD),
        child: ListView.builder(
          itemCount: tasks.length,
          itemBuilder: (context, i) {
            return ListTile(
              title: Text(tasks[i]['title']),
              trailing: Checkbox(
                value: tasks[i]['completed'],
                onChanged: (bool? value) {
                  _toggleTaskCompletion(i);
                },
              ),
              tileColor: tasks[i]['completed']
                  ? Color.fromARGB(255, 5, 9, 244)
                  : Colors.blue[100],
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => TaskPage(addTask: _addTask)),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
