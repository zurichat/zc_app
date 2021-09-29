import 'package:hng/app/app.locator.dart';
import 'package:hng/services/local_storage_services.dart';
import 'package:hng/services/user_service.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'test_helpers.mocks.dart';

///SUPPLY THE MOCKS FOR ANY SERVICE YOU WANT TO AUTO-GENERATE.
///ONCE YOU SUPPLY BELOW AUTO GENERATE BY RUNNING "flutter pub run build_runner build --delete-conflicting-outputs"

@GenerateMocks([], customMocks: [
  MockSpec<UserService>(returnNullOnMissingStub: true),
  MockSpec<SharedPreferenceLocalStorage>(returnNullOnMissingStub: true),
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

void registerServices() {
  getAndRegisterUserServiceMock();
  getAndRegisterSharedPreferencesLocalStorageMock();
}

void unregisterServices() {
  _removeRegistrationIfExists<UserService>();
  _removeRegistrationIfExists<SharedPreferenceLocalStorage>();
}

// Call this before any service registration helper. This is to ensure that if there
// is a service registered we remove it first. We register all services to remove boiler plate from tests
void _removeRegistrationIfExists<T extends Object>() {
  if (locator.isRegistered<T>()) {
    locator.unregister<T>();
  }
}
