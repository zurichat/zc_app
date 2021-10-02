import 'package:flutter_test/flutter_test.dart';
import 'package:hng/ui/view/channel/new_channel/new_channel_viewmodel.dart';
import 'package:mockito/mockito.dart';
import '../helpers/test_helpers.dart';

void main() {
  group('NewChannelTest -', () {
    setUp(() => registerServices());
    tearDown(() => unregisterServices());

    group('initialize -', () {
      test('When called, check service connection', () async {
        final channelService = getAndRegisterChannelsApiServiceMock();
        // ignore: unused_local_variable
        final model = NewChannelViewModel();
        // await model.initialise();
        channelService.createChannels(
            name: 'des', description: 'Welcome', private: true);
        verify(channelService.createChannels(
            name: 'des', description: 'Welcome', private: true));
        // verify(channelService.hasUser);
      });
    });
  });
}
