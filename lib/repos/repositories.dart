import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutterbloc/model/user_model.dart';
import 'package:http/http.dart';

class UserRepositories {
  String endpoint = "https://reqres.in/api/users?page=2";

  Future<List<UserModel>> getUsers() async {
    Response response = await get(Uri.parse(endpoint));

    if (response.statusCode == 200) {

      final List result = jsonDecode(response.body)['data'];
      return result.map((e) => UserModel.fromJson(e)).toList();
    } else {
      throw Exception(response.reasonPhrase);
    }
  }
}
