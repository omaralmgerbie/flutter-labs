import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  final String baseUrl = 'https://it-flutter-lab.koyeb.app';
  String? _token;
  String? get token => _token;

  Future<Map<String, dynamic>> login(String email, String studentNumber) async {
    final url = Uri.parse('$baseUrl/login');
    final response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        'email': email,
        'studentNumber': studentNumber,
      }),
    );

    if (response.statusCode == 201) {
      final responseBody = jsonDecode(response.body);
      _token = responseBody['authToken'];
      return responseBody;
    } else {
      throw Exception('Failed to login');
    }
  }

  Future<Map<String, dynamic>> getUserDetails() async {
    final url = Uri.parse('$baseUrl/me');
    if (_token != null) {
      final response = await http.get(
        url,
        headers: {
          'Authorization': 'Bearer $_token',
        },
      );

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw Exception('Failed to get user details');
      }
    } else {
      throw Exception('You are not logged in!');
    }
  }

  void logout() {
    _token = null;
  }
}
