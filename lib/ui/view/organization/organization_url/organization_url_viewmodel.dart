import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../../app/app.locator.dart';
import '../../../../app/app.router.dart';
import '../../../../package/base/server-request/organization_request/organization_api_service.dart';
import '../../../../services/local_storage_services.dart';
import '../../../../services/user_service.dart';
import '../../../../utilities/storage_keys.dart';
import '../../../shared/colors.dart';

class OrganizationUrlViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final _storageService = locator<SharedPreferenceLocalStorage>();
  final _userService = locator<UserService>();
  bool isBusyy = false;

  void loading(status) {
    isBusyy = status;
    notifyListeners();
  }

  final api = OrganizationApiService();

  bool isEmpty = true;
  String? url;
  var buttonColor = AppColors.greyishColor;
  var buttonTextColor = AppColors.blackColor;

  void updateString(String value) {
    if (value.trim().isEmpty) {
      isEmpty = true;
      buttonColor = AppColors.greyishColor;
      buttonTextColor = AppColors.blackColor;
    } else {
      isEmpty = false;
      buttonColor = AppColors.appBarGreen;
      buttonTextColor = AppColors.whiteColor;
    }
    url = value.trim();
    notifyListeners();
  }

  Future<void> signInToOrganization() async {
    if (url != null && url!.isNotEmpty) {
      loading(true);
      final organization = await api.fetchOrganizationByUrl(url!);
      _userService.setCurrentOrganizationId(organization.id!);

      //Todo: storing should be implemented after stage 7
      loading(false);
      _navigationService.navigateTo(Routes.navBarView);
    }

    //TODO: put the error text
  }

  Future<void> storeOrganizationId(String id) async {
    final ids =
        _storageService.getStringList(StorageKeys.organizationIds) ?? [];
    ids.add(id);
    await _storageService.setStringList(StorageKeys.organizationIds, ids);
  }

  get buttonColors => buttonColor;

  bool get title => isEmpty;

  String? get email => _storageService.getString(StorageKeys.currentUserEmail);
}
