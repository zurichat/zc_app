import 'package:hng/ui/shared/colors.dart';
import 'package:stacked/stacked.dart';

class UseDifferentEmailViewModel extends BaseViewModel {
  bool? onClicked = false;

  updateColor() {
    onClicked = true;
    notifyListeners();
  }

  labelColor() {
    return onClicked == false ? AppColors.deepGreyColor : AppColors.whiteColor;
  }

  btnColor() {
    switch (onClicked) {
      case true:
        return AppColors.zuriPrimaryColor;

      case false:
        return AppColors.inactiveGreyColor;

      default:
        return AppColors.inactiveGreyColor;
    }
  }
}
