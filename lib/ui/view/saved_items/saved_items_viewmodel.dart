import 'dart:convert';

import 'package:hng/app/app.locator.dart';
import 'package:hng/app/app.router.dart';
import 'package:hng/models/saved_item_model.dart';
import 'package:hng/services/local_storage_services.dart';
import 'package:hng/utilities/storage_keys.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:hng/app/app.logger.dart';

class SavedItemsViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final storageService = locator<SharedPreferenceLocalStorage>();
  List<SavedItemModel> savedBuilderList = [];
  final log = getLogger('SavedItemsViewModel');

  goBack() => _navigationService.back();

  deleteItem(int index) {
    savedBuilderList.removeAt(index);
    goBack();
    notifyListeners();
  }

  navigateToMessage(userPost) {
    _navigationService.navigateTo(Routes.threadDetailView,arguments: ThreadDetailViewArguments(userPost: userPost));
  }

  get savedItems {
    var channelStorageKeys =
        storageService.getStringList(StorageKeys.savedItem);

    if (channelStorageKeys != null) {
      channelStorageKeys.forEach((element) {
        if (storageService.getString(element) != null) {
          var savedItemMap = storageService.getString(element);
          if (savedItemMap != null) {
            var savedMap = jsonDecode(savedItemMap);
            log.w(savedMap);
            savedBuilderList.add(SavedItemModel(
              savedMap['channel_name'],
              savedMap['user_id'],
              savedMap['user_image'],
              savedMap['last_seen'],
              savedMap['message'],
              savedMap['channel_id'],
              savedMap['display_name'],
            ));
          }
        }
      });
    }
  }

  void exitPage() {
    _navigationService.back();
  }
}
