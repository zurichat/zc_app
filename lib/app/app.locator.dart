// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedLocatorGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';
<<<<<<< HEAD
=======
import 'package:stacked_themes/stacked_themes.dart';
>>>>>>> df4d1955f3466c2d4ec7ff4f61ac9cdb746454a0

final locator = StackedLocator.instance;

void setupLocator({String? environment, EnvironmentFilter? environmentFilter}) {
// Register environments
  locator.registerEnvironment(
      environment: environment, environmentFilter: environmentFilter);

// Register dependencies
  locator.registerLazySingleton(() => NavigationService());
<<<<<<< HEAD
=======
  locator.registerLazySingleton(() => ThemeService());
>>>>>>> df4d1955f3466c2d4ec7ff4f61ac9cdb746454a0
}
