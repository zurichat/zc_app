import 'dart:io';
import 'package:zurichat/app/app.locator.dart';
import 'package:zurichat/package/base/server-request/api/zuri_api.dart';
import 'package:zurichat/services/local_storage_services.dart';
import 'package:zurichat/services/user_service.dart';
import 'package:zurichat/utilities/constants.dart';
import 'package:image_picker/image_picker.dart';
import 'package:zurichat/ui/shared/shared.dart';

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

  Future<String?> uploadImage(File? file, String pluginId) async {
    String imageAddress = await zuriApi.uploadImage(file,
        token: userService.authToken, pluginId: '6165f520375a4616090b8275');
    return imageAddress;
  }
}
