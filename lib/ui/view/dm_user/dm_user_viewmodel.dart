import 'dart:convert';
import 'dart:math';
import 'package:hng/app/app.locator.dart';
import 'package:hng/services/local_storage_services.dart';
import 'package:hng/ui/view/dm_user/dummy_data/models/message.dart';
import 'package:hng/ui/view/dm_user/dummy_data/models/user.dart';
import 'package:hng/utilities/enums.dart';
import 'package:hng/utilities/storage_keys.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'dm_user_view.form.dart';


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

  Future <void> sendMessage(messageController) async{
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
    // ignore: todo
    //TODO - fix autoclear
    messageController.disposeForm();
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
    navigationService.popRepeated(1);

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

  @override
  void setFormStatus() {}
}
