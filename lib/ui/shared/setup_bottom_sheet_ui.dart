import 'package:hng/ui/shared/bottom_sheets/emoji_picker_bottomsheet/emoji_picker_bottomsheet_view.dart';
import 'package:hng/ui/shared/bottom_sheets/sign_out_bottomsheet/sign_out_bottom_sheet_view.dart';
import 'package:hng/ui/shared/bottom_sheets/thread_options_bottomsheet/thread_options_bottomsheet_view.dart';

import '../../app/app.locator.dart';
import '../../utilities/enums.dart';
import 'package:stacked_services/stacked_services.dart';

import 'bottom_sheets/custom_user_bottomsheet/custom_user_bottom_sheet_view.dart';

void setupBottomSheetUi() {
  final bottomSheetService = locator<BottomSheetService>();

  final builders = {
    BottomSheetType.user: (context, sheetRequest, completer) =>
        CustomUserBottomSheetView(request: sheetRequest, completer: completer),
    BottomSheetType.emojiPicker: (context, sheetRequest, completer) =>
        EmojiPickerBottomSheetView(request: sheetRequest, completer: completer),
    BottomSheetType.threadOptions: (context, sheetRequest, completer) =>
        ThreadOptionsBottomSheetView(
            request: sheetRequest, completer: completer),
    BottomSheetType.signOut: (context, sheetRequest, completer) =>
        SignOutBottomSheet(request: sheetRequest, completer: completer)
  };

  bottomSheetService.setCustomSheetBuilders(builders);
}
