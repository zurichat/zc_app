import 'dart:convert';
import 'dart:math';
import 'package:hng/app/app.locator.dart';
import 'package:hng/models/user_post.dart';
import 'package:hng/services/local_storage_services.dart';
import 'package:hng/ui/view/dm_user/dummy_data/models/message.dart';
import 'package:hng/ui/view/dm_user/dummy_data/models/user.dart';
import 'package:hng/utilities/enums.dart';
import 'package:hng/utilities/storage_keys.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import '../../../app/app.logger.dart';

class DmUserViewModel extends FormViewModel {
  final _username = "";
  String get username => _username;

  final bottomSheet = locator<BottomSheetService>();
  final storage = locator<SharedPreferenceLocalStorage>();
  final log = getLogger("DmUserViewModel");
  List<UserPost>? dmMessages = [];

  final _isOnline = true;
  bool get isOnline => _isOnline;

  final _bio = 'Product designer';
  String get bio => _bio;

  bool _hasClickedMessageField = false;
  bool get hasClickedMessageField => _hasClickedMessageField;

  User receiver = User('OyinkanUA', 'OyinkanUA');
  User sender = User('Jaytek', 'Jaytek');
  bool isSendButtonEnabled = false;

  final _navigationService = locator<NavigationService>();
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

  /// THIS FUNCTION BELOW IS TO SAVE MESSAGES INTO SAVED Items
  /// PLESE LEAVE IT
  saveItem(
      {String? channelID,
      String? channelName,
      String? messageID,
      String? message,
      String? lastSeen,
      String? userID,
      String? userImage,
      String? displayName}) async {
    var savedMessageMap = {
      'channel_id': channelID,
      'channel_name': channelName,
      'message_id': messageID,
      'message': message,
      'last_seen': lastSeen,
      'user_id': userID,
      'user_image': userImage,
      'display_name': displayName
    };
    if (message!.isNotEmpty) {
      var currentList = storage.getStringList(StorageKeys.savedItem) ?? [];
      currentList.add(messageID!);
      await storage.setStringList(StorageKeys.savedItem, currentList);
      await storage.setString(messageID, json.encode(savedMessageMap));
      log.i(savedMessageMap);
      final len = storage.getStringList(StorageKeys.savedItem);
      log.w(len!.length.toString());
    }
  }

  /// IT ENDS HERE FOR SAVED ITEMS

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

      notifyListeners();
    }
  }

  void deleteMessage(Message message) {
    chatMessages.remove(message);
    notifyListeners();
  }

  void popScreen() {
    final navigationService = locator<NavigationService>();
    navigationService.popRepeated(1);
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

        notifyListeners();
      }
    });
  }

  void exit() {
    _navigationService.back();
  }

//Dialog box for schedulling
  final _dialogService = locator<DialogService>();
  showPop() {
    _dialogService.showCustomDialog(
      variant: DialogType.scheduleMessageDm,
    );

    notifyListeners();
  }
}
