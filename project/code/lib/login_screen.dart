import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:test_app/homePage.dart';
import 'package:test_app/main_view.dart';

class LoginScreen extends StatelessWidget {
  final emailController = TextEditingController();
  final studentNumberController = TextEditingController();

  LoginScreen({super.key});

  Future<void> login(BuildContext context) async {
    print("function is called");
    loading(context);
    final url = Uri.parse('https://it-flutter-lab.koyeb.app/login');
    print("calling api");
    var response = await http.post(
      url,
      body: jsonEncode({
        'email': emailController.text.trim(),
        'studentNumber': studentNumberController.text.trim(),
      }),
    );

    final responseBody = json.decode(response.body);
    print("response type: ${responseBody.runtimeType}");
    print("Status code: ${response.statusCode}");
    print('===========================================================');
    if (Navigator.canPop(context)) {
      Navigator.pop(context);
      if (response.statusCode == 400) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => MainView()),
        );
      } else {
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text("Login Failed"),
              content: Text("Please check your credentials and try again."),
            );
          },
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Spacer(),
              Text(
                'Flutter Lab Project',
                style: TextStyle(
                  fontWeight: FontWeight.w800,
                  fontSize: 29,
                ),
              ),
              SizedBox(height: 41),
              CustomTextField(
                controller: emailController,
                label: 'Email',
                hint: 'ibrahimso282@gmail.com',
              ),
              CustomTextField(
                controller: studentNumberController,
                label: 'Student Number',
                hint: '2191808126',
              ),
              Spacer(),
              TextButton(
                style: TextButton.styleFrom(
                  textStyle: TextStyle(fontWeight: FontWeight.bold),
                  foregroundColor: Color(0xff203748),
                  backgroundColor: Color(0xffE2E8F0),
                  minimumSize: Size.fromHeight(40),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                onPressed: () {
                  login(context);
                },
                child: Text("Login"),
              ),
              Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}

Future<void> loading(BuildContext context) {
  return showDialog(
    barrierDismissible: false,
    context: context,
    builder: (context) {
      return AlertDialog(
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CircularProgressIndicator(),
          ],
        ),
      );
    },
  );
}

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    required this.label,
    super.key,
    this.hint,
    this.enabled,
    this.controller,
  });

  final String label;
  final String? hint;
  final bool? enabled;
  final TextEditingController? controller;

  static final enabledBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(8),
    borderSide: BorderSide(color: Color(0xffE2E8F0)),
  );
  static final focusedBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(8),
    borderSide: BorderSide(color: Color(0xffE2E8F0)),
  );

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontWeight: FontWeight.w600,
            color: Color(0xff718096),
          ),
        ),
        SizedBox(height: 4),
        TextField(
          enabled: enabled,
          controller: controller,
          onTapOutside: (event) {
            FocusScope.of(context).unfocus();
          },
          decoration: InputDecoration(
            fillColor: Colors.white,
            filled: true,
            hintText: hint,
            enabledBorder: enabledBorder,
            focusedBorder: focusedBorder,
          ),
        ),
      ],
    );
  }
}
