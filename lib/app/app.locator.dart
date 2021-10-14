// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedLocatorGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:hng/services/localization_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:stacked_themes/stacked_themes.dart';

import '../package/base/jump_to_request/jump_to_api.dart';
import '../package/base/server-request/channels/channels_api_service.dart';
import '../package/base/server-request/dms/dms_api_service.dart';
import '../services/centrifuge_service.dart';
import '../services/connectivity_service.dart';
import '../services/local_storage_services.dart';
import '../services/media_service.dart';
import '../services/notification_service.dart';
import '../services/user_service.dart';

final locator = StackedLocator.instance;

Future setupLocator(
    {String? environment, EnvironmentFilter? environmentFilter}) async {
// Register environments
  locator.registerEnvironment(
      environment: environment, environmentFilter: environmentFilter);

// Register dependencies
  locator.registerLazySingleton(() => NavigationService());
  locator.registerLazySingleton(() => SnackbarService());

  final themeService = ThemeService.getInstance();
  locator.registerSingleton(themeService);

  final sharedPreferenceLocalStorage =
      await SharedPreferenceLocalStorage.getInstance();
  locator.registerSingleton(sharedPreferenceLocalStorage);

  locator.registerLazySingleton(() => DialogService());
  locator.registerLazySingleton(() => BottomSheetService());
  final connectivityService = await ConnectivityService.getInstance();
  locator.registerSingleton(connectivityService);

  locator.registerLazySingleton(() => UserService());
  locator.registerLazySingleton(() => LocalizationService());
  locator.registerLazySingleton(() => MediaService());
  locator.registerLazySingleton(() => DMApiService());
  locator.registerLazySingleton(() => ChannelsApiService());
  locator.registerLazySingleton(() => JumpToApi());
  locator.registerLazySingleton(() => NotificationService());
  final centrifugeService = await CentrifugeService.getInstance();
  locator.registerSingleton(centrifugeService);
}
