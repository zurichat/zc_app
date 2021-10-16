import 'package:flutter_test/flutter_test.dart';
import 'package:zurichat/app/app.router.dart';
import 'package:zurichat/ui/view/login/login_viewmodel.dart';
import 'package:mockito/mockito.dart';

import '../helpers/test_helpers.dart';

void main() {
  group('NavigationServiceTest -', () {
    setUp(() => registerServices());
    tearDown(() => unregisterServices());
    group('LoginViewModel Navigation', () {
      test('When called, the app should navigate to the forgot password view',
          () async {
        final navigation = getAndRegisterNavigationServiceMock();
        var model = LoginViewModel();
        model.navigateToForgotPasswordScreen();
        verify(navigation.navigateTo(Routes.forgotPasswordEmailView));
      });
    });
  });
}
