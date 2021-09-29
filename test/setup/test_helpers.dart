import 'package:hng/app/app.locator.dart';
import 'package:hng/services/user_service.dart';
import 'package:mockito/mockito.dart';
import 'package:stacked_services/stacked_services.dart';

class UserServiceMock extends Mock implements UserService {}

class NavigationServiceMock extends Mock implements NavigationService {}

UserService getAndRegisterUserServiceMock() {
  var service = UserServiceMock();
  locator.registerSingleton<UserService>(service);
  return service;
}
