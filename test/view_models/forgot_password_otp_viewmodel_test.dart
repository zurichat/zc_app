import 'package:flutter_test/flutter_test.dart';
import 'package:hng/app/app.router.dart';
import 'package:hng/ui/view/forgot_password/forgot_password_otp/forgot_password_otpviewmodel.dart';
import 'package:mockito/mockito.dart';

import '../helpers/test_helpers.dart';

void main() {
  group('Forgot Password OTP ViewModel Test -', () {
    setUp(() => registerServices());
    tearDown(() => unregisterServices());
    group('initialise/navigation -', () {
      test('when called, verify navigate to Forgot password new ', () {
        final service = getAndRegisterNavigationServiceMock();
        final model = ForgotPasswordOtpViewModel();
        verify(service.navigateTo(Routes.forgotPasswordNewView));
      });

    });
  });
}
