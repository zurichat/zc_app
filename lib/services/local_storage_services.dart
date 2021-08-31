import 'package:shared_preferences/shared_preferences.dart';

abstract class LocalStorageService {
  Future setBool(String key, bool value);
  Future setString(String key, String value);
  Future setDouble(String key, num value);

  Future<bool> getBool(String key);
  Future<String> getString(String key);
  Future<double> getDouble(String key);

  Future<bool> clearStorage();
}

class SharedPreferenceLocalStorage implements LocalStorageService {
  final SharedPreferences sharedPreferences;

  SharedPreferenceLocalStorage({required this.sharedPreferences});

  @override
  Future setBool(String key, bool value) async {
    await sharedPreferences.setBool(key, value);
  }

  @override
  Future setString(String key, String value) async {
    await sharedPreferences.setString(key, value);
  }

  @override
  Future setDouble(String key, num value) {
    return sharedPreferences.setDouble(key, value.toDouble());
  }

  @override
  Future<bool> getBool(String key) async {
    return Future.value(sharedPreferences.getBool(key));
  }

  @override
  Future<String> getString(String key) async {
    return Future.value(sharedPreferences.getString(key));
  }

  @override
  Future<double> getDouble(String key) async {
    return Future.value(sharedPreferences.getDouble(key));
  }

  @override
  Future<bool> clearStorage() async {
    return Future.value(sharedPreferences.clear());
  }
}
