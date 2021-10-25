// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedLocatorGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';

import '../services/app_services/connectivity_service.dart';
import '../services/app_services/local_storage_services.dart';
import '../services/app_services/localization_service.dart';
import '../services/app_services/media_service.dart';
import '../services/app_services/notification_service.dart';
import '../services/app_services/zuri_theme_service.dart';
import '../services/in_review/jump_to_api.dart';
import '../services/core_services/organization_api_service.dart';
import '../services/in_review/status_service.dart';
import '../services/in_review/user_service.dart';
import '../services/messaging_services/centrifuge_rtc_service.dart';
import '../services/messaging_services/channels_api_service.dart';
import '../services/messaging_services/dms_api_service.dart';

final locator = StackedLocator.instance;

Future setupLocator(
    {String? environment, EnvironmentFilter? environmentFilter}) async {
// Register environments
  locator.registerEnvironment(
      environment: environment, environmentFilter: environmentFilter);

// Register dependencies
  locator.registerLazySingleton(() => NavigationService());
  locator.registerLazySingleton(() => SnackbarService());
  final zuriThemeService = await ZuriThemeService.getInstance();
  locator.registerSingleton(zuriThemeService);

  locator.registerLazySingleton(() => LocalizationService());
  final sharedPreferenceLocalStorage =
      await SharedPreferenceLocalStorage.getInstance();
  locator.registerSingleton(sharedPreferenceLocalStorage);

  locator.registerLazySingleton(() => DialogService());
  locator.registerLazySingleton(() => BottomSheetService());
  final connectivityService = await ConnectivityService.getInstance();
  locator.registerSingleton(connectivityService);

  locator.registerLazySingleton(() => UserService());
  locator.registerLazySingleton(() => MediaService());
  locator.registerLazySingleton(() => DMApiService());
  locator.registerLazySingleton(() => ChannelsApiService());
  locator.registerLazySingleton(() => JumpToApi());
  locator.registerLazySingleton(() => NotificationService());
  final centrifugeService = await CentrifugeService.getInstance();
  locator.registerSingleton(centrifugeService);

  locator.registerLazySingleton(() => StatusService());
  locator.registerLazySingleton(() => OrganizationApiService());
}
