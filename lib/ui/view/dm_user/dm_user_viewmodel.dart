import 'dart:math';

import 'package:flutter/material.dart';
import 'package:hng/ui/shared/colors.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../app/app.locator.dart';
import 'dummy_data/models/message.dart';
import 'dummy_data/models/user.dart';

class DmUserViewModel extends BaseViewModel {
  final _username = 'OyinkanUa';
  String get username => _username;

  TextEditingController messageController = TextEditingController();

  Message? message;
   

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

  Future<dynamic> showButtomSheet(BuildContext context) {
    return showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                ListTile(
                  leading: new Icon(
                    Icons.delete_rounded,
                    color: Colors.red,
                  ),
                  title: new Text(
                    'Delete Message',
                    style: TextStyle(color: Colors.red),
                  ),
                  onTap: () {
                    showDeleteDialog(context);
                  },
                ),
              ],
            ),
          );
        });
  }
  

  void deleteMessage(Message message) {
    chatMessages.remove(message);
    notifyListeners();
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

  Future<Null> showDeleteDialog(BuildContext context) {
    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return SimpleDialog(
            semanticLabel: 'Delete message',
            contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            children: <Widget>[
              Text(
                "Delete message",
                style: GoogleFonts.roboto(
                  color: Color(0xff000000).withOpacity(0.87),
                  fontSize: 20.0,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text.rich(
                TextSpan(
                  text:
                      "Are you sure you want to delete this message?\nThis cannot be undone.",
                ),
                style: GoogleFonts.roboto(
                  color: Color(0xff000000).withOpacity(0.87),
                  fontSize: 20.0,
                  fontWeight: FontWeight.w700,
                ),
                textAlign: TextAlign.start,
              ),
              SizedBox(
                height: 10,
              ),
              new Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  TextButton(
                    child: Text(
                      'Cancel',
                      style: GoogleFonts.roboto(
                        color: AppColors.zuriPrimaryColor,
                        fontSize: 16.0,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  TextButton(
                    child: Text(
                      'Delete',
                      style: GoogleFonts.roboto(
                        color: AppColors.zuriPrimaryColor,
                        fontSize: 16.0,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    onPressed: () {
                      deleteMessage(message!);
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
            ],
          );
        });
  }
}
