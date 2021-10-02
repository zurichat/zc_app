import 'package:flutter_test/flutter_test.dart';
import 'package:hng/app/app.router.dart';
import 'package:hng/ui/view/channel/channel_view/channel_page_viewmodel.dart';
import 'package:mockito/mockito.dart';
import '../helpers/test_helpers.dart';

// This is a test setup
void main() {
  group('ChannelPageViewModelTest -', () {
    setUp(() => registerServices());
    tearDown(() => unregisterServices());
    group('navigateToChannelEdit -', () {
      test('When called, it takes the user to the edit channel page.',
          () async {
        final navigationService = getAndRegisterNavigationServiceMock();
        final model = ChannelPageViewModel();
        model.navigateToChannelEdit();
        verify(navigationService.navigateTo(Routes.editChannelPageView));
      });
    });
    group('navigateToAddPeople -', () {
      test('When called, it takes the user to channel add people page.',
          () async {
        final navigationService = getAndRegisterNavigationServiceMock();
        final model = ChannelPageViewModel();
        await model.navigateToAddPeople();
        verify(navigationService.navigateTo(Routes.channelAddPeopleView));
      });
    });

    group('goBack -', () {
      test('When called, it takes the user to the previous page.', () {
        final navigationService = getAndRegisterNavigationServiceMock();
        final model = ChannelPageViewModel();
        model.goBack();
        verify(navigationService.back());
      });
    });
  });
}
