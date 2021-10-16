import 'dart:io';

import 'package:zurichat/app/app.locator.dart';
import 'package:zurichat/constants/app_strings.dart';
import 'package:zurichat/models/user_model.dart';
import 'package:zurichat/package/base/server-request/api/zuri_api.dart';
import 'package:zurichat/services/media_service.dart';
import 'package:zurichat/services/user_service.dart';
import 'package:zurichat/utilities/constants.dart';
import 'package:zurichat/utilities/enums.dart';
import 'package:zurichat/utilities/mixins/validators_mixin.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import '../../../app/app.logger.dart';

//TODO refactor entire View Model, write as a Future View Model

class EditProfileViewModel extends BaseViewModel with ValidatorMixin {
  final _navigationService = locator<NavigationService>();
  final _userService = locator<UserService>();
  final _snackbarService = locator<SnackbarService>();
  final _zuriApi = ZuriApi(coreBaseUrl);
  final _bottomSheetService = locator<BottomSheetService>();
  final log = getLogger('EditProfileViewModel');
  final mediaService = locator<MediaService>();

  late UserModel userModel;
  String fullName = '';
  String phone = '';
  String bio = '';
  String displayName = '';
  String imageUrl = '';
  File? imageFile;

  void navigateBack() {
    _navigationService.back();
  }

  void onInit(UserModel user) {
    userModel = user;
    fullName = user.fullName ?? '';
    phone = user.phoneNumber ?? '';
    displayName = user.displayName ?? '';
    bio = user.bio ?? '';
    imageUrl = user.imageUrl ?? '';
  }

  void setState() => notifyListeners();

  void onChanged({String? disp, String? bo, String? phn, String? name, File? file}) {
    {
      if (disp != null) displayName = disp;
      if (bo != null) bio = bo;
      if (phn != null) phone = phn;
      if (name != null) fullName = name;
      if (file != null) imageFile = file;
      setState();
    }
  }

  Future<UserModel> updateData() async{
    if (validateNotEmptyField(fullName) != null) {
      _snackbarService.showCustomSnackBar(
          message: 'Fullname cannot be null', variant: SnackbarType.failure);
    }
    if(imageFile != null){
      imageUrl = await uploadPic();
    }
    fullName = fullName.trim();
    userModel
      ..firstName =
          fullName.isNotEmpty ? fullName.split(" ").first : userModel.firstName
      ..lastName =
          fullName.isNotEmpty ? fullName.split(" ").last : userModel.lastName
      ..displayName = displayName
      ..bio = bio
      ..phoneNumber = phone
      ..imageUrl;
    return userModel;
  }

  Future<void> onSave() async {
    if (!hasDataChanged) {
      close();
    }
    updateData();
    final res = await _zuriApi.patch(
      'organizations/$orgId/members/$userId/profile',
      body: userModel.toMap(),
      token: token,
    );
    if (res?.statusCode == 200) {
      _snackbarService.showCustomSnackBar(
          message: profileUpdated, variant: SnackbarType.success);
      _userService.setUserDetails(userModel);
      close();
    } else {
      _snackbarService.showCustomSnackBar(
          message: errorOccurred, variant: SnackbarType.failure);
    }
  }

  void close() => _navigationService.back();

  String? get userId => _userService.memberId;
  String? get orgId => _userService.currentOrgId;
  String? get email => _userService.userEmail;
  String? get token => _userService.authToken;
  bool get hasDataChanged {
    if (displayName != userModel.displayName ||
        bio != userModel.bio ||
        phone != userModel.phoneNumber ||
        (fullName.isNotEmpty && fullName != userModel.fullName ) ||
        imageFile != null
    ) {
      return true;
    } else {
      return false;
    }
  }

  Future<File?> editProfilePic() async {
    var sheetResponse = await _bottomSheetService.showCustomSheet(
      variant: BottomSheetType.imagePicker,
      isScrollControlled: true,
    );

    log.i('confirmationResponse confirmed: ${sheetResponse?.confirmed}');
    if(sheetResponse != null){
      imageFile = await mediaService.getImage(fromGallery: sheetResponse.confirmed);
      notifyListeners();
    }
  }

  //TODO-- fix the plugIn parameter needed to upload user profile pic to the endpoint
  Future<String> uploadPic() async{
    imageUrl = (await mediaService.uploadImage(imageFile,'6165f520375a4616090b8275'))!;
    return imageUrl;
  }

}
