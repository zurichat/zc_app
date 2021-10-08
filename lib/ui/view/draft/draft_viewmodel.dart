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
  List<Objects> widgetBuilderList = [];

  void get drafts {
    var dmStoredDrafts =
        _storageService.getStringList(StorageKeys.currentUserDmIdDrafts);
    var channelStoredDrafts =
        _storageService.getStringList(StorageKeys.currentUserChannelIdDrafts);
    var threadStoredDrafts =
        _storageService.getStringList(StorageKeys.currentUserThreadIdDrafts);

    if (dmStoredDrafts != null) {
      dmStoredDrafts.forEach((element) {
        var mapKey = jsonDecode(element);

        widgetBuilderList.add(Objects(
          '${mapKey['receiverName']}',
          '${mapKey['draft']}',
          mapKey,
          '${mapKey['time']}',
        ));
      });
    }

    if (channelStoredDrafts != null) {
      channelStoredDrafts.forEach((element) {
        var mapKey = jsonDecode(element);

        widgetBuilderList.add(Objects(
          '${mapKey['channelName']}',
          '${mapKey['draft']}',
          mapKey,
          '${mapKey['time']}',
        ));
      });
    }

    if (threadStoredDrafts != null) {
      threadStoredDrafts.forEach((element) {
        var mapKey = jsonDecode(element);

        widgetBuilderList.add(Objects(
          '${mapKey['userPost']}',
          '${mapKey['draft']}',
          mapKey,
          '${mapKey['time']}',
        ));
      });
    }
  }

  void goBack() {
    _navigationService.back();
  }

  void rebuild() {
    notifyListeners();
  }

  void onDismissed(index){
    var removeDmDraft = '';
    var removeChannelDraft = '';
    var removeThreadDraft = '';


    var dmStoredDrafts =
    _storageService.getStringList(StorageKeys.currentUserDmIdDrafts);
    var channelStoredDrafts =
    _storageService.getStringList(StorageKeys.currentUserChannelIdDrafts);
    var threadStoredDrafts =
    _storageService.getStringList(StorageKeys.currentUserThreadIdDrafts);

    if(dmStoredDrafts != null){
      dmStoredDrafts.forEach((element) {
        if(jsonDecode(element)['time'] == widgetBuilderList[index].time ){
          removeDmDraft = element;
        }
      });
    }

    if(channelStoredDrafts != null){
      channelStoredDrafts.forEach((element) {
        if(jsonDecode(element)['time'] == widgetBuilderList[index].time ){
          removeChannelDraft = element ;
        }
      });
    }

    if( threadStoredDrafts != null){
      threadStoredDrafts.forEach((element) {
        if(jsonDecode(element)['time'] == widgetBuilderList[index].time ){
          removeThreadDraft = element ;
        }
      });
    }

    if(removeDmDraft.isNotEmpty && dmStoredDrafts != null ){
      dmStoredDrafts.remove(removeDmDraft);
      _storageService.setStringList(StorageKeys.currentUserDmIdDrafts, dmStoredDrafts);
    }else if(removeChannelDraft.isNotEmpty && channelStoredDrafts != null ){
      channelStoredDrafts.remove(removeChannelDraft);
      _storageService.setStringList(StorageKeys.currentUserChannelIdDrafts, channelStoredDrafts);
    }else if(removeThreadDraft.isNotEmpty && threadStoredDrafts != null ){
      threadStoredDrafts.remove(removeThreadDraft);
      _storageService.setStringList(StorageKeys.currentUserThreadIdDrafts, threadStoredDrafts);
    }

    widgetBuilderList.removeAt(index);

    notifyListeners();
  }

  //navigation for dmUserView
  //TODO - pass in a unique id for each instance of dm view
  navigateToDmUserView() async {
    await _navigationService.navigateTo(Routes.dmUserView);
  }

  //navigation for threads
  //TODO - pass in a unique id for each instance of thread view as userPost might be too complex to save through shared prefs
  navigateToThread(UserPost? userPost) async {
    await _navigationService.navigateTo(Routes.threadDetailView,
        arguments: ThreadDetailViewArguments(userPost: userPost));
  }

  //navigation for channel
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
