// Import necessary packages
import 'package:flutter/material.dart';
import 'splash_page.dart';
// Import the HomeScreen class

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter app',
      home: SplashPage(), // Set SplashPage as the initial screen
    );
  }
}
