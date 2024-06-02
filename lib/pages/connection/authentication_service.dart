import 'package:http/http.dart' as http;
import 'dart:convert';

class AuthenticationService {
  //static Future<bool> checkUsernameExists(String username) async {
  //  // Make a request to your backend server to check if the username exists
  //  // Replace 'YOUR_BACKEND_ENDPOINT' with the actual endpoint URL
  //  final response = await http.get(Uri.parse('http://10.0.0.2:8000/api/user/check-username?username=$username'));
  //  //print(response);
//
  //  if (response.statusCode == 200) {
  //    // If the response is successful, parse the JSON response
  //    // and return true if the username exists, false otherwise
  //    final responseData = jsonDecode(response.body);
  //    return responseData['exists'];
  //  } else {
  //    // If there's an error or the server returns an unexpected response,
  //    // return false to indicate that the username status is unknown
  //    return false;
  //  }
  //}



  static Future<void> registerUser(String username, String email, String password) async {
     print("register hune method ma pugim");
    final response = await http.post(
      Uri.parse('http://10.0.0.2:8000/api/user/register/'),
      body: jsonEncode({'username': username, 'email': email, 'password': password}),
     
      headers: {'Content-Type': 'application/json'},
    );
     print("register vayo");
    if (response.statusCode == 201) {
      // User registration successful
      print('User registration successful');
    } else {
      // Handle registration failure
      print('Registration failed: ${response.body}');
       print("khai fail vayo hola");
    }
  }

  // Implement loginUser method similarly
}
