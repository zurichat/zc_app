import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../app/app.locator.dart';
import '../../../utilities/enums.dart';

class AdvancedViewModel extends BaseViewModel {
  final _dialogService = locator<DialogService>();
  String currentEmoji = "1";
  bool showImagePreviews = false;
  bool openWebPagesInApp = true;
  bool displayTypingIndicators = true;
  bool allowAnimatedImageAndEmoji = true;
  bool optimizeImageUploads = true;

  Future changeSkinTone() async {
    final dialogResult =
        await _dialogService.showCustomDialog(variant: DialogType.skinTone);

    if (dialogResult != null) {
      currentEmoji = dialogResult.data;

      notifyListeners();
    }
  }

  void toggleShowImagePreviews(bool value) {
    showImagePreviews = value;
    notifyListeners();
  }

  void toggleOpenWebPagesInApp(bool value) {
    openWebPagesInApp = value;
    notifyListeners();
  }

  void toggleDisplayTypingIndicators(bool value) {
    displayTypingIndicators = value;
    notifyListeners();
  }

  void toggleAllowAnimatedImageAndEmoji(bool value) {
    allowAnimatedImageAndEmoji = value;
    notifyListeners();
  }

  void toggleOptimizeImageUploads(bool value) {
    optimizeImageUploads = value;
    notifyListeners();
  }
}
