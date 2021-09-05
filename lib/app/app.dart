import 'package:hng/ui/nav_pages/home_page/home_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:hng/ui/view/workspace/workspace_view.dart';

import 'package:hng/ui/view/channel/new_channel/new_channel.dart';
import 'package:hng/ui/view/nav_bar/nav_bar_view.dart';
import 'package:hng/ui/view/onboarding/onboading_view.dart';
import 'package:hng/ui/view/preference/preference_view.dart';
import 'package:hng/ui/view/sign_up/sign_up_view.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:stacked_themes/stacked_themes.dart';
import '../services/connectivity_service.dart';
import '../services/local_storage_services.dart';
import '../ui/view/channel_info/channel_info_view.dart';
import '../ui/view/login/login_view.dart';
import '../ui/view/otp/otp_view.dart';
import '../ui/view/nav_bar/nav_bar_view.dart';
import '../ui/view/onboarding/onboading_view.dart';
import '../ui/view/preference/preference_view.dart';
import '../ui/view/add_people/add_people_view.dart';

@StackedApp(
  routes: [
    MaterialRoute(page: LoginView),
    MaterialRoute(page: NavBarView),
    MaterialRoute(page: OnboardingView),
    MaterialRoute(page: PreferenceView),
    MaterialRoute(page: LoginView),
    MaterialRoute(page: OtpView),
    MaterialRoute(page: SignUpView),
    MaterialRoute(page: WorkspaceView),
    MaterialRoute(page: NewChannel),
    MaterialRoute(page: ChannelInfoView),
    MaterialRoute(page: HomePage),
    MaterialRoute(page: AddPeopleView, initial: true),
  ],
  dependencies: [
    LazySingleton(classType: NavigationService),
    LazySingleton(classType: ThemeService),
    Presolve(
      classType: SharedPreferenceLocalStorage,
      presolveUsing: SharedPreferences.getInstance,
    ),
    LazySingleton(classType: ConnectivityService)
  ],
)
class AppSetup {
  /* This class serves no other purpose other than having the
   StackedApp annotation attached to it*/
}
