import 'dart:convert';
import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:zurichat/app/app.locator.dart';
import 'package:zurichat/models/message.dart';
import 'package:zurichat/models/user.dart';
import 'package:zurichat/services/app_services/local_storage_services.dart';
import 'package:zurichat/utilities/enums.dart';
import 'package:zurichat/utilities/constants/storage_keys.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:zurichat/app/app.logger.dart';

class DmUserViewModel extends FormViewModel {
  final navigationService = locator<NavigationService>();
  final _storageService = locator<SharedPreferenceLocalStorage>();

  //**Draft implementations

  //Note that the receiverID has to be unique to a dm_user_view
  //instance, which is attached to a particular user to make the draft implementation
  // unique to a particular user dm.

  var storedDraft = '';

  void getDraft(receiverId) {
    var currentOrgId = _storageService.getString(StorageKeys.currentOrgId);
    var currentUserId = _storageService.getString(StorageKeys.currentUserId);
    List<String>? spList =
        _storageService.getStringList(StorageKeys.currentUserDmIdDrafts);
    if (spList != null) {
      for (String e in spList) {
        if (jsonDecode(e)['receiverId'] == receiverId &&
            currentOrgId == jsonDecode(e)['currentOrgId'] &&
            currentUserId == jsonDecode(e)['currentUserId']) {
          storedDraft = jsonDecode(e)['draft'];
          spList.remove(e);
          _storageService.setStringList(
              StorageKeys.currentUserDmIdDrafts, spList);
          return;
        }
      }
    }
  }

  void storeDraft(receiverId, value) {
    var currentOrgId = _storageService.getString(StorageKeys.currentOrgId);
    var currentUserId = _storageService.getString(StorageKeys.currentUserId);
    var keyMap = {
      'draft': value,
      'time': '${DateTime.now()}',
      'receiverName': 'receiverName',
      'receiverId': receiverId,
      'currentOrgId': currentOrgId,
      'currentUserId': currentUserId,
    };

    List<String>? spList =
        _storageService.getStringList(StorageKeys.currentUserDmIdDrafts);

    if (value.length > 0 && spList != null) {
      spList.add(json.encode(keyMap));
      _storageService.setStringList(StorageKeys.currentUserDmIdDrafts, spList);
    } else if (value.length > 0 && spList == null) {
      spList = [json.encode(keyMap)];
      _storageService.setStringList(StorageKeys.currentUserDmIdDrafts, spList);
    }
  }
  //**draft implementation ends here

  final _username = '';
  String get username => _username;

  final bottomSheet = locator<BottomSheetService>();
  final storage = locator<SharedPreferenceLocalStorage>();
  final log = getLogger("DmUserViewModel");

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

  final messageController = TextEditingController();

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
      log.wtf(len!.length.toString());
    }
  }

  /// IT ENDS HERE FOR SAVED ITEMS

  void onUnfocusMessageField() {
    _hasClickedMessageField = false;
    notifyListeners();
  }

  Future<void> sendMessage() async {
    // if(messageController.text!=null){
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
    }
  }

  void deleteMessage(Message message) {
    chatMessages.remove(message);
    notifyListeners();
  }

  void popScreens(receiverId, value) {
    navigationService.back();
    storeDraft(receiverId, value);
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

//Dialog box for schedulling
  final _dialogService = locator<DialogService>();
  showPop() {
    _dialogService.showCustomDialog(
      variant: DialogType.scheduleMessageDm,
    );

    notifyListeners();
  }

  void exit() {
    navigationService.back();
  }
}
