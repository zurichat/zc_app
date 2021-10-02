import 'package:flutter_test/flutter_test.dart';
import 'package:hng/app/app.router.dart';
import 'package:hng/ui/view/otp/otp_viewmodel.dart';
import 'package:mockito/mockito.dart';

import '../helpers/test_helpers.dart';

void main() {
  group('OTP viewmodel -', () {
    setUp(() => registerServices());
    tearDown(() => unregisterServices());
    group('initialize -', () {
      test('when called navigate to login view', () {
        final service = getAndRegisterNavigationServiceMock();
        final model = OTPViewModel();
        model.navigateLogin;
        verify(service.navigateTo(Routes.loginView));
      });

      test('when called, verify otp value is true,hence loading indicator is false',
          () {
        final model = OTPViewModel();
        var load = model.isLoading;
        expect(load, false);
      });
    });
  });
}
