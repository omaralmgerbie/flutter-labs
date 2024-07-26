import 'package:flutter/material.dart';
import 'package:test_app/login_screen.dart';
import 'package:test_app/homePage.dart';
import 'package:test_app/main_view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: 'login_screen',
      routes: {
        'login_screen': (context) => LoginScreen(),
        'main_view': (context) => MainView(),
        'homePage': (context) => Homepage(),
      },
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginScreen(),
    );
  }
}
