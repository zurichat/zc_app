import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:stacked_themes/stacked_themes.dart';
import 'package:zurichat/app/app.locator.dart';
import 'package:zurichat/app/app.router.dart';
import 'package:zurichat/models/channels_search_model.dart';
import 'package:zurichat/models/user_search_model.dart';
import 'package:zurichat/services/app_services/connectivity_service.dart';
import 'package:zurichat/services/app_services/local_storage_services.dart';
import 'package:zurichat/services/app_services/media_service.dart';
import 'package:zurichat/services/core_services/organization_api_service.dart';
import 'package:zurichat/services/in_review/jump_to_api.dart';
import 'package:zurichat/services/in_review/user_service.dart';
import 'package:zurichat/services/messaging_services/centrifuge_rtc_service.dart';
import 'package:zurichat/services/messaging_services/channels_api_service.dart';
import 'package:zurichat/services/messaging_services/dms_api_service.dart';
import 'package:zurichat/utilities/api_handlers/zuri_api.dart';
import 'package:zurichat/utilities/enums.dart';

import 'test_constants.dart';
import 'test_helpers.mocks.dart';

///SUPPLY THE MOCKS FOR ANY SERVICE YOU WANT TO AUTO-GENERATE.
///ONCE YOU SUPPLY BELOW AUTO GENERATE BY RUNNING ""
@GenerateMocks([], customMocks: [
  MockSpec<UserService>(onMissingStub: null),
  MockSpec<SharedPreferenceLocalStorage>(onMissingStub: null),
  MockSpec<NavigationService>(onMissingStub: null),
  MockSpec<SnackbarService>(onMissingStub: null),
  MockSpec<ThemeService>(onMissingStub: null),
  MockSpec<DialogService>(onMissingStub: null),
  MockSpec<BottomSheetService>(onMissingStub: null),
  MockSpec<DMApiService>(onMissingStub: null),
  MockSpec<ChannelsApiService>(onMissingStub: null),
  MockSpec<CentrifugeService>(onMissingStub: null),
  MockSpec<ZuriApi>(onMissingStub: null),
  MockSpec<ConnectivityService>(onMissingStub: null),
  MockSpec<JumpToApi>(onMissingStub: null),
  MockSpec<MediaService>(onMissingStub: null),
  MockSpec<OrganizationApiService>(onMissingStub: null),
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
    message: anyNamed('message'),
    variant: SnackbarType.failure,
  )).thenAnswer((_) => Future.value(userRegistered));
  locator.registerSingleton<SnackbarService>(service);
  return service;
}

MockThemeService getAndRegisterThemeServiceMock() {
  _removeRegistrationIfExists<ThemeService>();
  final service = MockThemeService();
  var result = Future.value(const bool.fromEnvironment('Dark Mode'));
  when(service.selectThemeAtIndex(0)).thenAnswer((realInvocation) => result);
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
  final Future<Stream?> streamToReturn =
      Future.value(Stream.fromIterable([eventData]));
  when(service.subscribe("channelSocketID"))
      .thenAnswer((_) async => streamToReturn);

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
          token: token_string, pluginId: pluginId_string))
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
  when(service.allChannelsList())
      .thenAnswer((realInvocation) => Future.value([ChannelsSearch()]));
  when(service.fetchList())
      .thenAnswer((realInvocation) => Future.value([NewUser()]));
  return service;
}

MockMediaService getAndRegisterMediaServiceMock() {
  _removeRegistrationIfExists<MediaService>();
  final service = MockMediaService();
  Future<String> response = Future<String>.value("Image Address");

  when(service.uploadImage(fileMock, pluginId_string))
      .thenAnswer((_) async => response);

  locator.registerSingleton<MediaService>(service);
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
