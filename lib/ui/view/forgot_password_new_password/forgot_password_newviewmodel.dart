import 'package:flutter/widgets.dart';
import 'package:hng/app/app.router.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class ForgotPasswordNewViewModel extends BaseViewModel {
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController reTypePassController = TextEditingController();
  final validateKey = GlobalKey<FormState>();
  NavigationService _navigationService = NavigationService();

  void navigateToLogin() {
    _navigationService.navigateTo(Routes.loginView);
  }
}
