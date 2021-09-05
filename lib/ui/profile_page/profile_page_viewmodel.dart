/*
this is the view model i created to run my test, the dev in charge can delete if he sees fit
 */
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:stacked/stacked.dart';

class ProfilePageViewModel extends BaseViewModel {
  // the image url should be replaced with image gotten from the rest api, this is just for testing
  var url =
      'https://i.picsum.photos/id/1/5616/3744.jpg?hmac=kKHwwU8s46oNettHKwJ24qOlIAsWN9d2TtsXDoCWWsQ';
  saveProfilePictureLocally() async {
    var status = await Permission.storage.request();
    if (status.isGranted) {
      var response = await Dio()
          .get(url, options: Options(responseType: ResponseType.bytes));
      final result = await ImageGallerySaver.saveImage(
          Uint8List.fromList(response.data),
          quality: 60,
          // the username should be replaced with the username from the rest api
          name: "User Name");
      print(result);
      print(response.statusCode);
    }
  }
}
