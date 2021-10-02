import 'package:hng/app/app.locator.dart';
import 'package:hng/app/app.router.dart';
import 'package:hng/package/base/jump_to_request/jump_to_api.dart';
import 'package:hng/package/base/server-request/api/zuri_api.dart';
import 'package:hng/package/base/server-request/channels/channels_api_service.dart';
import 'package:hng/package/base/server-request/dms/dms_api_service.dart';
import 'package:hng/services/centrifuge_service.dart';
import 'package:hng/services/connectivity_service.dart';
import 'package:hng/services/local_storage_services.dart';
import 'package:hng/services/user_service.dart';
import 'package:hng/utilities/enums.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:stacked_themes/stacked_themes.dart';

import 'test_helpers.mocks.dart';

///SUPPLY THE MOCKS FOR ANY SERVICE YOU WANT TO AUTO-GENERATE.
///ONCE YOU SUPPLY BELOW AUTO GENERATE BY RUNNING ""

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
  locator.registerSingleton<SharedPreferenceLocalStorage>(service);

  return service;
}

MockNavigationService getAndRegisterNavigationServiceMock() {
  _removeRegistrationIfExists<NavigationService>();
  final service = MockNavigationService();
  locator.registerSingleton<NavigationService>(service);
  service.navigateTo(Routes.signUpView);
  service.navigateTo(Routes.forgotPasswordEmailView);
  service.navigateTo(Routes.forgotPasswordOtpView);
  service.navigateTo(Routes.forgotPasswordNewView);
  service.navigateTo(Routes.loginView);
  return service;
}

MockSnackbarService getAndRegisterSnackbarServiceMock(
    {bool userRegistered = false}) {
  _removeRegistrationIfExists<SnackbarService>();
  final service = MockSnackbarService();
  when(service.showCustomSnackBar(
    variant: SnackbarType.failure,
  )).thenAnswer((_) => Future.value(userRegistered));
  locator.registerSingleton<SnackbarService>(service);
  return service;
}

MockThemeService getAndRegisterThemeServiceMock() {
  _removeRegistrationIfExists<ThemeService>();
  final service = MockThemeService();
  locator.registerSingleton<ThemeService>(service);

  return service;
}

MockDialogService getAndRegisterDialogServiceMock() {
  _removeRegistrationIfExists<DialogService>();
  final service = MockDialogService();
  locator.registerSingleton<DialogService>(service);

  return service;
}

MockBottomSheetService getAndRegisterBottomSheetServiceMock() {
  _removeRegistrationIfExists<BottomSheetService>();
  final service = MockBottomSheetService();
  locator.registerSingleton<BottomSheetService>(service);

  return service;
}

MockDMApiService getAndRegisterDMApiServiceMock() {
  _removeRegistrationIfExists<DMApiService>();
  final service = MockDMApiService();
  locator.registerSingleton<DMApiService>(service);

  return service;
}

MockChannelsApiService getAndRegisterChannelsApiServiceMock() {
  _removeRegistrationIfExists<ChannelsApiService>();
  final service = MockChannelsApiService();
  locator.registerSingleton<ChannelsApiService>(service);

  return service;
}

MockCentrifugeService getAndRegisterCentrifugeServiceMock() {
  _removeRegistrationIfExists<CentrifugeService>();
  Map eventData = {"some_key": "some_returned_string"};
  final Future<Stream?> streamtoReturn =
      Future.value(Stream.fromIterable([eventData]));
  final service = MockCentrifugeService();
  when(service.subscribe("channelSocketID"))
      .thenAnswer((_) async => streamtoReturn);

  when(service.subscribe("")).thenAnswer((_) => throw Exception(
      "Channel Socket ID is required to subscribe to a channel"));

  locator.registerSingleton<CentrifugeService>(service);

  return service;
}

MockZuriApi getAndRegisterZuriApiMock() {
  _removeRegistrationIfExists<ZuriApi>();
  final service = MockZuriApi();
  locator.registerSingleton<ZuriApi>(service);

  return service;
}

MockConnectivityService getAndRegisterConnectivityServiceMock() {
  _removeRegistrationIfExists<ConnectivityService>();
  final service = MockConnectivityService();
  locator.registerSingleton<ConnectivityService>(service);
  return service;
}

MockJumpToApi getAndRegisterJumpToApiMock() {
  _removeRegistrationIfExists<JumpToApi>();
  final service = MockJumpToApi();
  locator.registerSingleton<JumpToApi>(service);

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
