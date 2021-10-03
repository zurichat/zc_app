import 'package:flutter_test/flutter_test.dart';
import 'package:hng/ui/view/dm_chat_view/dm_jump_to_viewmodel.dart';
import '../helpers/test_helpers.dart';

void main() {
  group('dmJumpToViewModelTest -', () {
    setUp(() => registerServices());
    tearDown(() => unregisterServices());
    group('initialise -', () {
      test('users list initializes with empty', () async {
        final model = DmJumpToViewModel();
        expect(model.userSearch.isEmpty, true);
      });

      test('channels list initializes with empty', () async {
        final model = DmJumpToViewModel();
        expect(model.allChannelsSearch.isEmpty, true);
      });
    });

    group('api calls -', () {
      test('When called, check if users list is not empty', () async {
        final model = DmJumpToViewModel();
        var list = await model.fetchUsers();
        expect(list?.isNotEmpty, true);
      });

      test('When called, check if channels list is not empty', () async {
        final model = DmJumpToViewModel();
        var list = await model.fetchChannels();
        expect(list!.isNotEmpty, true);
      });
    });
  });
}
