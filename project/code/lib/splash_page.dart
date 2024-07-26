// lib/splash_page.dart
import 'package:flutter/material.dart';
import 'login_page.dart'; // Import the LoginPage class

class SplashPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:  Color.fromARGB(255, 227, 238, 247),// Set background color
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, // Center the column's children vertically
          children: [
            // Flutter logo
            FlutterLogo(
              size: 300, // Set the size of the logo
            ),
            SizedBox(
              height: 40, // Add space between the logo and the text
            ),
            // Welcome text
            Text(
              'Welcome to Flutter App', // Set the text content
              style: TextStyle(
                fontSize: 24, // Set the font size of the text
              ),
            ),
            SizedBox(
              height: 80, // Add space between the text and the button
            ),
            // Skip button
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40.0), // Set horizontal padding for the button
              child: ElevatedButton(
                onPressed: () {
                  // Navigate to the login page when the button is pressed
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => LoginPage()),
                  );
                },
                child: Text('Skip'), // Set the button text
              ),
            ),
          ],
        ),
      ),
    );
  }
}
