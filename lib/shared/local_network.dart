import 'package:shared_preferences/shared_preferences.dart';

class CashNetwork {
  static late SharedPreferences sharedPref;
  static Future cashInitialization() async {
    sharedPref = await SharedPreferences.getInstance();
  }

  static Future<bool> insertToCash(
      {required String key, required String value}) async {
    return await sharedPref.setString(key, value);
  }

  static String getCashData({required String key})  {
    return sharedPref.getString(key) ?? "";
  }
}
