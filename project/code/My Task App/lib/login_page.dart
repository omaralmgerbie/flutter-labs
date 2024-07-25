import 'package:flutter/material.dart';
import 'settings_page.dart';
import 'home_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _obscureText = true;
  bool _isLoading = false;
  final TextEditingController _studentIdController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  //Here we can add students to our Map
  final Map<String, Map<String, String>> studentDetails = {
    '217181618': {
      'password': '123123',
      'firstName': 'Mohammed',
      'lastName': 'Ghait',
    },
    'admin': {
      'password': 'admin',
      'firstName': 'Admin',
      'lastName': 'User',
    },
  };

  void _login() async {
    setState(() {
      _isLoading = true;
    });

    final String studentId = _studentIdController.text;
    final String password = _passwordController.text;

    // Here we Simulat a network requeste with a delay of 2 second
    await Future.delayed(Duration(seconds: 2));

    //Here we validate if student Id is more then 10 charecters
    if (studentId.length > 10) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Student ID must not exceed 10 characters')),
      );
      setState(() {
        _isLoading = false;
      });
      return;
    }

    //Send student to Settings page if Login was Successful
    if (studentDetails.containsKey(studentId) &&
        studentDetails[studentId]!['password'] == password) {
      final firstName = studentDetails[studentId]!['firstName']!;
      final lastName = studentDetails[studentId]!['lastName']!;

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => SettingsPage(
            firstName: firstName,
            lastName: lastName,
            studentId: studentId,
          ),
        ),
      );
    } else {
      //if Login was not successful we send an error message
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Login failed: Incorrect Student ID or Password')),
      );
    }

    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      body: SafeArea(
        child: Center(
          child: _isLoading
              ? CircularProgressIndicator()
              : SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [





                  //Main Label
                  Padding(
                    padding: const EdgeInsets.only(top: 40),
                    child: Text(
                      "My Daily Tasks",
                      style: TextStyle(
                        fontSize: 28.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey[700],
                      ),
                    ),
                  ),






                  //Student Id Label
                  Padding(
                    padding: EdgeInsets.only(left: 25.0, top: 100),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Student Id",
                        style: TextStyle(fontSize: 14.0),
                      ),
                    ),
                  ),






                  //Student Id Field
                  Padding(
                    padding: EdgeInsets.only(left: 22.0, right: 22, top: 5),
                    child: TextField(
                      controller: _studentIdController,
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey.shade300),
                        ),
                        fillColor: Colors.white,
                        filled: true,
                        labelText: 'Enter Your Id: ',
                        labelStyle: TextStyle(color: Colors.grey.shade500),
                      ),
                    ),
                  ),






                  //password label
                  Padding(
                    padding: EdgeInsets.only(left: 25.0, top: 30),
                    child: Row(
                      children: [
                        Text(
                          "Password",
                          style: TextStyle(fontSize: 14.0),
                        ),
                        IconButton(
                          icon: Icon(
                            _obscureText ? Icons.visibility_off : Icons.visibility,
                            color: Colors.lightBlue,
                          ),
                          onPressed: () {
                            setState(() {
                              _obscureText = !_obscureText;
                            });
                          },
                        ),
                      ],
                    ),
                  ),







                  //Password Field
                  Padding(
                    padding: EdgeInsets.only(left: 22.0, right: 22, top: 5),
                    child: TextField(
                      controller: _passwordController,
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey.shade300),
                        ),
                        fillColor: Colors.white,
                        filled: true,
                        labelText: 'Enter Your Password: ',
                        labelStyle: TextStyle(color: Colors.grey.shade500),
                      ),
                      obscureText: _obscureText,
                    ),
                  ),







                  //Log in Button
                  Padding(
                    padding: const EdgeInsets.only(top: 35),
                    child: TextButton(
                      onPressed: _login,
                      style: TextButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: Colors.blue,
                        padding: EdgeInsets.symmetric(horizontal: 150.0, vertical: 18.0),
                        textStyle: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6.0),
                        ),
                      ),
                      child: Text('Login'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
