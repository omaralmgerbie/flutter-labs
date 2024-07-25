import 'package:flutter/material.dart';
import 'home_page.dart';
import 'login_page.dart';


class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(

        appBar: AppBar(title:Text("Intro Page",style:TextStyle(color:Colors.blue))),

      body:Center(
        child:ElevatedButton(
              child:Text("Go To Login Page"),

              onPressed: (){

              Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()));
              }

        )
      )
   );




  }
}