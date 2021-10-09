import 'dart:convert';

import 'package:failed_in/models/user_model.dart';
import 'package:failed_in/utilities/app_error.dart';
import 'package:failed_in/utilities/server_details.dart';
import 'package:http/http.dart' as http;

class AuthService {
  static Future<void> signupUser(User user) async {
    var url = Uri.parse(serverUrl + '/users/signup');

    var requestHeaders = {
      'Content-Type': 'application/json',
    };

    var requestBody = jsonEncode({
      'firstName': user.firstName,
      'lastName': user.lastName,
      'email': user.email,
      'password': user.password,
      'username': user.username,
    });

    var response = await http.post(
      url,
      headers: requestHeaders,
      body: requestBody,
    );

    var responseBody = jsonDecode(response.body);

    if (response.statusCode == 200) {
      print('Success');
    } else {
      throw AppError(response.statusCode, responseBody['message']);
    }
  }
}
