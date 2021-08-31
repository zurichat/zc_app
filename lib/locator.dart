import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'services/local_storage_services.dart';

final locator = GetIt.instance;

class AppDependencies {
  AppDependencies._();
  static AppDependencies locate = AppDependencies._();

  Future<void> reset() async {
    await locator.reset();
    await register();
  }

  Future<void> register() async {
    _registerServices();
    await _registerExternalDependencies();
  }

  /// _____________________________________________
  /// _____________________________________________
  /// Register single instances for abstraction of
  /// **storage**, **payments**
  void _registerServices() async {
    locator.registerLazySingleton<LocalStorageService>(
      () => SharedPreferenceLocalStorage(sharedPreferences: locator()),
    );
  }

  /// ____________________________________
  /// ____________________________________
  Future<void> _registerExternalDependencies() async {
    final instance = await SharedPreferences.getInstance();
    locator.registerLazySingleton<SharedPreferences>(() => instance);
  }
}
