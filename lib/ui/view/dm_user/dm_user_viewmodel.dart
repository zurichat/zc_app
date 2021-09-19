import 'dart:math';
import 'package:flutter/material.dart';
import 'package:hng/ui/view/dm_user/widgets/setupBottomSheetUi.dart';
// import 'package:hng/utilities/enums.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../app/app.locator.dart';
import 'dummy_data/models/message.dart';
import 'dummy_data/models/user.dart';

enum BottomSheetType {
  FloatingBox,
}

class DmUserViewModel extends BaseViewModel {
  final _username = '';
  String get username => _username;

  TextEditingController messageController = TextEditingController();

  final _isOnline = true;
  bool get isOnline => _isOnline;

  final _bio = 'Product designer';
  String get bio => _bio;

  bool _hasClickedMessageField = false;
  bool get hasClickedMessageField => _hasClickedMessageField;

  User receiver = User('OyinkanUA', 'OyinkanUA');
  User sender = User('Jaytek', 'Jaytek');
  bool isSendButtonEnabled = false;

  List<Message> chatMessages = List.empty(growable: true);

  void onTapMessageField() {
    _hasClickedMessageField = true;
    notifyListeners();
  }

  void onUnfocusMessageField() {
    _hasClickedMessageField = false;
    notifyListeners();
  }

  void sendMessage() {
    final message = messageController.text;
    if (message.trim().isNotEmpty) {
      chatMessages.add(
        Message(
          id: chatMessages.length,
          sender: sender,
          message: message,
          time: DateTime.now(),
        ),
      );
      messageController.clear();
      notifyListeners();
      sendResponse();
    }
  }

  void setupBottomSheetUi() {
    final bottomSheetService = locator<BottomSheetService>();

    final builders = {
      BottomSheetType.FloatingBox: (context, sheetRequest, completer) =>
          FloatingBoxBottomSheet(request: sheetRequest, completer: completer)
    };

    bottomSheetService.setCustomSheetBuilders(builders);
  }

  void popScreen() {
    final navigationService = locator<NavigationService>();
    navigationService.back();
  }

  void sendResponse() async {
    await Future.delayed(const Duration(seconds: 0));
    final randomNum = Random().nextInt(Message.responses().length);
    chatMessages.add(
      Message(
        id: chatMessages.length,
        sender: receiver,
        message: Message.responses()[randomNum],
        time: DateTime.now(),
      ),
    );
    notifyListeners();
  }
}
