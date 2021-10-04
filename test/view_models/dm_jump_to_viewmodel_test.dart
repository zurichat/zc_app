import 'package:flutter_test/flutter_test.dart';
import 'package:hng/ui/view/dm_chat_view/dm_jump_to_viewmodel.dart';
import '../helpers/test_helpers.dart';

//TODO test properly
void main() {
  group('dmJumpToViewModelTest -', () {
    setUp(() => registerServices());
    tearDown(() => unregisterServices());
    group('initialise -', () {
      test('users list initializes with empty', () async {});

      test('channels list initializes with empty', () async {});
    });

    group('api calls -', () {
      test('When called, check if users list is not empty', () async {
        final model = DmJumpToViewModel();
        // ignore: unused_local_variable
        var list = await model.fetchUsers();
        //TODO write test properly
      });

      test('When called, check if channels list is not empty', () async {
        final model = DmJumpToViewModel();

        // ignore: unused_local_variable
        var list = await model.fetchChannels();
        //TODO write test properly
      });
    });
  });
}
