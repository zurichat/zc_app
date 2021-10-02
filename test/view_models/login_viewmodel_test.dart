import 'package:flutter_test/flutter_test.dart';
import 'package:hng/app/app.router.dart';
import 'package:hng/ui/view/login/login_viewmodel.dart';
import 'package:mockito/mockito.dart';
import '../helpers/test_helpers.dart';

// This is a test setup
void main() {
  group('loginViewModelTest -', () {
    setUp(() => registerServices());
    tearDown(() => unregisterServices());
    group('initialise/navigation -', () {
      test('when called, load progressindicator if there is no user', () async {
        final userService = getAndRegisterUserServiceMock();
        final model = LoginViewModel();
        var load = model.isLoading;
        expect(load, userService.hasUser);
      });

      test('When called, check if user is registered on the system', () async {
        final userService = getAndRegisterUserServiceMock();
        final model = LoginViewModel();
        await model.initialise();
        verify(userService.hasUser);
      });

      test('when called, check if user navigates to signup screen', () {
        final service = getAndRegisterNavigationServiceMock();
        final model = LoginViewModel();
        verify(model.navigateToSignUpScreen()).called(1);
      });

      test('when called, check if user navigates to forgot password screen',
          () {
        final service = getAndRegisterNavigationServiceMock();
        final model = LoginViewModel();
        verify(model.navigateToForgotPasswordScreen()).called(1);
      });
    });
  });
}
