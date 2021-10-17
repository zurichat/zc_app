import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:zurichat/utilities/constants.dart';

class SharedPreferenceLocalStorage {
  static SharedPreferenceLocalStorage? _instance;
  static SharedPreferences? _preferences;
  static Future<SharedPreferenceLocalStorage> getInstance() async {
    _instance ??= SharedPreferenceLocalStorage();
    _preferences ??= await SharedPreferences.getInstance();
    return _instance!;
  }

  Future setBool(String key, bool value) async {
    await _preferences?.setBool(key, value);
  }

  Future setString(String key, String value) async {
    await _preferences?.setString(key, value);
  }

  Future setDouble(String key, num value) async {
    return _preferences!.setDouble(key, value.toDouble());
  }

  Future setStringList(String key, List<String> value) async {
    await _preferences!.setStringList(key, value);
  }

  Future setMap(String key, Map map) async {
    String value = jsonEncode(map);
    await _preferences!.setString(key, value);
  }

  Future setList(String key, List<dynamic> map) async {
    String value = map.toString();
    await _preferences!.setString(key, value);
  }

  bool? getBool(String key) {
    return _preferences?.getBool(key);
  }

  String? getString(String key) {
    return _preferences?.getString(key);
  }

  double? getDouble(String key) {
    return _preferences?.getDouble(key);
  }

  List<String>? getStringList(String key) {
    return _preferences?.getStringList(key);
  }

  Future<Map> getMap(String key) {
    String? value = _preferences?.getString(key);
    return jsonDecode(value.toString());
  }

  List<dynamic> getList(String key) {
    String? value = _preferences?.getString(key);
    return value as List<dynamic>;
  }

  Future<bool?> clearData(String key) async {
    return await _preferences?.remove(key);
  }

  Future<bool?> clearStorage() async {
    return await _preferences?.clear();
  }

  Future setInt(String key, int value) async {
    return await _preferences?.setInt(key, value);
  }

  int? getInt(String key) {
    return _preferences?.getInt(key);
  }

  static int get localeVal =>
      _preferences!.getInt(LOCALE_VAL) ?? DEFAULT_LOCALE_VAL;

  static set localeVal(int val) => _preferences?.setInt(LOCALE_VAL, val);
}
