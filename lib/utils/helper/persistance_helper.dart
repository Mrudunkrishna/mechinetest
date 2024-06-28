import 'package:shared_preferences/shared_preferences.dart';

class PersistanceHelper {
  PersistanceHelper._();

  static void saveToPersistantStorage({required String key,required String value})async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString(key, value);
  }

  static Future<String> getToken(String key)async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var token = preferences.getString(key)??"";
    return token;
  }

}