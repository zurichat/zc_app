import 'package:zurichat/app/app.locator.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class TermsAndConditionsViewModel extends BaseViewModel {
  final navigator = locator<NavigationService>();
  popNavigation() => navigator.popRepeated(1);
}
