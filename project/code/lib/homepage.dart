import 'package:attempt_notwo/tasks.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(PlastickyApp());
}

class PlastickyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      debugShowCheckedModeBanner: false,

      title: 'Plasticky',


      theme: ThemeData(

        primaryColor: Color(0xFF01977F),
      ),

     

    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(

         backgroundColor: Color(0xFF01977F),

        title: Text( 'Plasticky',

          style: TextStyle(

            fontSize: 45.0,

            fontWeight: FontWeight.bold,

            color: Colors.white,

          ),
        ),
      ),


      body: ListView(

        children: [
          _buildContainer('Add elements', Color(0xFF42E5CA)),
          _buildContainer('Remove elements', Color(0xFF8FF8E7), fontSize: 40.0),
          _buildContainer('Find drop off location', Color(0xFFBDFC57)),
          _buildContainer('Add new drop off location', Color(0xFFDEFBB0)),
          _buildContainer('Add elements', Color(0xFFF7D754)),
          _buildContainer('Remove elements', Color(0xFFFFE68C)),
        ],

      ),





      bottomNavigationBar: BottomAppBar(

        color: Color(0xFF01977F),

        child: Row(

          mainAxisAlignment: MainAxisAlignment.spaceEvenly,

          children: [

            Icon(
              Icons.settings,
              color: Colors.grey,
              size: 30.0,
            ),


            Icon(
              Icons.home,
              color: Colors.grey,
              size: 30.0,
            ),


        IconButton(
  icon: Icon(Icons.task),
  color: Colors.grey,
  iconSize: 30.0,
  onPressed: () {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => TasksPage()),
    );
  },
),

          ],
        ),
      ),
    );
  }





  Widget _buildContainer(String text, Color color, {double fontSize = 40.0}) {
    return Container(

      height: 250,

      width: 1001,

      color: color,


      child: ListTile(

        title: Text(

          text,

          style: TextStyle(


            color: Colors.white,

            fontSize: fontSize,

          ),
        ),
      ),
    );
  }
}