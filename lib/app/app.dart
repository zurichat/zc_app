import 'package:shared_preferences/shared_preferences.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:stacked_themes/stacked_themes.dart';

import '../services/connectivity_service.dart';
import '../services/local_storage_services.dart';
import '../ui/view/channel/channel_page_view.dart';
import '../ui/view/channel/channels_view.dart';
import '../ui/view/channel/new_channel/new_channel.dart';
import '../ui/view/channel_info/channel_info_view.dart';
import '../ui/view/channel_notification/channel_notification_view.dart';
import '../ui/view/dm_search/dm_search_view.dart';
import '../ui/view/dm_user/dm_user_view.dart';
import '../ui/view/forgot_password/forgot_password_view.dart';
import '../ui/view/login/login_view.dart';
import '../ui/view/nav_bar/nav_bar_view.dart';
import '../ui/view/onboarding/onboading_view.dart';
import '../ui/view/otp/otp_view.dart';
import '../ui/view/preference/preference_view.dart';
import '../ui/view/sign_up/sign_up_view.dart';
import '../ui/view/splashscreen/splashscreen.dart';
// import '../ui/view/workspace/create_workspace/create_workspace.dart';
import '../ui/view/workspace/workspace_view.dart';

// @StackedApp(routes: [
//   MaterialRoute(page: HomeView, initial: true),
//   MaterialRoute(page: LoginView),
//   MaterialRoute(page: CreateWorkSpace)
// ], dependencies: [
//   LazySingleton(classType: NavigationService)
// ])
@StackedApp(
  routes: [
    MaterialRoute(page: LoginView),
    MaterialRoute(page: NavBarView),
    MaterialRoute(page: OnboardingView, initial: true),
    MaterialRoute(page: PreferenceView),
    MaterialRoute(page: SignUpView),
    MaterialRoute(page: SignUpView),
    MaterialRoute(page: WorkspaceView),
    MaterialRoute(page: ChannelList),
    MaterialRoute(page: ForgotPasswordView),
    MaterialRoute(page: ChannelNotificationView),
    MaterialRoute(page: NewChannel),
    MaterialRoute(page: ChannelInfoView),
    MaterialRoute(page: ChannelPageView),
    MaterialRoute(page: DmSearch),
    MaterialRoute(page: WorkspaceView),
    MaterialRoute(page: OtpView),
    MaterialRoute(page: DmUserView),
    MaterialRoute(page: Splashview),
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
