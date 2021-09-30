import 'package:hng/constants/app_strings.dart';
import 'package:hng/package/base/server-request/api/zuri_api.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../app/app.locator.dart';
import '../../../app/app.router.dart';
import '../../../services/local_storage_services.dart';
import '../../../utilities/constants.dart';
import '../../../utilities/enums.dart';
import '../../../utilities/storage_keys.dart';
import 'otp_view.form.dart';

class OTPViewModel extends FormViewModel {
  final _navigationService = NavigationService();
  final zuriApi = ZuriApi(coreBaseUrl);
  static final _storage = locator<SharedPreferenceLocalStorage>();
  final snackbar = locator<SnackbarService>();
  static String? _storedOTP;
  String? get token => _storage.getString(StorageKeys.currentSessionToken);

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  @override
  void setFormStatus() {}

  static init() {
    _storedOTP = _storage.getString(StorageKeys.otp);
  }

  void _loading(status) {
    _isLoading = status;
    notifyListeners();
  }

  void navigateLogin() {
    _navigationService.navigateTo(Routes.loginView);
  }

  void verifyOTP(context) async {
    _loading(true);

    if ((otpValue!.length) > 5) {
      final verificationData = {
        'code': otpValue,
      };
      if (_storedOTP == otpValue) {
        final response = await zuriApi.post(VerifyAcctEndpoint,
            body: verificationData, token: token);
        _loading(false);
        if (response?.statusCode == 200) {
          snackbar.showCustomSnackBar(
            duration: const Duration(seconds: 3),
            variant: SnackbarType.success,
            message: response?.data['message'],
          );
          _storage.setBool(StorageKeys.registeredNotverifiedOTP, false);
          navigateLogin();
        } else {
          snackbar.showCustomSnackBar(
            duration: const Duration(seconds: 3),
            variant: SnackbarType.failure,
            message: response?.data['message'] ?? ErrorOccurred,
          );
        }
      } else {
        _loading(false);
        snackbar.showCustomSnackBar(
          duration: const Duration(seconds: 3),
          variant: SnackbarType.failure,
          message: WrongOTP,
        );
      }
    }
  }
}
