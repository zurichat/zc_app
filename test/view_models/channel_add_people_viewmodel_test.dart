import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:zurichat/models/user_search_model.dart';
import 'package:zurichat/ui/view/channel/add_people/channel_add_people_viewmodel.dart';
import 'package:zurichat/utilities/constants/storage_keys.dart';

import '../helpers/test_helpers.dart';

ChannelAddPeopleViewModel _getModel() => ChannelAddPeopleViewModel();

void main() {
  group('ChannelAddPeopleViewmodelTest -', () {
    setUp(() => registerServices());
    tearDown(() => unregisterServices());

    group('allMarked -', () {
      test('When constructed, allMarked should be false', () {
        var model = _getModel();
        expect(model.allMarked, false);
      });
      test(
          'When onMarkAll is true and matchingUsers is not empty, should be true',
          () {
        var model = _getModel();
        UserSearch search = UserSearch(id: 'id');
        model.matchingUsers.add(search);
        model.onMarkAll(true);
        expect(model.allMarked, true);
      });
      test('When called and marked is false, markedUsers should empty', () {
        var model = _getModel();
        model.onMarkAll(false);
        expect(model.markedUsers, []);
      });
    });

    group('token -', () {
      test('When constructed should check the token in shared preferences', () {
        final storageService =
            getAndRegisterSharedPreferencesLocalStorageMock();
        var model = _getModel();
        model.token;
        verify(storageService.getString(StorageKeys.currentSessionToken));
      });
    });

    group('navigateBack -', () {
      test('When called pops the back stack the one time', () {
        final navigationService = getAndRegisterNavigationServiceMock();
        var model = _getModel();
        model.navigateBack();
        verify(navigationService.popRepeated(1));
      });
    });

    group('onSearchUser -', () {
      test(
          'When onSearchUser is called and an input is set, should return a list of users with usernames containing that input',
          () {
        var model = _getModel();
        model.users.add(UserSearch(userName: 'zurimain'));
        model.users.add(UserSearch(userName: 'zuricore'));
        model.users.add(UserSearch(userName: 'hng'));
        var searchWord = 'zuri';
        model.onSearchUser(searchWord);
        expect(
            model.matchingUsers
                .every((user) => user.userName!.contains(searchWord)),
            true);
      });
    });

    group('onMarkOne -', () {
      test('When called and marked is true, add user to marked users list', () {
        var model = _getModel();
        var markedUsers = model.markedUsers;
        UserSearch search = UserSearch(id: 'id');
        model.matchingUsers.add(search);
        model.markOne(true, 0);
        expect(markedUsers.length, 1);
      });
      test(
          'When called and marked is false, remove user from marked users list',
          () {
        var model = _getModel();
        var markedUsers = model.markedUsers;
        UserSearch search = UserSearch(id: 'id');
        model.matchingUsers.add(search);
        model.markOne(false, 0);
        expect(markedUsers.length, 0);
      });
    });

    group('onMarkAll -', () {
      test('When called and marked is false, no user is marked', () {
        var model = _getModel();
        var markedUsers = model.markedUsers;
        model.onMarkAll(false);
        expect(markedUsers, []);
      });
      test('When called marked is true, all available users are marked', () {
        var model = _getModel();
        UserSearch search = UserSearch(id: 'id');
        model.matchingUsers.add(search);
        model.matchingUsers.add(search);
        model.matchingUsers.add(search);
        model.onMarkAll(true);
        expect(model.allMarked, true);
      });
    });
  });
}
