import 'package:flutter_test/flutter_test.dart';
import 'package:hng/ui/view/channel/channel_members/channel_members_list_model.dart';
import 'package:mockito/mockito.dart';
import '../helpers/test_helpers.dart';

void main() {
  group('Channel Members', () {
    setUp(() => registerServices());
    tearDown(() => unregisterServices());
    group('Navigation for Channel Members', () {
      test(
          'When called, it verifies if the current route is popped back to the previous screen',
          () async {
        var navigationService = getAndRegisterNavigationServiceMock();
        var model = ChannelMembersModel();
        model.goBack();
        verify(navigationService.back());
      });
    });
  });
}
