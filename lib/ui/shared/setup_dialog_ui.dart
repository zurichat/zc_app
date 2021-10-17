import 'package:flutter/widgets.dart';
import 'package:zurichat/app/app.locator.dart';
import 'package:zurichat/ui/shared/dialogs/remind_me_dialog/remind_me_dialog.dart';
import 'package:zurichat/ui/shared/dialogs/delete_draft_alert_dialog.dart';
import 'package:zurichat/ui/shared/dialogs/schedule_dialog.dart';
import 'package:zurichat/ui/shared/dialogs/sign_out_dialog.dart';
import 'package:zurichat/utilities/enums.dart';
import 'package:stacked_services/stacked_services.dart';
import 'dialogs/image_source_dialog.dart';
import 'dialogs/schedule_channel_dialog.dart';
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
    DialogType.signOut: (context, request, completer) =>
        SignOutDialog(request: request, completer: completer),
    DialogType.remindMe: (context, request, completer) =>
        ReminderDialog(request: request, completer: completer),
    DialogType.deleteDraft: (BuildContext context, DialogRequest request,
            Function(DialogResponse) completer) =>
        ShowAlertDialog(request: request, completer: completer),
    DialogType.scheduleMessageDm: (context, request, completer) =>
        ScheduleMess(request: request, completer: completer),
    DialogType.scheduleMessageChannel: (context, request, completer) =>
        ScheduleMessChannel(
          request: request,
          completer: completer,
        ),
    DialogType.imageSource: (context, request, completer) =>
        ImageSourceDialog(request: request, completer: completer),
  };

  dialogService.registerCustomDialogBuilders(builders);
}
