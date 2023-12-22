import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper {
  static SharedPreferences? sharedPreferences;

  static init() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  static void setString({
    required String key,
    required String value,
  }) async {
    await sharedPreferences?.setString(key, value);
    return null;
  }

  static Future<String?> getString({
    required String key,
  }) async {
    return sharedPreferences?.getString(key);
  }

  static void setStringList({
    required String key,
    required List<String> value,
  }) async {
    await sharedPreferences?.setStringList(key, value);
    return null;
  }

  static getStringList({
    required String key,
  }) async {
    return sharedPreferences?.getStringList(key);
  }

  static void setInt({
    required String key,
    required int value,
  }) async {
    await sharedPreferences?.setInt(key, value);
    return null;
  }

  static Future<int?> getInt({
    required String key,
  }) async {
    return sharedPreferences?.getInt(key);
  }

  static Future<bool?> setBoolean({
    required String key,
    required bool value,
  }) async {
    await sharedPreferences?.setBool(key, value);
    return null;
  }

  static bool? getBoolean({
    required String key,
  }) {
    return sharedPreferences?.getBool(key);
  }

  static remove({required String key}) async {
    await sharedPreferences?.remove(key);
  }
}
