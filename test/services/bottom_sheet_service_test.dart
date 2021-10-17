import 'package:flutter_test/flutter_test.dart';
import 'package:zurichat/ui/shared/smart_widgets/thread_card/thread_card_viewmodel.dart';
import 'package:zurichat/utilities/enums.dart';
import 'package:mockito/mockito.dart';
import '../helpers/test_helpers.dart';

void main() {
  group('BottomSheetServiceTest -', () {
    setUp(() => registerServices());
    tearDown(() => unregisterServices());
    group('Show bottom sheet', () {
      test('When called, a customBottomSheet is shown', () async {
        var service = getAndRegisterBottomSheetServiceMock();
        var model = ThreadCardViewModel();
        await model.viewProfile();
        verify(service.showCustomSheet(
          variant: BottomSheetType.user,
          isScrollControlled: true,
        ));
      });
    });
  });
}
