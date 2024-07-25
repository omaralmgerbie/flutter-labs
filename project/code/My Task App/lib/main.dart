import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'login_page.dart';

//Mohamed Ghait Arrgeabi
//217181618



void main() async {

  //init the Hive
  await Hive.initFlutter();

  //Open a Box
  var box = await Hive.openBox("mybox");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      //  useMaterial3: true,

      ),
      home: const LoginPage(),

    );
  }
}


