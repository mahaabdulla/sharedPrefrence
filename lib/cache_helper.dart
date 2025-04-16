import 'dart:convert';

import 'package:local_storag_app/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper {
  static late final SharedPreferences _sharedPreferences;

  static Future<void> init() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  static void setString(String key, String value) =>
      _sharedPreferences.setString(key, value);

  static void setInt(String key, int value) =>
      _sharedPreferences.setInt(key, value);

  // user  data
  static void setUser(UserModel model) =>
      _sharedPreferences.setString("user", json.encode(model.toJson()));

  static UserModel? getUser() {
    String? encodeUser = CacheHelper.getString('user');

    if (encodeUser == null) {
      return null;
    } else {
      UserModel user = UserModel.fromJson(json.decode(encodeUser));
      return user;
    }
  }

  // gets methods

  static String? getString(String key) => _sharedPreferences.getString(key);

  static int? getInt(String key) => _sharedPreferences.getInt(key);

  static Future<bool> removeAt(String key) => _sharedPreferences.remove(key);
  static Future<bool> clearAll() => _sharedPreferences.clear();
}
