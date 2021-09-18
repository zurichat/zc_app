import 'package:hng/app/app.locator.dart';
import 'package:hng/app/app.router.dart';
import 'package:hng/general_widgets/app_snackbar.dart';
import 'package:hng/package/base/server-request/api/http_api.dart';
import 'package:hng/services/local_storage_services.dart';
import 'package:hng/ui/view/otp/otp_view.form.dart';
import 'package:hng/utilities/storage_keys.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class OTPViewModel extends FormViewModel {
  NavigationService _navigationService = NavigationService();
  final _apiService = locator<HttpApiService>();
  static final _storage = locator<SharedPreferenceLocalStorage>();
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

  verifyOTP(context) async {
    _loading(true);
    final endpoint = '/verify-account';
    if ((otpValue!.length) > 5) {
      final verificationData = {
        'code': otpValue,
      };
      if (_storedOTP == otpValue) {
        final response =
            await _apiService.post(endpoint, data: verificationData);
        _loading(false);
        if (response?.statusCode == 200) {
          AppSnackBar.success(context, response?.data['message']);
          _storage.setBool(StorageKeys.registeredNotverifiedOTP, false);
          navigateLogin();
        } else {
          AppSnackBar.failure(
              context, response?.data['message'] ?? 'Something went wrong');
        }
      } else {
        _loading(false);
        AppSnackBar.failure(context, "Wrong OTP, please check again.");
      }
    }
  }
}
