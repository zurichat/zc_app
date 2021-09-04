// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedLocatorGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';

import '../services/connectivity_service.dart';
import '../services/local_storage_services.dart';

final locator = StackedLocator.instance;

Future setupLocator(
    {String? environment, EnvironmentFilter? environmentFilter}) async {
// Register environments
  locator.registerEnvironment(
      environment: environment, environmentFilter: environmentFilter);

// Register dependencies
  locator.registerLazySingleton(() => NavigationService());

  final connectivityService = ConnectivityService.getInstance();
  final sharedPreferenceLocalStorage =
      await SharedPreferenceLocalStorage.getInstance();

  locator.registerSingleton(sharedPreferenceLocalStorage);
  locator.registerLazySingleton(() => connectivityService);
}
