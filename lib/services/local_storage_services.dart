import 'package:shared_preferences/shared_preferences.dart';

// abstract class LocalStorageService {
//   Future setBool(String key, bool value);
//   Future setString(String key, String value);
//   // Future setDouble(String key, num value);

//   Future<bool> getBool(String key);
//   Future<String> getString(String key);
//   Future<double> getDouble(String key);

//   Future<bool> clearStorage();
// }

class SharedPreferenceLocalStorage {
  static SharedPreferenceLocalStorage? _instance;
  static SharedPreferences? _preferences;
  static Future<SharedPreferenceLocalStorage> getInstance() async {
    if (_instance == null) {
      _instance = SharedPreferenceLocalStorage();
    }
    if (_preferences == null) {
      _preferences = await SharedPreferences.getInstance();
    }
    return _instance!;
  }

  Future setBool(String key, bool value) async {
    await _preferences?.setBool(key, value);
  }

  Future setString(String key, String value) async {
    await _preferences?.setString(key, value);
  }

  Future setDouble(String key, num value) {
    return _preferences!.setDouble(key, value.toDouble());
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

  Future<bool?> clearStorage() async {
    return _preferences?.clear();
  }
}
