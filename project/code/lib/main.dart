import 'package:first_app/HomePage.dart';
import 'package:first_app/login.dart';
 
import 'package:first_app/setting.dart';
import 'package:first_app/task.dart';
import 'package:flutter/material.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Lab Project',
      
     home: Login(),
      routes: {
        '/home': (context) => HomePage(),
        '/tasks': (context) => TaskPage(),
        '/settings': (context) => Settings(),
      },
    );
  }
}