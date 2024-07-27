

import 'package:flutter/material.dart';
import 'login.dart';
import 'tasks.dart';
import 'settings.dart';

void main() {
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.dark(), // Use dark theme here
      debugShowCheckedModeBanner: false,
      initialRoute: '/login',
      routes: {
        '/login': (context) => LoginPage(),
        // ignore: prefer_const_literals_to_create_immutables
        '/home': (context) => HomePage(userData: {'name': 'abdo ', 'email': 'mmm@gmail.com'}),
        '/settings': (context) => SettingsPage(),
      },
    );
  }
}