import 'dart:convert';

import 'package:zurichat/app/app.locator.dart';
import 'package:zurichat/models/saved_item_model.dart';
import 'package:zurichat/services/local_storage_services.dart';
import 'package:zurichat/utilities/storage_keys.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:zurichat/app/app.logger.dart';

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
