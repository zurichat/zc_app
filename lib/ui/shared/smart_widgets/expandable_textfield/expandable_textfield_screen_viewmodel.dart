import 'dart:io';

import 'package:zurichat/app/app.locator.dart';
import 'package:zurichat/services/app_services/media_service.dart';
import 'package:stacked/stacked.dart';

class ExpandableTextFieldScreenViewModel extends BaseViewModel {
  final _mediaService = locator<MediaService>();
  final List<File> _mediaList = [];
  bool isVisible = false;
  bool isExpanded = false;
  double maxSize = 0;
  double minSize = 70;
  double size = 0;
  double offset = 0;

  void init(double max, [bool val = true]) {
    if (val) size = minSize;
    maxSize = max;
  }

  void toggleExpanded(bool val) {
    if (val) {
      size = maxSize;
      isExpanded = true;
    } else {
      size = minSize;
      toggleVisibility(isVisible);
      isExpanded = val;
    }
    notifyListeners();
  }

  void toggleVisibility(bool isVisible) {
    if (!isVisible) {
      isVisible = false;
      size = minSize;
    } else {
      isVisible = true;
      size = minSize + 50;
    }
    notifyListeners();
  }

  Future<void> onCameraTap(String roomId) async {
    final media = await _mediaService.getImage(fromGallery: true);
    _mediaList.add(media!);
    notifyListeners();
  }

  List<File> get mediaList => _mediaList;
}
