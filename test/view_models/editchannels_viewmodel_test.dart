import 'package:flutter_test/flutter_test.dart';
import 'package:hng/ui/view/channel/edit_channel/edit_channel_view_model.dart';
import 'package:mockito/mockito.dart';
import '../helpers/test_helpers.dart';

void main() {
  group('NewChannelTest -', () {
    setUp(() => registerServices());
    tearDown(() => unregisterServices());

    group('initialize -', () {
      test('When called, check if snackbar service was called', () async {
        final snackbarService = getAndRegisterSnackbarServiceMock();
        final model = EditChannelViewModel();
        model.editChannel();
        verifyNever(snackbarService.showCustomSnackBar());
        // verify(channelService.hasUser);
      });
    });
  });
}
