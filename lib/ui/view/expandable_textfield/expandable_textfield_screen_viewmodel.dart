import 'package:hng/app/app.locator.dart';
import 'package:hng/utilities/enums.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '/../../app/app.logger.dart';

class ExpandableTextFieldScreenViewModel extends FormViewModel {
  final _dialogService = locator<DialogService>();
  final log = getLogger('ExpandableTextFieldScreenViewModel');
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

  popDialog(String text, String channelID) async {
    final dialogResult = await _dialogService.showCustomDialog(
      variant: DialogType.scheduleMessageChannel,
      data: {'channelID': channelID, 'message': text},
    );

    if (dialogResult != null) {
      log.i(dialogResult.data);

      notifyListeners();
    }
  }

  @override
  void setFormStatus() {
    // TODO: implement setFormStatus
  }
}
