import 'package:stacked/stacked.dart';

class ExpandableTextFieldScreenViewModel extends BaseViewModel {
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

  void toggleVisibility(bool _isVisible) {
    if (!_isVisible) {
      isVisible = false;
      size = minSize;
    } else {
      isVisible = true;
      size = minSize + 50;
    }
    notifyListeners();
  }
}
