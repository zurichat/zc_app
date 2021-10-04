import 'package:flutter/widgets.dart';
import 'package:hng/app/app.locator.dart';
import 'package:hng/services/local_storage_services.dart';
import 'package:hng/utilities/storage_keys.dart';
import 'package:hng/constants/app_strings.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'drafts.dart';


class DraftViewModel extends BaseViewModel {

  final _navigationService = locator<NavigationService>();

  final _storageService = locator<SharedPreferenceLocalStorage>();

  List <Widget> widgets = [];

  void get drafts{
    var dmStoredKeys = _storageService.getStringList(StorageKeys.currentUserDmDrafts);

    var channelStoredKeys = _storageService.getStringList(StorageKeys.currentUserChannelDrafts);

    var threadStoredKeys = _storageService.getStringList(StorageKeys.currentUserThreadDrafts);

    if(dmStoredKeys != null ){
      dmStoredKeys.forEach((element) {
        if(_storageService.getString(element) != null ){
          widgets.add(CustomListTile(
              text: 'element.receiverID.name //Todo ',
              subtitle: '${_storageService.getString(element)}'));
        }
      });
    }

    if(channelStoredKeys != null){
      channelStoredKeys.forEach((element) {
        if(_storageService.getString(element) != null ){
          widgets.add(CustomListTile(
              text: 'element.channelID.name //Todo ',
              subtitle: '${_storageService.getString(element)}'));
        }
      });
    }

    if(threadStoredKeys != null ){
      threadStoredKeys.forEach((element) {
        if(_storageService.getString(element) != null ){
          widgets.add(CustomListTile(
              text: 'element.userPost.ID.name //Todo ',
              subtitle: '${_storageService.getString(element)}'));
        }
      });
    }
  }

  void goBack(){
    _navigationService.back();
  }


  final _title = Draft;

  String get title => _title;


}
