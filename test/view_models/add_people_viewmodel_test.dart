import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:zurichat/ui/view/add_people/add_people_viewmodel.dart';

import '../helpers/test_helpers.dart';

void main() {
  group('AddPeopleViewModelTest -', () {
    setUp(() => registerServices());
    tearDown(() => unregisterServices());
    group('goBack -', () {
      test('When called, it takes the user to the previous page', () {
        final navigationService = getAndRegisterNavigationServiceMock();
        final model = AddPeopleViewModel();
        model.goBack();
        verify(navigationService.back());
      });
    });
  });
}
