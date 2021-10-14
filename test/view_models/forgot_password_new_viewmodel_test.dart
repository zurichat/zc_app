import 'package:flutter_test/flutter_test.dart';
import 'package:hng/app/app.router.dart';
import 'package:hng/ui/view/forgot_password/forgot_password_new_password/forgot_password_newviewmodel.dart';
import 'package:mockito/mockito.dart';

import '../helpers/test_helpers.dart';

void main() {
  group('Forgot password New ViewModel Test -', () {
    group('initialise/navigation -', () {
      setUp(() => registerServices());
      tearDown(() => unregisterServices());
      test('when called, check if new password is valid', () {
        final model = ForgotPasswordNewViewModel();
        var valid = model.passValidation("Test1234");
        expect(valid, true);
      });

      test('when called navigate to login view if password is valid', () {
        final service = getAndRegisterNavigationServiceMock();
        final model = ForgotPasswordNewViewModel();
        model.passValidation("Test1234");
        verify(service.navigateTo(Routes.loginView));
      });
    });
  });
}
