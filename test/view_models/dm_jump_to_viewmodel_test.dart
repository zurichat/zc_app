import 'package:flutter_test/flutter_test.dart';
import 'package:zurichat/ui/view/dm_jump_to_view/dm_jump_to_viewmodel.dart';
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
        await model.fetchUsers();
        expect(model.userSearch.isNotEmpty, true);
      });

      test('When called, check if channels list is not empty', () async {
        final model = DmJumpToViewModel();
        await model.fetchChannels();
        expect(model.allChannelsSearch.isNotEmpty, true);
      });
    });
  });
}
