import 'package:hng/app/app.locator.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class WebViewModel extends BaseViewModel {
  final navigation = locator<NavigationService>();
  bool isLoading = false;
  goBack() => navigation.back();

  startLoading() {
    isLoading = true;
    notifyListeners();
  }
  stopLoading() {
    isLoading = false;
    notifyListeners();
  }
}