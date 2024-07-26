import 'package:flutter/material.dart';
import 'HomePage.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF2E236C),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                width: 250,
                height: 34,
                child: Text(
                  'Mobile Computing',
                  style: TextStyle(
                    fontSize: 24.0,
                    color: Colors.purpleAccent,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(
                height: 75,
              ),
              Text(
                'Email',
                style: TextStyle(
                    fontSize: 14.0,
                    fontWeight: FontWeight.w700,
                    color: Color.fromARGB(255, 199, 199, 244)),
              ),
              SizedBox(
                width: 310,
                height: 64,
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    fillColor: Color(0xFFE2E8F0),
                    filled: true,
                  ),
                ),
              ),
              SizedBox(height: 20),
              Text(
                'Student Number',
                style: TextStyle(
                    fontSize: 14.0,
                    fontWeight: FontWeight.w700,
                    color: Color.fromARGB(255, 199, 199, 244)),
              ),
              SizedBox(
                width: 310,
                height: 64,
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    fillColor: Color(0xFFE2E8F0),
                    filled: true,
                  ),
                ),
              ),
              SizedBox(
                height: 40,
                width: 310,
              ), // المسافة بين رقم الطالب و تسجيل الدخول
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HomePage()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 4.0),
                  backgroundColor: Color(0xFFE2E8F0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(8.0),
                    ),
                  ),
                ),
                child: Text(
                  'Login',
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Color(0xFF2D3748),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
