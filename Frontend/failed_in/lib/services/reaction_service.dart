import 'dart:convert';

import 'package:failed_in/models/reaction_model.dart';
import 'package:failed_in/utilities/app_error.dart';
import 'package:failed_in/utilities/server_details.dart';
import 'package:failed_in/utilities/user_api.dart';
import 'package:http/http.dart' as http;

class ReactionService {
  static Future<void> reactToPost(Reaction reaction) async {
    var uri = Uri.parse(serverUrl + '/posts/${reaction.postId}/like');
    var requestHeaders = {
      'Content-Type': 'application/json',
      'authorization': 'Bearer ${UserApi.instance.token}',
    };

    var requestBody = jsonEncode(reaction.toJson());

    var response = await http.post(
      uri,
      headers: requestHeaders,
      body: requestBody,
    );

    if (response.statusCode == 200) {
      // TODO: Handle response

    } else {
      throw AppError(response.statusCode, response.body);
    }
  }
}
