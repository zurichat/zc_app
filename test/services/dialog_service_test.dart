import 'package:flutter_test/flutter_test.dart';
import 'package:zurichat/ui/view/channel/channel_info/channel_info_view_model.dart';
import 'package:zurichat/utilities/enums.dart';
import 'package:mockito/mockito.dart';
import '../helpers/test_helpers.dart';

void main() {
  group('DialogServiceTest -', () {
    setUp(() => registerServices());
    tearDown(() => unregisterServices());
    group('Show dialog', () {
      test('When called, it verifies if a customDialog is shown on the screen',
          () async {
        var service = getAndRegisterDialogServiceMock();
        var model = ChannelInfoViewModel();
        await model.showDialog();
        verify(service.showCustomDialog(
          variant: DialogType.deleteChannel,
        ));
      });
    });
  });
}
