import 'dart:math';
import 'package:hng/app/app.locator.dart';
import 'package:hng/ui/view/dm_user/dummy_data/models/message.dart';
import 'package:hng/ui/view/dm_user/dummy_data/models/user.dart';
import 'package:hng/utilities/enums.dart';
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
    await bottomSheet.showCustomSheet(
        variant: BottomSheetType.floatingBox,
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

  Future<void> sendMessage(String text) async {
    if (text.trim().isNotEmpty) {
      chatMessages.add(
        Message(
          id: chatMessages.length,
          sender: sender,
          message: text,
          time: DateTime.now(),
        ),
      );
      // ignore: todo
      //TODO - fix autoclear

      //clearText();
      notifyListeners();
    }
    //await sendResponse();
    //}
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

//TODO implement setFormStatus
  @override
  void setFormStatus() {}

//Set delay for messages
  scheduleMessage(double delay, String text) {
    delay = delay * 60; //Converting from hour to minutes

    int value = delay.toInt();
    Future.delayed(Duration(minutes: value), () {
      if (text.trim().isNotEmpty) {
        chatMessages.add(
          Message(
            id: chatMessages.length,
            sender: sender,
            message: text,
            time: DateTime.now(),
          ),
        );
        // ignore: todo
        //TODO - fix autoclear

        //clearText();
        notifyListeners();
      }
    });
  }
}
