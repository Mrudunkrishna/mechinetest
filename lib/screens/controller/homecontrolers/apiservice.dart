import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:mechinetest/screens/controller/homecontrolers/modelclass.dart';

class APIService {
  static const String baseUrl = 'https://flutter-amr.noviindus.in/api';

  Future<List<Patient>> fetchPatientList() async {
    final response = await http.get(Uri.parse('$baseUrl/PatientList'));

    if (response.statusCode == 200) {
      List<dynamic> jsonList = json.decode(response.body)['patient'];
      List<Patient> patients = jsonList.map((json) => Patient.fromJson(json)).toList();
      return patients;
    } else {
      throw Exception('Failed to load patients');
    }
  }
}
