import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:mechinetest/utils/constants/api_constants.dart';
import 'package:http/http.dart' as http;
import 'package:mechinetest/utils/helper/persistance_helper.dart';


class PatientProvider extends ChangeNotifier {

 Future<Map>  getPatientList()async{
    var url = Uri.parse("$baseUrl/PatientList");
    // try{
      var token = await PersistanceHelper.getToken("token");
      var headers = {
        'auth_token': 'data',
        'Authorization': 'Bearer $token'
      };
      print(token);
      http.Response response = await http.get(url,headers: headers);
      print(response.statusCode);
      if(response.statusCode==200){
        print(response.body);

        var result = jsonDecode(response.body);

        print(result);
        return result;
      }else{
        throw Exception();
      }
    // }catch(e){
    //   print("error $e");
    // }
  }
}
