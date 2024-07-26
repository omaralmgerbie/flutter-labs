// lib/profile_page.dart
import 'package:flutter/material.dart';
// Import the HomePage class

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      // App bar with back and edit icons
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: Colors.black,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.edit),
            color: Colors.black,
            onPressed: () {
              // Handle edit action
            },
          ),
        ],
      ),

      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 60,
              backgroundImage: NetworkImage('https://via.placeholder.com/150'),
            ),
            SizedBox(height: 20),
            Text(
              'User Name',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              'ID: 212121000',
              style: TextStyle(fontSize: 18, color: Colors.grey[600]),
            ),
            SizedBox(height: 40),
            DropdownButton<String>(
              isExpanded: true,
              items: [
                DropdownMenuItem<String>(
                  value: 'Item1',
                  child: Text('sub 1'),
                ),
                DropdownMenuItem<String>(
                  value: 'Item2',
                  child: Text('sub 2'),
                ),
                DropdownMenuItem<String>(
                  value: 'Item3',
                  child: Text('sub 3'),
                ),
                DropdownMenuItem<String>(
                  value: 'Item4',
                  child: Text('sub 4'),
                ),
                DropdownMenuItem<String>(
                  value: 'Item5',
                  child: Text('sub 5'),
                ),
              ],
              onChanged: (value) {
                // Handle dropdown change
              },
              hint: Text('Select Item'),
            ),
            SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Dark Theme',
                  style: TextStyle(fontSize: 18),
                ),
                Switch(
                  value: true,
                  onChanged: (value) {
                    // Handle switch toggle
                  },
                ),
              ],
            ),
          ],
        ),
      ),

      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
        ],
        onTap: (index) {
          if (index == 2) {
            Navigator.pop(context);
          }
        },
      ),
    );
  }
}
