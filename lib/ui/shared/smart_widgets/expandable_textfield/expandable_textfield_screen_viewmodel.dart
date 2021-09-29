import 'package:flutter/cupertino.dart';

class ExpandableTextFieldScreenViewModel extends ChangeNotifier {
  final ScrollController scrollController = ScrollController();
  final TextEditingController textController = TextEditingController();

  bool isVisible = false;
  bool isExpanded = false;

  void toggleExpanded() {
    isExpanded = !isExpanded;
    notifyListeners();
  }

  void toggleVisibility(bool _isVisible) {
    if (!_isVisible) {
      isVisible = false;
    } else {
      isVisible = true;
    }
    notifyListeners();
  }
}
