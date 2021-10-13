import 'package:flutter_test/flutter_test.dart';
import 'package:hng/ui/view/dm_user/dm_user_viewmodel.dart';
import 'package:mockito/mockito.dart';
import '../helpers/test_helpers.dart';

void main() {
  group('dmUserViewModelTest -', () {
    setUp(() => registerServices());
    tearDown(() => unregisterServices());

    group('initialise -', () {
      test('hasClickedMessageField initializes with false', () async {
        final model = DmUserViewModel();
        expect(model.hasClickedMessageField, false);
      });
      test('hasClickedMessageField is true', () async {
        final model = DmUserViewModel();
        model.onTapMessageField();
        expect(model.hasClickedMessageField, true);
      });
    });

    group('navigation -', () {
      test(
          'When called, verify that the current screen is popped from the stack',
          () {
        var model = DmUserViewModel();
        var service = getAndRegisterNavigationServiceMock();
        model.popScreen();
        verify(service.popRepeated(1));
      });
    });
  });
}
