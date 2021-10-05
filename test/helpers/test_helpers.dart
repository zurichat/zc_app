import 'package:hng/app/app.locator.dart';
import 'package:hng/app/app.router.dart';
import 'package:hng/package/base/jump_to_request/jump_to_api.dart';
import 'package:hng/package/base/server-request/api/zuri_api.dart';
import 'package:hng/package/base/server-request/channels/channels_api_service.dart';
import 'package:hng/package/base/server-request/dms/dms_api_service.dart';
import 'package:hng/services/centrifuge_service.dart';
import 'package:hng/services/connectivity_service.dart';
import 'package:hng/services/local_storage_services.dart';
import 'package:hng/services/media_service.dart';
import 'package:hng/services/user_service.dart';
import 'package:hng/utilities/enums.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:stacked_themes/stacked_themes.dart';

import 'test_constants.dart';
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
<<<<<<< HEAD
=======
  MockSpec<MediaService>(returnNullOnMissingStub: true),
  MockSpec<OrganizationApiService>(returnNullOnMissingStub: true),
>>>>>>> ca7d0036395b62a179e387bc8e8a66a9b2839728
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
  when(service.back()).thenAnswer((realInvocation) => true);
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

MockDialogService getAndRegisterDialogServiceMock(
    {DialogResponse<dynamic>? dialogResult /*,String? currentEmoji*/}) {
  _removeRegistrationIfExists<DialogService>();
  final service = MockDialogService();
  Future<DialogResponse<dynamic>?> response =
      Future.value(DialogResponse(confirmed: true));
  when(service.showCustomDialog(
    variant: DialogType.skinTone,
  )).thenAnswer((realInvocation) => response);
  locator.registerSingleton<DialogService>(service);

  return service;
}

MockBottomSheetService getAndRegisterBottomSheetServiceMock() {
  _removeRegistrationIfExists<BottomSheetService>();
  final service = MockBottomSheetService();
  Future<SheetResponse<dynamic>?> response =
      Future.value(SheetResponse(confirmed: true));
  when(service.showCustomSheet(
    variant: BottomSheetType.user,
    isScrollControlled: true,
  )).thenAnswer((realInvocation) => response);
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
  final service = MockCentrifugeService();
  _removeRegistrationIfExists<CentrifugeService>();
  Map eventData = {"some_key": "some_returned_string"};
  final Future<Stream?> streamtoReturn =
      Future.value(Stream.fromIterable([eventData]));
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

  when(service.uploadImage(fileMock,
          token: token_string, memberId: memberId_string, orgId: orgId_string))
      .thenAnswer((_) async => Future.value("Image Address"));
  return service;
}

MockConnectivityService getAndRegisterConnectivityServiceMock() {
  _removeRegistrationIfExists<ConnectivityService>();
  final service = MockConnectivityService();
  var result = Future.value(const bool.fromEnvironment('network status'));
  when(service.checkConnection()).thenAnswer((realInvocation) => result);
  locator.registerSingleton<ConnectivityService>(service);

  return service;
}

MockJumpToApi getAndRegisterJumpToApiMock() {
  _removeRegistrationIfExists<JumpToApi>();
  final service = MockJumpToApi();
  locator.registerSingleton<JumpToApi>(service);

  return service;
}

<<<<<<< HEAD
=======
MockMediaService getAndRegisterMediaServiceMock() {
  _removeRegistrationIfExists<MediaService>();
  final service = MockMediaService();
  Future<String> response = Future<String>.value("Image Address");

  when(service.uploadImage(fileMock)).thenAnswer((_) async => response);

  locator.registerSingleton<MediaService>(service);
  return service;
}

>>>>>>> ca7d0036395b62a179e387bc8e8a66a9b2839728
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
  getAndRegisterMediaServiceMock();
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
  _removeRegistrationIfExists<MediaService>();
}

// Call this before any service registration helper. This is to ensure that if there
// is a service registered we remove it first. We register all services to remove boiler plate from tests
void _removeRegistrationIfExists<T extends Object>() {
  if (locator.isRegistered<T>()) {
    locator.unregister<T>();
  }
}
