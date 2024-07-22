import 'package:code/screens/books.dart';
import 'package:code/screens/settings.dart';
import 'package:code/screens/tasks.dart';
import 'package:flutter/material.dart';
import 'package:code/db/db_manager.dart';
import 'package:code/components/task_container.dart';
import 'package:code/components/book_viewer.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final dbManager = DbManager.instance;
  final GlobalKey<TaskContainerState> taskContainerKey =
      GlobalKey<TaskContainerState>();
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
  }

  static const List<Widget> _screens = <Widget>[
    Book(
      title: 'Books',
    ),
    TasksScreen(
      title: 'Tasks',
    ),
    SettingScreen(
      title: 'Settings',
    )
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Theme.of(context).colorScheme.surface,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.book),
            label: 'Books',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.task),
            label: 'Tasks',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Theme.of(context).colorScheme.onSurface,
        onTap: _onItemTapped,
      ),
    );
  }
}
