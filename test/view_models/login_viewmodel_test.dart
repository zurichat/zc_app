import 'package:flutter_test/flutter_test.dart';
import 'package:hng/ui/view/login/login_viewmodel.dart';
import 'package:mockito/mockito.dart';
import '../helpers/test_helpers.dart';

// This is a test setup
void main() {
  group('loginViewModelTest -', () {
    setUp(() => registerServices());
    tearDown(() => unregisterServices());
    group('initialise -', () {
      test('When called, check if user is registered on the system', () async {
        final userService = getAndRegisterUserServiceMock();
        final model = LoginViewModel();
        await model.initialise();
        verify(userService.hasUser);
      });
    });
  });
}
