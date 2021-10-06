import 'dart:convert';
import 'package:hng/app/app.locator.dart';
import 'package:hng/app/app.router.dart';
import 'package:hng/models/user_post.dart';
import 'package:hng/services/connectivity_service.dart';
import 'package:hng/services/local_storage_services.dart';
import 'package:hng/ui/view/draft/app/data_holder_class.dart';
import 'package:hng/utilities/enums.dart';
import 'package:hng/utilities/storage_keys.dart';
import 'package:hng/constants/app_strings.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:hng/app/app.logger.dart';

class DraftViewModel extends BaseViewModel {

  final _navigationService = locator<NavigationService>();
  final connectivityService = locator<ConnectivityService>();
  final _storageService = locator<SharedPreferenceLocalStorage>();
  final snackBar = locator<SnackbarService>();
  final log = getLogger("Draft Page View Model");
  List <Objects> widgetBuilderList = [];

  void get drafts{
    var dmStoredKeys = _storageService.getStringList(StorageKeys.currentUserDmIdDrafts);
    var channelStoredKeys = _storageService.getStringList(StorageKeys.currentUserChannelIdDrafts);
    var threadStoredKeys = _storageService.getStringList(StorageKeys.currentUserThreadIdDrafts);

    if(dmStoredKeys != null ){
      dmStoredKeys.forEach((element) {
        if(_storageService.getString(element) != null ){
          var mapKeyJson = _storageService.getString(element);
          if(mapKeyJson != null){
            var mapKey = jsonDecode(mapKeyJson);
            widgetBuilderList.add(Objects(
              '${mapKey['receiverName']}',
              '${mapKey['draft']}',
              mapKey,
              '${mapKey['time']}',
            ));
          }
        }
      });
    }

    if(channelStoredKeys != null){
      channelStoredKeys.forEach((element) {
        if(_storageService.getString(element) != null ){
          var mapKeyJson = _storageService.getString(element);
          if(mapKeyJson != null){
            var mapKey = jsonDecode(mapKeyJson);

            widgetBuilderList.add(Objects(
              '${mapKey['channelName']}',
              '${mapKey['draft']}',
              mapKey,
              '${mapKey['time']}',
            ));
          }
        }
      });
    }

    if(threadStoredKeys != null ){
      threadStoredKeys.forEach((element) {
        if(_storageService.getString(element) != null ){
          var mapKeyJson = _storageService.getString(element);
          if(mapKeyJson != null){
            var mapKey = jsonDecode(mapKeyJson);

            widgetBuilderList.add(Objects(
              '${mapKey['userPost']}',
              '${mapKey['draft']}',
              mapKey,
              '${mapKey['time']}',
            ));
          }
        }
      });
    }
  }

  void goBack(){
    _navigationService.back();
  }

 void rebuild(){
   notifyListeners();
 }

  //navigation for dmUserView
  navigateToDmUserView() async{
     await _navigationService.navigateTo(Routes.dmUserView);
  }


  //navigation for threads
  navigateToThread(UserPost? userPost) async {
    await _navigationService.navigateTo(Routes.threadDetailView,
        arguments: ThreadDetailViewArguments(userPost: userPost));
  }


  //navigation for channel
  navigateToChannelPage(String? channelName, String? channelId,
      int? membersCount, bool? public) async {

    List<String>? channelIds = _storageService.getStringList(StorageKeys.currentUserChannelIdDrafts);
    if(channelIds != null){
      channelIds.remove(channelId!);
    }

    try {
      if (!await connectivityService.checkConnection()) {
        snackBar.showCustomSnackBar(
          duration: const Duration(seconds: 3),
          variant: SnackbarType.failure,
          message: noInternet,
        );
        return;
      }
      await _navigationService.navigateTo(Routes.channelPageView,
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

}

// class Objects {
//   Objects(
//       this.text,
//       this.subtitle,
//       this.route,
//       this.time
//       );
//
//   String text;
//   String subtitle;
//   Map route;
//   String time;
// }