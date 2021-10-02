import 'dart:io';
import 'package:hng/app/app.locator.dart';
import 'package:hng/package/base/server-request/api/zuri_api.dart';
import 'package:hng/services/local_storage_services.dart';
import 'package:hng/services/user_service.dart';
import 'package:image_picker/image_picker.dart';


class MediaService {
  final _picker = ImagePicker();
  final zuriApi = locator<ZuriApi>();
  final storageService = locator<SharedPreferenceLocalStorage>();
  final userService = locator<UserService>();

  Future<String?> getImage({required bool fromGallery}) async {
    /// Pick an image/capture a photo
    // ignore: unused_local_variable
    final XFile? image = await _picker.pickImage(
        source: fromGallery ? ImageSource.gallery : ImageSource.camera);

    final File? file = File(image!.path);
    Future<String?> imageAddress = uploadImage(file);
    return imageAddress;
  }

  Future<String?> uploadImage(File? file) async {
    String imageAddress = await zuriApi.uploadImage(file,
        token: userService.authToken,
        orgId: userService.currentOrgId,
        memberId: userService.userId);
    return imageAddress;
  }
}
