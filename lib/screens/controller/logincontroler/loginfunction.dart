import 'package:http/http.dart' as http;
import 'dart:convert';

Future<void> login(String username, String password) async {
  try {
    var request = http.MultipartRequest(
        'POST', Uri.parse('https://flutter-amr.noviindus.in/api/Login'));
    request.fields.addAll({'username': 'test_user', 'password': '12345678'});

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print(await response.stream.bytesToString());
      var result = await response.stream.bytesToString();
      print(result);
    } else {
      print(response.reasonPhrase);
    }
  } catch (E) {}
}
