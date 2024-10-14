import 'package:shared_preferences/shared_preferences.dart';

import '../utils.dart';

class Prefs {
  static String onboard = 'onboard';
}

Future<bool> getData() async {
  try {
    final prefs = await SharedPreferences.getInstance();
    // await prefs.remove(Prefs.onboard);
    // await prefs.clear();
    bool onboard = prefs.getBool(Prefs.onboard) ?? true;
    return onboard;
  } catch (e) {
    logger(e);
    return true;
  }
}

Future<void> saveOnboard() async {
  final prefs = await SharedPreferences.getInstance();
  prefs.setBool(Prefs.onboard, false);
}

Future<void> saveString(String key, String value) async {
  final prefs = await SharedPreferences.getInstance();
  prefs.setString(key, value);
}

Future<void> saveInt(String key, int value) async {
  final prefs = await SharedPreferences.getInstance();
  prefs.setInt(key, value);
}

Future<void> saveBool(String key, bool value) async {
  final prefs = await SharedPreferences.getInstance();
  prefs.setBool(key, value);
}
