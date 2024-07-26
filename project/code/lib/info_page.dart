import 'package:flutter/material.dart';
import 'home_page.dart'; // Import the HomePage class

class InfoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 175, 211, 241),

      // App bar with only a back button
      appBar: AppBar(
        title: Text(''),
        centerTitle: true,
        backgroundColor: Colors.white10,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => HomeScreen()), // Navigate to HomeScreen
            );
          },
        ),
      ),

      // Body content
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 20),

            // Rectangular container with code image and button
            Container(
              padding: EdgeInsets.all(10),
              child: Column(
                children: [
                  Image.network(
                    'https://upload.wikimedia.org/wikipedia/commons/4/4b/C-Programming.png', // Example code image URL
                    height: 200,
                    fit: BoxFit.cover,
                  ),
                  SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () {
                      // Handle enroll action
                    },
                    child: Text('Enroll Course'),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),

            // Title
            Text(
              'Information about the course',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),

            // Container with progress bar and paragraph
            Container(
              padding: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Progress bar container
                  Container(
                    width: 400,
                    height: 20,
                    child: LinearProgressIndicator(
                      value: 0.3, // 30% progress
                      backgroundColor: Colors.grey[200],
                      valueColor: AlwaysStoppedAnimation<Color>(const Color.fromARGB(255, 15, 49, 76)),
                    ),
                  ),
                  SizedBox(height: 10),

                  // Paragraph
                  Text(
                    'This is a detailed paragraph about the course. It provides all the necessary information that students need to know before enrolling in the course.',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),

      // Bottom navigation bar
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
              MaterialPageRoute(builder: (context) => HomeScreen()), // Navigate to HomeScreen
            );
          }
          // Handle other navigation if needed
        },
      ),
    );
  }
}
