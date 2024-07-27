
// Define a function that fetches user data from an API
Future<Map<String, String>> fetchUserData() async {
  try {
    // Simulate a delay for API call
    await Future.delayed(Duration(seconds: 2), () {});

    // If the API call is successful, return user data
    return {"name": "abdo", "email": "mmm@gmail.com", "studentNumber": "123456"};
  } catch (e) {
    // If there is an error, return an empty map
    return {};
  }
}