import 'package:hng/app/app.locator.dart';
import 'package:hng/utilities/enums.dart';
import 'package:stacked_services/stacked_services.dart';

import 'bottom_sheets/custom_user_bottomsheet/custom_user_bottom_sheet_view.dart';
import 'bottom_sheets/edit_message_bottom_sheet/setupBottomSheetUi.dart';
import 'bottom_sheets/emoji_picker_bottomsheet/emoji_picker_bottomsheet_view.dart';
import 'bottom_sheets/thread_options_bottomsheet/thread_options_bottomsheet_view.dart';

void setupBottomSheetUi() {
  final bottomSheetService = locator<BottomSheetService>();

  final builders = {
    BottomSheetType.user: (context, sheetRequest, completer) =>
        CustomUserBottomSheetView(request: sheetRequest, completer: completer),
    BottomSheetType.emojiPicker: (context, sheetRequest, completer) =>
        EmojiPickerBottomSheetView(request: sheetRequest, completer: completer),
    BottomSheetType.FloatingBox: (context, sheetRequest, completer) =>
        FloatingBoxBottomSheet(request: sheetRequest, completer: completer),
    BottomSheetType.threadOptions: (context, sheetRequest, completer) =>
        ThreadOptionsBottomSheetView(
            request: sheetRequest, completer: completer)
  };

  bottomSheetService.setCustomSheetBuilders(builders);
}
