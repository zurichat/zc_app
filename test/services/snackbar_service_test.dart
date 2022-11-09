import 'package:centrifuge/centrifuge.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import '../helpers/test_helpers.dart';

void main() {
  group('SnackbarServiceTest -', () {
    setUp(() => registerServices());
    tearDown(() => unregisterServices());
    group('Custom Snackbar', () {
      test('When called, a customSnackBar is shown', () async {
        var snackbar = getAndRegisterSnackbarServiceMock();
        await snackbar.showCustomSnackBar(
            message:
                Error.custom(401, 'Could not create workspace', true).toString());
        verify(snackbar.showCustomSnackBar(
            message:
                Error.custom(401, 'Could not create workspace', true).toString()));
      });
    });
  });
}
