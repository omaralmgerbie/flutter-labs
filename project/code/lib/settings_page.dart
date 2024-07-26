import 'package:flutter/material.dart';
// Import the HomePage class

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Settings'),
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); // Navigate back to HomePage
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Notification switch
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Notifications', style: TextStyle(fontSize: 18)),
                Switch(
                  value: true,
                  onChanged: (value) {
                    // Handle switch toggle
                  },
                ),
              ],
            ),
            SizedBox(height: 20),

            // Privacy Policy option
            ListTile(
              title: Text('Privacy Policy', style: TextStyle(fontSize: 18)),
              onTap: () {
                // Handle privacy policy tap
              },
            ),
            SizedBox(height: 20),

            // Log Out option
            ListTile(
              title: Text('Log Out', style: TextStyle(fontSize: 18, color: Colors.red)),
              onTap: () {
                // Handle log out tap
              },
            ),
          ],
        ),
      ),
    );
  }
}
