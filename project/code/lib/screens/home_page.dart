import 'package:flutter/material.dart';
import 'package:flutter_application_university/widgets/bottom_nav_widget.dart';
import 'package:flutter_application_university/widgets/my_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavWidget(
        selectedIndex: _selectedIndex,
        onTabChange: _onItemTapped,
      ),
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Home Page',
          style: TextStyle(
              color: Colors.grey.shade600, fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: ListView(
          children: const [
            MyCard(),
            MyCard(),
          ],
        ),
      ),
    );
  }
}
