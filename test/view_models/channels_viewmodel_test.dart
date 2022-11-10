import 'package:flutter_test/flutter_test.dart';
import 'package:zurichat/models/channel_members.dart';
import 'package:zurichat/models/channel_model.dart';
import 'package:zurichat/ui/view/channel/channel_list/channels_viewmodel.dart';

import '../helpers/test_helpers.dart';

// This is a test setup
void main() {
  group('ChannelListViewModelTest -', () {
    setUp(() => registerServices());
    tearDown(() => unregisterServices());
    group('channelsList -', () {
      test('Check ChannelModel List is empty', () {
        final model = ChannelListViewModel();
        model.channelsList;
        expect(model.channelsList, <ChannelModel>[]);
      });
    });

    group('membersList -', () {
      test('Check ChannelMembermodel List is empty', () {
        final model = ChannelListViewModel();
        model.membersList;
        expect(model.membersList, <ChannelMember>[]);
      });
    });
  });
}
