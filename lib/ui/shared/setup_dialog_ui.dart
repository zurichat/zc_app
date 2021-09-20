import 'package:flutter/widgets.dart';
import 'package:hng/app/app.locator.dart';
import 'package:hng/ui/shared/dialogs/delete_message.dart';
import 'package:hng/utilities/enums.dart';
import 'package:stacked_services/stacked_services.dart';
import 'dialogs/select_language_dialog.dart';
import 'dialogs/skin_tone_dialog.dart';
import 'dialogs/select_theme_dialog.dart';
import 'dialogs/send_feedback_dialog.dart';

void setupDialogUi() {
  final dialogService = locator<DialogService>();

  final builders = {
    DialogType.skinTone: (BuildContext context, DialogRequest request,
            Function(DialogResponse) completer) =>
        SkinToneDialog(request: request, completer: completer),
    DialogType.selectLanguage: (BuildContext context, DialogRequest request,
            Function(DialogResponse) completer) =>
        SelectLanguageDialog(request: request, completer: completer),
    DialogType.feedback: (BuildContext context, DialogRequest request,
            Function(DialogResponse) completer) =>
        SendFeedbackDialog(request: request, completer: completer),
    DialogType.themeMode: (BuildContext context, DialogRequest request,
            Function(DialogResponse) completer) =>
        SelectThemeDialog(request: request, completer: completer),
        DialogType.deleteMessage: (BuildContext context, DialogRequest request,
            Function(DialogResponse) completer) =>
        DeleteMessageDialog(request: request, completer: completer),
  };

  dialogService.registerCustomDialogBuilders(builders);
}
