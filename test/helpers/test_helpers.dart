import 'package:hng/app/app.locator.dart';
import 'package:hng/package/base/jump_to_request/jump_to_api.dart';
import 'package:hng/package/base/server-request/api/zuri_api.dart';
import 'package:hng/package/base/server-request/channels/channels_api_service.dart';
import 'package:hng/package/base/server-request/dms/dms_api_service.dart';
import 'package:hng/services/centrifuge_service.dart';
import 'package:hng/services/connectivity_service.dart';
import 'package:hng/services/local_storage_services.dart';
import 'package:hng/services/user_service.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:stacked_themes/stacked_themes.dart';

import 'test_helpers.mocks.dart';

///SUPPLY THE MOCKS FOR ANY SERVICE YOU WANT TO AUTO-GENERATE.
///ONCE YOU SUPPLY BELOW AUTO GENERATE BY RUNNING "flutter pub run build_runner build --delete-conflicting-outputs"

@GenerateMocks([], customMocks: [
  MockSpec<UserService>(returnNullOnMissingStub: true),
  MockSpec<SharedPreferenceLocalStorage>(returnNullOnMissingStub: true),
  MockSpec<NavigationService>(returnNullOnMissingStub: true),
  MockSpec<SnackbarService>(returnNullOnMissingStub: true),
  MockSpec<ThemeService>(returnNullOnMissingStub: true),
  MockSpec<DialogService>(returnNullOnMissingStub: true),
  MockSpec<BottomSheetService>(returnNullOnMissingStub: true),
  MockSpec<DMApiService>(returnNullOnMissingStub: true),
  MockSpec<ChannelsApiService>(returnNullOnMissingStub: true),
  MockSpec<CentrifugeService>(returnNullOnMissingStub: true),
  MockSpec<ZuriApi>(returnNullOnMissingStub: true),
  MockSpec<ConnectivityService>(returnNullOnMissingStub: true),
  MockSpec<JumpToApi>(returnNullOnMissingStub: true),
])
MockUserService getAndRegisterUserServiceMock({
  bool hasUser = false,
}) {
  _removeRegistrationIfExists<UserService>();
  final service = MockUserService();
  when(service.hasUser).thenReturn(hasUser);
  locator.registerSingleton<UserService>(service);
  return service;
}

MockSharedPreferenceLocalStorage
    getAndRegisterSharedPreferencesLocalStorageMock() {
  _removeRegistrationIfExists<SharedPreferenceLocalStorage>();
  final service = MockSharedPreferenceLocalStorage();
  return service;
}

MockNavigationService getAndRegisterNavigationServiceMock() {
  _removeRegistrationIfExists<NavigationService>();
  final service = MockNavigationService();
  return service;
}

MockSnackbarService getAndRegisterSnackbarServiceMock() {
  _removeRegistrationIfExists<SnackbarService>();
  final service = MockSnackbarService();
  return service;
}

MockThemeService getAndRegisterThemeServiceMock() {
  _removeRegistrationIfExists<ThemeService>();
  final service = MockThemeService();
  return service;
}

MockDialogService getAndRegisterDialogServiceMock() {
  _removeRegistrationIfExists<DialogService>();
  final service = MockDialogService();
  return service;
}

MockBottomSheetService getAndRegisterBottomSheetServiceMock() {
  _removeRegistrationIfExists<BottomSheetService>();
  final service = MockBottomSheetService();
  return service;
}

MockDMApiService getAndRegisterDMApiServiceMock() {
  _removeRegistrationIfExists<DMApiService>();
  final service = MockDMApiService();
  return service;
}

MockChannelsApiService getAndRegisterChannelsApiServiceMock() {
  _removeRegistrationIfExists<ChannelsApiService>();
  final service = MockChannelsApiService();
  return service;
}

MockCentrifugeService getAndRegisterCentrifugeServiceMock() {
  _removeRegistrationIfExists<CentrifugeService>();
  final service = MockCentrifugeService();
  return service;
}

MockZuriApi getAndRegisterZuriApiMock() {
  _removeRegistrationIfExists<ZuriApi>();
  final service = MockZuriApi();
  return service;
}

MockConnectivityService getAndRegisterConnectivityServiceMock() {
  _removeRegistrationIfExists<ConnectivityService>();
  final service = MockConnectivityService();
  return service;
}

MockJumpToApi getAndRegisterJumpToApiMock() {
  _removeRegistrationIfExists<JumpToApi>();
  final service = MockJumpToApi();
  return service;
}

void registerServices() {
  getAndRegisterUserServiceMock();
  getAndRegisterSharedPreferencesLocalStorageMock();
  getAndRegisterNavigationServiceMock();
  getAndRegisterSnackbarServiceMock();
  getAndRegisterThemeServiceMock();
  getAndRegisterDialogServiceMock();
  getAndRegisterBottomSheetServiceMock();
  getAndRegisterDMApiServiceMock();
  getAndRegisterChannelsApiServiceMock();
  getAndRegisterCentrifugeServiceMock();
  getAndRegisterZuriApiMock();
  getAndRegisterConnectivityServiceMock();
  getAndRegisterJumpToApiMock();
}

void unregisterServices() {
  _removeRegistrationIfExists<UserService>();
  _removeRegistrationIfExists<SharedPreferenceLocalStorage>();
  _removeRegistrationIfExists<UserService>();
  _removeRegistrationIfExists<SnackbarService>();
  _removeRegistrationIfExists<ThemeService>();
  _removeRegistrationIfExists<DialogService>();
  _removeRegistrationIfExists<BottomSheetService>();
  _removeRegistrationIfExists<ThemeService>();
  _removeRegistrationIfExists<DMApiService>();
  _removeRegistrationIfExists<ChannelsApiService>();
  _removeRegistrationIfExists<CentrifugeService>();
  _removeRegistrationIfExists<ZuriApi>();
  _removeRegistrationIfExists<ConnectivityService>();
  _removeRegistrationIfExists<JumpToApi>();
}

// Call this before any service registration helper. This is to ensure that if there
// is a service registered we remove it first. We register all services to remove boiler plate from tests
void _removeRegistrationIfExists<T extends Object>() {
  if (locator.isRegistered<T>()) {
    locator.unregister<T>();
  }
}
