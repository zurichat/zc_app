import 'package:flutter_test/flutter_test.dart';
import 'package:hng/ui/view/clear_after/clear_after_viewmodel.dart';

import '../helpers/test_helpers.dart';

void main() {
  group('ClearAfterTest -', () {
    setUp(() => registerServices());
    tearDown(() => unregisterServices());

    group('initialize -', () {
      test('When called, check for expected value', () async {
        //final snackbarService = getAndRegisterSnackbarServiceMock();
        final model = ClearAfterViewModel();
        model.changeTime(1);
        expect(model.currentValue, 1);
        // verify(channelService.hasUser);
      });
    });
  });
}
