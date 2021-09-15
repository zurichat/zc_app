import 'dart:math';

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../app/app.locator.dart';
import 'dummy_data/models/message.dart';
import 'dummy_data/models/user.dart';

class DmUserViewModel extends BaseViewModel {
  final _username = 'OyinkanUa';
  String get username => _username;

  TextEditingController messageController = TextEditingController();

  final _isOnline = true;
  bool get isOnline => _isOnline;

  final _bio = 'Product designer';
  String get bio => _bio;

  bool _hasClickedMessageField = false;
  bool get hasClickedMessageField => _hasClickedMessageField;

  User receiver = User('John Doe', 'JohnDoe');
  User sender = User('Jane Doe', 'JaneDoe');

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

  void popScreen() {
    final navigationService = locator<NavigationService>();
    navigationService.back();
  }

  void sendResponse() async {
    await Future.delayed(const Duration(seconds: 2));
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
