import '../../general_widgets/app_toast.dart';

import '../../ui/shared/constants.dart';

mixin CustomWillPopScopeMixin {
  static bool _secondBack = false;
  static const secondTapDurationSpace = Duration(seconds: 2);
  Future<bool> onSecondBackPop() async {
    if (!_secondBack) {
      AppToast.instance.message(null, 'Press back again to close $appName');
      _secondBack = true;
      Future.delayed(secondTapDurationSpace, () => _secondBack = false);
      return false;
    } else {
      return true;
    }
  }

  Future<bool> delayAndPop() async {
    AppToast.instance.message(null, 'Closing $appName');
    return Future.delayed(secondTapDurationSpace, () => true);
  }
}
