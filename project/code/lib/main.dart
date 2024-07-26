import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FirstPage(),
    );
  }
}

class FirstPage extends StatefulWidget {
  @override
  _FirstPage createState() => _FirstPage();
}

class _FirstPage extends State<FirstPage> {
  String _email = '';
  String _studentId = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(

        backgroundColor: Color(0xFF01977F),

        centerTitle: true,


        title: Text('Plasticky',
          style: TextStyle(
            fontSize: 45.0,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),



      ),









      body: Padding(

        padding: EdgeInsets.symmetric(vertical: 50.0, horizontal: 16.0),



        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,

          children: [
            Align(

              alignment: Alignment.centerLeft,

              child: Text(

                'Student Email',


                style: TextStyle(

                  color: Color(0xFFC3D123),

                  fontSize: 35.0,

                  fontWeight: FontWeight.bold,

                ),
              ),
            ),


          
            SizedBox(height: 8.0),


            TextField(
              onChanged: (value) {
                setState(() {
                  _email = value;
                });
              },

            
              decoration: InputDecoration(
                fillColor: Color(0xFFD3EEF1),
                filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
            ),




            SizedBox(height: 16.0),


            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Student ID Number',
                style: TextStyle(
                  color: Color(0xFFC3D123),
                  fontSize: 35.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),



            SizedBox(height: 8.0),


            TextField(
              onChanged: (value) {
                setState(() {
                  _studentId = value;
                });
              },

              decoration: InputDecoration(
                fillColor: Color(0xFFD3EEF1),
                filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
            ),



            SizedBox(height: 16.0),



            Align(
              alignment: Alignment.center,



              child: ElevatedButton(
               onPressed: () 
               {

  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => HomePage(email: _email, studentId: _studentId),
    ),
  );


},


                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF32CBD7),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),


                  padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
                ),


                child: Text(

                  'Log In',

                  style: TextStyle(

                    fontSize: 35.0,

                    fontWeight: FontWeight.bold,

                    color: Colors.white,

                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  final String email;
  final String studentId;

  HomePage({required this.email, required this.studentId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF01977F),
        centerTitle: true,
        title: Text(
          'Plasticky',
          style: TextStyle(
            fontSize: 45.0,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Email: $email'),
            Text('Student ID: $studentId'),
          ],
        ),
      ),
    );
  }
}