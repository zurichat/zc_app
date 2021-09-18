import 'package:hng/utilities/enums.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../app/app.locator.dart';
import '../../../app/app.router.dart';
import '../../../package/base/server-request/api/http_api.dart';
import '../../../services/local_storage_services.dart';
import '../../../utilities/storage_keys.dart';
import 'otp_view.form.dart';

class OTPViewModel extends FormViewModel {
  final _navigationService = NavigationService();
  final _apiService = locator<HttpApiService>();
  static final _storage = locator<SharedPreferenceLocalStorage>();
  final snackbar = locator<SnackbarService>();
  static String? _storedOTP;

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
    const endpoint = '/verify-account';
    if ((otpValue!.length) > 5) {
      final verificationData = {
        'code': otpValue,
      };
      if (_storedOTP == otpValue) {
        final response =
            await _apiService.post(endpoint, data: verificationData);
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
            message: response?.data['message'] ?? 'Something went wrong',
          );
        }
      } else {
        _loading(false);
        snackbar.showCustomSnackBar(
          duration: const Duration(seconds: 3),
          variant: SnackbarType.failure,
          message: 'Wrong OTP, please check again.',
        );
      }
    }
  }
}
