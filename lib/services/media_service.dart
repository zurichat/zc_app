import 'dart:io';
import 'package:hng/app/app.locator.dart';
import 'package:hng/package/base/server-request/api/zuri_api.dart';
import 'package:hng/services/local_storage_services.dart';
import 'package:hng/services/user_service.dart';
import 'package:hng/utilities/constants.dart';
import 'package:hng/utilities/storage_keys.dart';
import 'package:image_picker/image_picker.dart';

class MediaService {
  final ImagePicker _picker = ImagePicker();
  final zuriApi = ZuriApi(coreBaseUrl);
  final storageService = locator<SharedPreferenceLocalStorage>();
  final userService = locator<UserService>();

  Future<File?> getImage({required bool fromGallery}) async {
    /// Pick an image/capture a photo

    final XFile? image = await _picker.pickImage(
        source: fromGallery ? ImageSource.gallery : ImageSource.camera);

    final File? file = File(image!.path);
    return file;
  }

  Future<File?> getVideo({required bool fromGallery}) async {
    /// Pick a video/capture a video

    final XFile? image = await _picker.pickVideo(
        source: fromGallery ? ImageSource.gallery : ImageSource.camera);

    final File? file = File(image!.path);
    return file;
  }

  String? get token =>
      storageService.getString(StorageKeys.currentSessionToken);

  Future<String?> uploadImage(File? file, String pluginId) async {
    String imageAddress = await zuriApi.uploadImage(file,
        token: token!, //userService.authToken,
        // orgId: userService.currentOrgId,
        // memberId: userService.userId);
        pluginId: '6165f520375a4616090b8275');
    return imageAddress;
  }
}
