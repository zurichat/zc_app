import 'package:zurichat/app/app.locator.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class WebViewModel extends BaseViewModel {
  final navigation = locator<NavigationService>();
  bool isLoading = false;

  int progressValue = 0;

  goBack() => navigation.back();

  void updateValue(int progress) {
    progressValue = progress;
    notifyListeners();
  }

  void startLoading() {
    isLoading = true;
    notifyListeners();
  }

  void stopLoading() {
    isLoading = false;
    notifyListeners();
  }
}
