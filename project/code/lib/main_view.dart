import 'package:flutter/material.dart';
import 'package:test_app/homePage.dart';
import 'package:test_app/task_page.dart';
import 'package:test_app/settings_page.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: [Homepage(), TaskPage(), SettingsPage()][index],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: index,
        onTap: (value) {
          index = value;
          setState(() {});
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.format_list_bulleted_sharp), label: 'Tasks'),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings), label: 'Settings'),
        ],
      ),
    );
  }
}
