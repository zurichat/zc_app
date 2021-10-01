import 'package:flutter_test/flutter_test.dart';
import 'package:hng/ui/view/dm_chat_view/dm_jump_to_viewmodel.dart';
import 'package:mockito/mockito.dart';
import '../helpers/test_helpers.dart';

// This is a test setup
void main() {
  group('dmJumpToViewModelTest -', () {
    setUp(() => registerServices());
    tearDown(() => unregisterServices());
    group('initialise -', () {
      test('When called, check if userList is not empty', () async {
        final model = DmJumpToViewModel();
        await model.fetchUsers();
        verify(model.userSearch.isEmpty);
      });
      test('When called, check if channelsList is not empty', () async {
        final model = DmJumpToViewModel();
        await model.fetchChannels();
        verify(model.allChannelsSearch.isNotEmpty);
      });
    });
  });
}
