import 'package:flutter_test/flutter_test.dart';
import 'package:zurichat/ui/view/jump_to_view/jump_to_viewmodel.dart';

import '../helpers/test_helpers.dart';

//TODO test properly
void main() {
  group('JumpToViewModelTest -', () {
    setUp(() => registerServices());
    tearDown(() => unregisterServices());
    group('initialise -', () {
      test('users list initializes with empty', () async {});

      test('channels list initializes with empty', () async {});
    });

    group('api calls -', () {
      test('When called, check if users list is not empty', () async {
        final model = JumpToViewModel();
     
        //TODO write test properly
        await model.fetchUsers();
        expect(model.userSearch.isNotEmpty, true);
      });

      test('When called, check if channels list is not empty', () async {
        final model = JumpToViewModel();

     
        //TODO write test properly
        await model.fetchChannels();
        expect(model.allChannelsSearch.isNotEmpty, true);
      });
    });
  });
}
