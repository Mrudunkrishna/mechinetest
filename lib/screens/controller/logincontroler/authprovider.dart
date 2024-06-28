import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mechinetest/utils/helper/persistance_helper.dart';

import '../../viewscreens/homepage.dart';

class AuthProvider with ChangeNotifier {
  String _token="";

  String get token => _token;


  Future<void> login(BuildContext context ,String username, String password) async {
    try {
      var request = http.MultipartRequest(
          'POST', Uri.parse('https://flutter-amr.noviindus.in/api/Login'));
      request.fields.addAll({'username': username, 'password': password});

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        var result = await response.stream.bytesToString();
        var output = jsonDecode(result);
        var myToken = output["token"]??"";
        PersistanceHelper.saveToPersistantStorage(key: "token", value: myToken);
        if(myToken!=""){
          if (!context.mounted) return;
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => HomeScreen()),
          );        }

      } else {
        print(response.reasonPhrase);
      }
    } catch (E) {}
  }

}
