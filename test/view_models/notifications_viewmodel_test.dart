import 'package:flutter_test/flutter_test.dart';
import 'package:hng/ui/view/notifications/notifications_viewmodel.dart';
import '../helpers/test_helpers.dart';

void main() {
  group('notificationsViewModelTest -', () {
    setUp(() => registerServices());
    tearDown(() => unregisterServices());
    final model = NotificationsViewModel();

    group('test functions -', () {
      test('When called, checks if vibrate field changes value', () {
        model.toggleVibrate(false);
        expect(model.vibrate, false);
      });

      test('When called, checks if light field changes value', () {
        model.toggleLight(false);
        expect(model.light, false);
      });

      test('When called, checks if inAppNotification field changes value', () {
        model.toggleInAppNotification(false);
        expect(model.inAppNotification, false);
      });

      test('When called, checks if notifyOnKeyword field changes value', () {
        model.toggleNotifyOnKeyword(false);
        expect(model.notifyOnKeyword, false);
      });
    });
  });
}
