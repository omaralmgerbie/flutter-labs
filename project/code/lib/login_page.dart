// lib/login_page.dart
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'home_page.dart'; // Import the HomeScreen class

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _idController = TextEditingController();
  bool _isLoading = false;

  void _login() async {
    setState(() {
      _isLoading = true;
    });

    // Simulate a login delay
    await Future.delayed(Duration(seconds: 2));

    setState(() {
      _isLoading = false;
    });

    // Navigate to the home page
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => HomeScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 204, 229, 248),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Login Page title
              Text(
                'LOGIN PAGE', // Title text
                style: TextStyle(
                  fontSize: 24, // Font size of the title
                  fontWeight: FontWeight.bold, // Font weight of the title
                ),
              ),
              SizedBox(height: 32), // Space between the title and the first input field
              
              // Email input field
              Container(
                width: MediaQuery.of(context).size.width * 0.6, // Set width of the input field
                child: TextField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    labelText: 'Email', // Label text for the input field
                    border: OutlineInputBorder(), // Add border to the input field
                    filled: true,
                    fillColor: Colors.white60,
                  ),
                ),
              ),
              SizedBox(height: 20), // Space between the input fields
              
              // ID input field
              Container(
                width: MediaQuery.of(context).size.width * 0.6, // Set width of the input field
                child: TextField(
                  controller: _idController,
                  keyboardType: TextInputType.number,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly], // Allow only digits
                  decoration: InputDecoration(
                    labelText: 'ID', // Label text for the input field
                    border: OutlineInputBorder(), // Add border to the input field
                    filled: true,
                    fillColor: Colors.white60,
                  ),
                ),
              ),
              SizedBox(height: 32), // Space between the input fields and the button
              
              // Login button or loading indicator
              _isLoading
                  ? CircularProgressIndicator() // Display loading indicator
                  : Container(
                      width: MediaQuery.of(context).size.width * 0.3, // Set width of the button
                      child: ElevatedButton(
                        onPressed: _login,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color.fromARGB(255, 254, 254, 254), // Button background color
                          padding: EdgeInsets.symmetric(vertical: 16), // Button padding
                        ),
                        child: Text(
                          'Log In', // Button text
                          style: TextStyle(
                            color: Colors.black, // Button text color
                          ),
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
