import 'dart:convert';

import 'package:flutter_task_misfit/models/user_model.dart';
import 'package:http/http.dart' as http;

final String baseUrl = 'https://raw.githubusercontent.com';

class RemoteService
{
  static Future<UserModel> fetchUserData () async {
    var url =baseUrl+'/Muhaiminur/muhaiminur.github.io/master/misfitflutter.tech';
    try {
      var response = await http.get(url,
        headers: {"Content-Type": "application/json"},
      );
      if (response.statusCode == 200) {
        final responseJson = json.decode(response.body);
        print("Data : $responseJson");
        UserModel userModel =   UserModel.fromJson(responseJson);
        return userModel;
      } else
      {
        return null;
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

}