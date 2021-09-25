import 'dart:math';

import '../../../app/app.locator.dart';
import 'dm_user_view.form.dart';
import 'dummy_data/models/message.dart';
import 'dummy_data/models/user.dart';
import '../../../utilities/enums.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class DmUserViewModel extends FormViewModel {
  final _username = '';
  String get username => _username;

  final bottomSheet = locator<BottomSheetService>();

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

  showButtonSheet(Message message) async {
    print('Our resp ${message.message}');
    await bottomSheet.showCustomSheet(
        variant: BottomSheetType.FloatingBox,
        data: message,
        takesInput: true,
        title: message.message);
    notifyListeners();
  }

  void onTapMessageField() {
    _hasClickedMessageField = true;
    notifyListeners();
  }

  void onUnfocusMessageField() {
    _hasClickedMessageField = false;
    notifyListeners();
  }

  void sendMessage() {
    final message = messageValue;
    if (message!.trim().isNotEmpty) {
      chatMessages.add(
        Message(
          id: chatMessages.length,
          sender: sender,
          message: message,
          time: DateTime.now(),
        ),
      );
      //TODO - fix autoclear
      // clearText();
      notifyListeners();
      sendResponse();
    }
  }

  void deleteMessage(Message message) {
    print(message.message);
    chatMessages.remove(message);
    notifyListeners();
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

  @override
  void setFormStatus() {}
}
