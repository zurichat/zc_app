import 'package:hng/app/app.locator.dart';
import 'package:hng/app/app.router.dart';
import 'package:hng/package/base/server-request/Organization_request/Organization_api_service.dart';
import 'package:hng/services/local_storage_services.dart';
import 'package:hng/services/user_service.dart';
import 'package:hng/ui/shared/colors.dart';
import 'package:hng/utilities/storage_keys.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class OrganizationUrlViewModel extends BaseViewModel {
  final navigation = locator<NavigationService>();
  final storage = locator<SharedPreferenceLocalStorage>();
  final _userService = locator<UserService>();
  bool isBusy = false;

  loading(status) {
    isBusy = status;
    notifyListeners();
  }

  final api = OrganizationApiService();

  bool isEmpty = true;
  String _email = 'johndoe@gmail.com';
  String? url;
  var buttonColor = AppColors.greyishColor;

  void updateString(String value) {
    if (value.trim().isEmpty) {
      isEmpty = true;
      buttonColor = AppColors.greyishColor;
    } else {
      isEmpty = false;
      buttonColor = AppColors.appBarGreen;
    }
    url = value.trim();
    notifyListeners();
  }

  Future<void> signInToOrganization() async {
    if (url != null && url!.isNotEmpty) {
      loading(true);
      final organization = await api.fetchOrganizationByUrl(url!);
      // await api.joinOrganization(Organization.id!);

      //Set the Organization id to the currently signed in
      //This is the same has saving to the local storage
      _userService.setCurrentOrganizationId(organization.id!);

      //Todo: storing should be implemented after stage 7
      // await storeOrganizationId(Organization.id);
      loading(false);
      navigation.navigateTo(Routes.navBarView);

      // popUntil((route) => route.settings.name == Routes.navBarView);
      // popUntil(ModalRoute.withName(Routes.OrganizationView));
    }
    //TODO: put the error text
  }

  Future<void> storeOrganizationId(String id) async {
    List<String> ids = storage.getStringList(StorageKeys.organizationIds) ?? [];
    ids.add(id);
    await storage.setStringList(StorageKeys.organizationIds, ids);
  }

  get buttonColors => buttonColor;
  bool get title => isEmpty;
  String get email => _email;
}
