import 'dart:io';

import 'package:image_picker/image_picker.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class MediaService {
  final _picker = ImagePicker();

  Future<File?> getImage({required bool fromGallery}) async {
    /// Pick an image/capture a photo
    // ignore: unused_local_variable
    final XFile? image = await _picker.pickImage(
        source: fromGallery ? ImageSource.gallery : ImageSource.camera);

    if (image != null) return File(image.path);
  }
}
