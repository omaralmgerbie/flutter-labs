import 'package:flutter/material.dart';
import 'user.dart';
import 'tasks.dart';

// Define the login page widget
class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();

  String _email = 'mmm@gmail.com';
  String _studentNumber = '11221133';


bool validateFields() {
  if (_formKey.currentState!.validate()) {
    _formKey.currentState!.save();

    if (_email == 'mmm@gmail.com' && _studentNumber == '11221133') {
      return true;
    }
  }
  return false;
}

  // Navigate to the home page when the login button is pressed
void _loginPressed() async {
  if (validateFields()) {
    // Simulate API call success
    Map<String, String> userData = await fetchUserData();
    if (userData.isNotEmpty) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomePage(userData: userData)),
      );
    }
  } else {
    // Show error message
    ScaffoldMessenger.of(context).showSnackBar(
      // ignore: prefer_const_constructors
      SnackBar(content: Text('Wrong email or student number')),
    );
  }
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(labelText: 'Email'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email';
                  }
                  return null;
                },
                onSaved: (value) => _email = value!,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Student Number'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your student number';
                  }
                  return null;
                },
                onSaved: (value) => _studentNumber = value!,
              ),
              ElevatedButton(
                onPressed: _loginPressed,
                child: Text('Login'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}