import 'package:flutter/widgets.dart';
import 'package:hng/app/app.locator.dart';
import 'package:hng/app/app.router.dart';
import 'package:hng/services/connectivity_service.dart';
import 'package:hng/services/local_storage_services.dart';
import 'package:hng/utilities/enums.dart';
import 'package:hng/utilities/storage_keys.dart';
import 'package:hng/constants/app_strings.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'drafts.dart';
import 'package:hng/app/app.logger.dart';



class DraftViewModel extends BaseViewModel {

  final _navigationService = locator<NavigationService>();
  final connectivityService = locator<ConnectivityService>();
  final _storageService = locator<SharedPreferenceLocalStorage>();
  final snackBar = locator<SnackbarService>();
  final log = getLogger("Draft Page View Model");



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



  navigateToChannelPage(String? channelName, String? channelId,
      int? membersCount, bool? public) async {
    try {
      if (!await connectivityService.checkConnection()) {
        snackBar.showCustomSnackBar(
          duration: const Duration(seconds: 3),
          variant: SnackbarType.failure,
          message: noInternet,
        );

        return;
      }
      setBusy(true);
      // _channel= await api.getChannelPage(id);
      // _membersList= await api.getChannelMembers(id);
      setBusy(false);

      _navigationService.navigateTo(Routes.channelPageView,
          arguments: ChannelPageViewArguments(
            channelName: channelName,
            channelId: channelId,
            membersCount: membersCount,
            public: public,
          ));
    } catch (e) {
      log.e(e.toString());
      snackBar.showCustomSnackBar(
        duration: const Duration(seconds: 3),
        variant: SnackbarType.failure,
        message: errorOccurred,
      );
    }
  }

  // final _title = Draft;
  //
  // String get title => _title;


}
