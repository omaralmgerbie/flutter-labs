import 'package:flutter/material.dart';

class TaskPage extends StatefulWidget {
  const TaskPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _TaskPageState createState() => _TaskPageState();
}

class _TaskPageState extends State<TaskPage> {
  List<Map<String, dynamic>> tasks = [
    {'title': 'Final task', 'description': 'Final Exam', 'completed': true},
    {
      'title': ' Project task',
      'description': 'Project description',
      'completed': false
    },
    {'title': 'Mid task', 'description': 'Mideterm Exam', 'completed': false},
  ];

  void _addTask(String title, String description) {
    setState(() {
      tasks.add(
          {'title': title, 'description': description, 'completed': false});
    });
  }

  void _toggleTaskCompletion(int index) {
    setState(() {
      tasks[index]['completed'] = !tasks[index]['completed'];
    });
  }

  final _formKey = GlobalKey<FormState>();
  String _taskTitle = '';
  String _taskDescription = '';

  void _submitTask() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      _addTask(_taskTitle, _taskDescription);
      Navigator.pop(context);
    }
  }

  int _currentIndex = 1;

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
      if (_currentIndex == 0) {
        Navigator.pushReplacementNamed(context, '/');
      } else if (_currentIndex == 2) {
        Navigator.pushReplacementNamed(context, '/settings');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'المهام',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Color.fromARGB(255, 249, 243, 243),
          ),
        ),
        backgroundColor: const Color(0xFF2E236C),
        centerTitle: true,
      ),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: tasks.length,
                itemBuilder: (context, i) {
                  return ListTile(
                    title: Text(tasks[i]['title']),
                    subtitle: Text(tasks[i]['description']),
                    trailing: Checkbox(
                      value: tasks[i]['completed'],
                      onChanged: (bool? value) {
                        _toggleTaskCompletion(i);
                      },
                    ),
                    tileColor: tasks[i]['completed']
                        ? Color.fromARGB(255, 196, 196, 230)
                        : const Color.fromARGB(255, 226, 233, 239),
                  );
                },
              ),
            ),
            ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: Text(
                      'Add New Task',
                    ),
                    content: Form(
                      key: _formKey,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          TextFormField(
                            decoration:
                                InputDecoration(labelText: 'Task Title'),
                            onSaved: (value) {
                              _taskTitle = value!;
                            },
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter a task title';
                              }
                              return null;
                            },
                          ),
                          TextFormField(
                            decoration:
                                InputDecoration(labelText: 'Task Description'),
                            onSaved: (value) {
                              _taskDescription = value!;
                            },
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter a task description';
                              }
                              return null;
                            },
                          ),
                        ],
                      ),
                    ),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text('Cancel'),
                      ),
                      ElevatedButton(
                        onPressed: _submitTask,
                        child: Text('Submit'),
                      ),
                    ],
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              child: Text(
                'Add Task',
                style: TextStyle(
                  fontSize: 14,
                  color: Color(0xFF2D3748),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTabTapped,
        currentIndex: _currentIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_rounded),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.assignment_add),
            label: 'Task',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings_outlined),
            label: 'Settings',
          ),
        ],
      ),
    );
  }
}
