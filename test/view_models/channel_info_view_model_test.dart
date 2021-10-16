import 'package:flutter_test/flutter_test.dart';
import 'package:zurichat/app/app.router.dart';
import 'package:zurichat/ui/view/channel/channel_info/channel_info_view_model.dart';
import 'package:mockito/mockito.dart';
import '../helpers/test_helpers.dart';

// This is a test setup
void main() {
  group('ChannelInfoViewModel -', () {
    setUp(() => registerServices());
    tearDown(() => unregisterServices());
    group('Channel Info -', () {
      test(
          'When setChannelDescription is called and the channel description is set, should be true.',
          () async {
        final model = ChannelInfoViewModel();
        model.setChannelDescription('Add a description');
        expect(model.channelDescription, 'Add a description');
        //verify(setChannelName was called);
      });

      test(
          'When setChannelName is called and the channel name is set, should be true.',
          () async {
        final model = ChannelInfoViewModel();
        expect(model.channelName, 'team-zuri-app');
        //verify(setChannelName was called.);
      });

      test('When called, it takes the user to the edit channel page.', () {
        final navigationService = getAndRegisterNavigationServiceMock();

        final model = ChannelInfoViewModel();
        model.navigateToEditChannel();

        verify(navigationService.navigateTo(Routes.editChannelPageView));
      });
    });
  });
}
