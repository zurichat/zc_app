import 'package:flutter_test/flutter_test.dart';
import 'package:zurichat/ui/view/forgot_password/forgot_password_email/forgot_password_email_viewmodel.dart';
import 'package:mockito/mockito.dart';
import '../helpers/test_helpers.dart';

void main() {
  group('forgetPasswordEmailViewModelTest -', () {
    group('initialise -', () {
      setUp(() => registerServices());
      tearDown(() => unregisterServices());
      test('when called, check if user inputed email is valid', () async {
        var model = ForgotPasswordEmailViewModel();
        var valid = model.emailValidation('abcd@xyz.com');
        expect(valid, true);
      });

      test('when called,check if navigates to otp view', () {
        final model = ForgotPasswordEmailViewModel();
        verify(model.navigateToForgotPasswordOtpView());
      });
    });
  });
}
