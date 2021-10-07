import 'dart:convert';
import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:hng/app/app.locator.dart';
import 'package:hng/models/user_post.dart';
import 'package:hng/services/local_storage_services.dart';
import 'package:hng/ui/view/dm_user/dummy_data/models/message.dart';
import 'package:hng/ui/view/dm_user/dummy_data/models/user.dart';
import 'package:hng/utilities/enums.dart';
import 'package:hng/utilities/storage_keys.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:hng/app/app.logger.dart';



class DmUserViewModel extends FormViewModel {
  final navigationService = locator<NavigationService>();
  final _storageService = locator<SharedPreferenceLocalStorage>();

  //draft implementations

  //Note that the receiverID has to be unique to a dm_user_view
  //instance, attached to a particular user.
  var storedDraft='';
  void getDraft(receiverId){

    List<String>? receiverIds = _storageService.getStringList(StorageKeys.currentUserChannelIdDrafts);
    if(receiverIds != null){
      receiverIds.remove(receiverId);
    }else{_storageService.clearStorage();}

    var draft = _storageService.getString(receiverId);
    if(draft != null){
      storedDraft = json.decode(draft)['draft'];
      _storageService.clearData(receiverId);
    }
  }

  void storeDraft(receiverId, value){

    List<String>? receiverIds = _storageService.getStringList(StorageKeys.currentUserChannelIdDrafts);
    if(receiverIds != null){
      receiverIds.add(receiverId);
    }else{
      receiverIds = [receiverId];
    }

    var _keyMap = {
      'draft': value,
      'time' : '${DateTime.now()}',
      'receiverName' : 'receiverName',
      'receiverId' : receiverId,
    };

    if(value.length > 0){
      _storageService.setStringList(StorageKeys.currentUserDmIdDrafts, [receiverId]);
      _storageService.setString(receiverId, json.encode(_keyMap));
    }
  }
  //draft implementation ends here


  final _username = '';
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
      log.w(len!.length.toString());
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
      // ignore: todo
      //TODO - fix autoclear
      messageController.clear();
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


  void popScreens(receiverId, value) {
    storeDraft(receiverId, value);
    navigationService.back();
  }

  void popScreen() {
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
}
