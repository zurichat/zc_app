import 'package:flutter_test/flutter_test.dart';
import 'package:hng/ui/view/notifications/notifications_viewmodel.dart';
import '../helpers/test_helpers.dart';

void main() {
  group('notificationsViewModelTest -', () {
    setUp(() => registerServices());
    tearDown(() => unregisterServices());

    group('initialise -', () {
      test('When constructed, checks if all the fields have a default state of true', () {
        final model = NotificationsViewModel();
        expect(model.vibrate, true);
        expect(model.light, true);
        expect(model.inAppNotification, true);
        expect(model.notifyOnKeyword, true);
      });
    });

    group('test functions -', () {
      test('When called, checks if vibrate field changes value', () {
        final model = NotificationsViewModel();
        model.toggleVibrate(false);
        expect(model.vibrate, false);
      });
      test('When called, checks if light field changes value', () {
        final model = NotificationsViewModel();
        model.toggleLight(false);
        expect(model.light, false);
      });
      test('When called, checks if inAppNotification field changes value', () {
        final model = NotificationsViewModel();
        model.toggleInAppNotification(false);
        expect(model.inAppNotification, false);
      });
      test('When called, checks if notifyOnKeyword field changes value', () {
        final model = NotificationsViewModel();
        model.toggleNotifyOnKeyword(false);
        expect(model.notifyOnKeyword, false);
      });
    });
  });
}
