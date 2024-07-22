import 'package:flutter/material.dart';
import '../widgets/input-filed.dart';
import '../widgets/button.dart';

class Login extends StatefulWidget {
  final void Function(String, String) typedData;
  const Login({super.key, required this.typedData});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  late TextEditingController _emailController;
  late TextEditingController _studentNumberController;

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _studentNumberController = TextEditingController();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _studentNumberController.dispose();
    super.dispose();
  }

  void _handleLogin() {
    final email = _emailController.text;
    final studentNumber = _studentNumberController.text;
    widget.typedData(email, studentNumber);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InputFiled(
          label: 'Email',
          placeHolder: 'Enter your email',
          controller: _emailController,
          onTextChange: (s) => null,
        ),
        InputFiled(
          label: 'Student Number',
          placeHolder: 'Enter your student number',
          controller: _studentNumberController,
          onTextChange: (s) => null,
        ),
        const SizedBox(height: 10),
        MyButton(label: 'Login', onPressed: _handleLogin),
      ],
    );
  }
}
