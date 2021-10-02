import 'package:flutter_test/flutter_test.dart';
import 'package:hng/ui/view/channel/channel_notification/channel_notification_viewmodel.dart';
import '../helpers/test_helpers.dart';

// This is a test setup
void main() {
  group('ChannelNotificationViewModelTest -', () {
    setUp(() => registerServices());
    tearDown(() => unregisterServices());
    group('toggleOptions -', () {
      test(
          'When toggleOptions is called and a string value is entered, should be true.',
          () {
        final model = ChannelNotificationViewModel();
        model.toggleOptions('val');
        //verify(toggleOptions was called);
      });
    });
  });
}
