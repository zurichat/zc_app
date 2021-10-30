import 'dart:convert';
import 'package:zurichat/app/app.locator.dart';
import 'package:zurichat/app/app.router.dart';
import 'package:zurichat/models/draft_data_holder_model.dart';
import 'package:zurichat/models/user_post.dart';
import 'package:zurichat/services/app_services/connectivity_service.dart';
import 'package:zurichat/services/app_services/local_storage_services.dart';
import 'package:zurichat/utilities/enums.dart';
import 'package:zurichat/utilities/constants/storage_keys.dart';
import 'package:zurichat/utilities/constants/app_strings.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:zurichat/app/app.logger.dart';

class DraftViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final connectivityService = locator<ConnectivityService>();
  final _storageService = locator<SharedPreferenceLocalStorage>();
  final snackBar = locator<SnackbarService>();
  final log = getLogger("DraftPageViewModel");
  final _dialogService = locator<DialogService>();
  List<DraftDataHolder> widgetBuilderList = [];

  void get drafts {
    var currentOrgId = _storageService.getString(StorageKeys.currentOrgId);
    var currentUserId = _storageService.getString(StorageKeys.currentUserId);
    var dmStoredDrafts =
        _storageService.getStringList(StorageKeys.currentUserDmIdDrafts);
    var channelStoredDrafts =
        _storageService.getStringList(StorageKeys.currentUserChannelIdDrafts);
    var threadStoredDrafts =
        _storageService.getStringList(StorageKeys.currentUserThreadIdDrafts);

    if (dmStoredDrafts != null) {
      dmStoredDrafts.forEach((element) {
        if (currentOrgId == jsonDecode(element)['currentOrgId'] &&
            currentUserId == jsonDecode(element)['currentUserId']) {
          var mapKey = jsonDecode(element);

          widgetBuilderList.add(DraftDataHolder(
            '${mapKey['receiverName']}',
            '${mapKey['draft']}',
            mapKey,
            '${mapKey['time']}',
          ));
        }
      });
    }

    if (channelStoredDrafts != null) {
      channelStoredDrafts.forEach((element) {
        if (currentOrgId == jsonDecode(element)['currentOrgId'] &&
            currentUserId == jsonDecode(element)['currentUserId']) {
          var mapKey = jsonDecode(element);

          widgetBuilderList.add(DraftDataHolder(
            '${mapKey['channelName']}',
            '${mapKey['draft']}',
            mapKey,
            '${mapKey['time']}',
          ));
        }
      });
    }

    if (threadStoredDrafts != null) {
      threadStoredDrafts.forEach((element) {
        if (currentOrgId == jsonDecode(element)['currentOrgId'] &&
            currentUserId == jsonDecode(element)['currentUserId']) {
          var mapKey = jsonDecode(element);

          widgetBuilderList.add(DraftDataHolder(
            '# ${mapKey['userPostChannelName']}',
            '${mapKey['draft']}',
            mapKey,
            '${mapKey['time']}',
          ));
        }
      });
    }
  }

  void goBack() {
    _navigationService.back();
  }

  void rebuild() {
    notifyListeners();
  }

  void onDismissed(index) {
    var removeDmDraft = '';
    var removeChannelDraft = '';
    var removeThreadDraft = '';

    var dmStoredDrafts =
        _storageService.getStringList(StorageKeys.currentUserDmIdDrafts);
    var channelStoredDrafts =
        _storageService.getStringList(StorageKeys.currentUserChannelIdDrafts);
    var threadStoredDrafts =
        _storageService.getStringList(StorageKeys.currentUserThreadIdDrafts);

    if (dmStoredDrafts != null) {
      dmStoredDrafts.forEach((element) {
        if (jsonDecode(element)['time'] == widgetBuilderList[index].time) {
          removeDmDraft = element;
        }
      });
    }

    if (channelStoredDrafts != null) {
      channelStoredDrafts.forEach((element) {
        if (jsonDecode(element)['time'] == widgetBuilderList[index].time) {
          removeChannelDraft = element;
        }
      });
    }

    if (threadStoredDrafts != null) {
      threadStoredDrafts.forEach((element) {
        if (jsonDecode(element)['time'] == widgetBuilderList[index].time) {
          removeThreadDraft = element;
        }
      });
    }

    if (removeDmDraft.isNotEmpty && dmStoredDrafts != null) {
      dmStoredDrafts.remove(removeDmDraft);
      _storageService.setStringList(
          StorageKeys.currentUserDmIdDrafts, dmStoredDrafts);
    } else if (removeChannelDraft.isNotEmpty && channelStoredDrafts != null) {
      channelStoredDrafts.remove(removeChannelDraft);
      _storageService.setStringList(
          StorageKeys.currentUserChannelIdDrafts, channelStoredDrafts);
    } else if (removeThreadDraft.isNotEmpty && threadStoredDrafts != null) {
      threadStoredDrafts.remove(removeThreadDraft);
      _storageService.setStringList(
          StorageKeys.currentUserThreadIdDrafts, threadStoredDrafts);
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

  showDeleteDraftDialog(index) async {
    final result = await _dialogService.showCustomDialog(
      variant: DialogType.deleteDraft,
      title: "Delete Draft",
      description: "Are you sure you want to delete this draft?",
      mainButtonTitle: 'Ok',
      secondaryButtonTitle: 'Cancel',
      barrierDismissible: true,
    );

    if (result!.confirmed) {
      onDismissed(index);
      return result.confirmed;
    }
  }
}
