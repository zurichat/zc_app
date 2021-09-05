import 'dart:math';

import 'package:flutter/material.dart';
import 'package:hng/app/app.locator.dart';
import 'package:hng/app/app.router.dart';
import 'package:hng/ui/view/dm_user/dummy_data/models/Message.dart';
import 'package:hng/ui/view/dm_user/dummy_data/models/User.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class DmUserViewModel extends BaseViewModel {

  String _username = "OyinkanUa";
  String get username => _username;

  TextEditingController messageController = TextEditingController();

  bool _isOnline = true;
  bool get isOnline => _isOnline;

  String _bio = "Product designer";
  String get bio => _bio;

  bool _hasClickedMessageField = false;
  bool get hasClickedMessageField => _hasClickedMessageField;

  User receiver = User("John Doe", "JohnDoe");
  User sender = User("Jane Doe", "JaneDoe");

  bool isSendButtonEnabled = false;

  List<Message> chatMessages = List.empty(growable: true);


  onTapMessageField() {
    _hasClickedMessageField = true;
    notifyListeners();
  }

  onUnfocusMessageField() {
    _hasClickedMessageField = false;
    notifyListeners();
  }

  void sendMessage() {
    String message = messageController.text;
    if(message.trim().isNotEmpty) {
      chatMessages.add(Message(id: chatMessages.length,
          sender: sender, message: message, time: DateTime.now()));
      messageController.clear();
      notifyListeners();
      sendResponse();
    }
  }

  void popScreen() {
    var navigationService = locator<NavigationService>();
    navigationService.back();
  }

  void sendResponse() async {
    await Future.delayed(Duration(seconds: 2));
    var randomNum = Random().nextInt(Message.responses().length);
    chatMessages.add(Message(id: chatMessages.length,
        sender: receiver, message: Message.responses()[randomNum], time: DateTime.now()));
    notifyListeners();
  }


}