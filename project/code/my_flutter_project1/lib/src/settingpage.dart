import 'package:flutter/material.dart';
import 'package:my_flutter_project1/src/homepage.dart';
import 'package:my_flutter_project1/src/profilepage.dart';

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            ListTile(
              title: Text('Language'),
              subtitle: Text('Select your preferred language'),
              trailing: DropdownButton<String>(
                items: [
                  DropdownMenuItem<String>(
                    value: 'Arabic',
                    child: Text('Arabic'),
                  ),
                  DropdownMenuItem<String>(
                    value: 'English',
                    child: Text('English'),
                  ),
                ],
                onChanged: (value) {
                  // Handle language change
                },
                hint: Text('Select Language'),
              ),
            ),
            Divider(),
            ListTile(
              title: Text('Notifications'),
              trailing: Switch(
                value: false, // Change based on your logic
                onChanged: (value) {
                  // Handle switch toggle
                },
              ),
            ),
            Divider(),
            ListTile(
              title: Text('Privacy Policy'),
              onTap: () {
                // Navigate to Privacy Policy page
              },
            ),
            Divider(),
            ListTile(
              title: Text('Terms of Service'),
              onTap: () {
                // Navigate to Terms of Service page
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        onTap: (index) {
          if (index == 0) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => HomePage()),
            );
          } else if (index == 1) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => SettingsPage()),
            );
          } else if (index == 2) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => ProfilePage()),
            );
          }
        },
      ),
    );
  }
}
