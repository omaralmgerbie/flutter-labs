import 'package:code/auth/api_service.dart';
import 'package:code/components/toast.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:code/components/login.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  Future<void> _handleLogin(
      BuildContext context, String email, String number) async {
    final apiService = Provider.of<ApiService>(context, listen: false);
    try {
      final response = await apiService.login(email, number);
      Navigator.of(context).pushNamed("/");
    } catch (e) {
      showToastError('خطأ حول مجدداً');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          automaticallyImplyLeading: false,
        ),
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                "Flutter Lab Project",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              Login(
                  typedData: (email, number) =>
                      _handleLogin(context, email, number)),
            ],
          ),
        ));
  }
}
