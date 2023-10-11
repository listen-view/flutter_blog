import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage {
  static Future<dynamic> get(String keyName) async {
    final storageIns = await SharedPreferences.getInstance();
    return storageIns.getString(keyName);
  }

  static Future<void> set(String keyName, dynamic value) async {
    final storageIns = await SharedPreferences.getInstance();
    storageIns.setString(keyName, value);
  }

  static Future<void> remove(String keyName) async {
    final storageIns = await SharedPreferences.getInstance();
    storageIns.remove(keyName);
  }
}