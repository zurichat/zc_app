import 'package:hng/app/app.locator.dart';
import 'package:hng/services/user_service.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hng/ui/view/login/login_viewmodel.dart';
import '../setup/test_helpers.dart';

void main() {
  group('loginViewModelTest -', () {
    group('initialise -', () {
      test('When called, check if user is registered on the system', () async {
        var userService = UserServiceMock();
        locator.registerSingleton<UserService>(userService);
        await setupLocator();
        var model = LoginViewModel();
        await model.initialise();
        verify(userService.hasUser);
      });
    });
  });
}
