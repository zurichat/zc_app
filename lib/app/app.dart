import 'package:hng/ui/view/draft/draft_view.dart';
import 'package:hng/ui/view/file_search/file_search_view.dart';
import 'package:hng/ui/view/forgot_password_email/forgot_password_email_view.dart';
import 'package:hng/ui/view/forgot_password_new_password/forgot_password_newview.dart';
import 'package:hng/ui/view/forgot_password_otp/forgot_password_otpview.dart';
import 'package:hng/ui/view/popup_notification/popup_notification.dart';
import 'package:hng/ui/view/workspace/add_workspace/add_workspace_view.dart';
import 'package:hng/ui/view/workspace/create_workspace/create_workspace.dart';

import '../ui/view/workspace/workspace_different_email/difference_email_workspace_view.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:stacked_themes/stacked_themes.dart';

import '../services/connectivity_service.dart';
import '../services/local_storage_services.dart';
import '../ui/nav_pages/home_page/home_page.dart';
import '../ui/view/add_people/add_people_view.dart';
import '../ui/view/channel/channel_info/channel_info_view.dart';
import '../ui/view/channel/channel_list/channels_view.dart';
import '../ui/view/channel/channel_notification/channel_notification_view.dart';
import '../ui/view/channel/channel_view/channel_page_view.dart';
import '../ui/view/channel/new_channel/new_channel.dart';
import '../ui/view/dm_chat_view/dm_jump_to_view.dart';
import '../ui/view/dm_search/dm_search_view.dart';
import '../ui/view/dm_user/dm_user_view.dart';
import '../ui/view/login/login_view.dart';
import '../ui/view/nav_bar/nav_bar_view.dart';
import '../ui/view/onboarding/onboading_view.dart';
import '../ui/view/otp/otp_view.dart';
import '../ui/view/plugins/add_plugin_view.dart';
import '../ui/view/plugins/edit_plugin_view.dart';
import '../ui/view/plugins/plugins_view.dart';
import '../ui/view/preference/preference_view.dart';
import '../ui/view/sign_up/sign_up_view.dart';
import '../ui/view/splashscreen/splashscreen.dart';
import '../ui/view/workspace/workspace_view/workspace_view.dart';
import '../ui/view/pinned_messages/pinned_message.dart';

@StackedApp(
  routes: [
    MaterialRoute(page: NavBarView),
    MaterialRoute(page: OnboardingView, initial: true),
    MaterialRoute(page: PreferenceView),
    MaterialRoute(page: LoginView),
    MaterialRoute(page: OtpView),
    MaterialRoute(page: SignUpView),
    MaterialRoute(page: ChannelList),
    MaterialRoute(page: ForgotPasswordEmailView),
    MaterialRoute(page: ForgotPasswordOtpView),
    MaterialRoute(page: ForgotPasswordNewView),
    MaterialRoute(page: ChannelNotificationView),
    MaterialRoute(page: NewChannel),
    MaterialRoute(page: ChannelInfoView),
    MaterialRoute(page: HomePage),
    MaterialRoute(page: AddPeopleView),
    MaterialRoute(page: ChannelPageView),
    MaterialRoute(page: DmSearch),
    MaterialRoute(page: WorkspaceView),
    MaterialRoute(page: DmJumpToView),
    MaterialRoute(page: DmUserView),
    MaterialRoute(page: Splashview),
    MaterialRoute(page: PluginView),
    MaterialRoute(page: AddPluginView),
    MaterialRoute(page: UseDifferentEmailView),
    MaterialRoute(page: EditPluginView),
    MaterialRoute(page: PopUpNotificationsView),
    MaterialRoute(page: PinnedMessages),
    MaterialRoute(page: AddWorkspaceView),
    MaterialRoute(page: CreateWorkSpace),
    MaterialRoute(page: FileSearchView),
    MaterialRoute(page: DraftView),
  ],
  dependencies: [
    LazySingleton(classType: NavigationService),
    LazySingleton(classType: ThemeService),
    Presolve(
      classType: SharedPreferenceLocalStorage,
      presolveUsing: SharedPreferences.getInstance,
    ),
    Presolve(
      classType: ConnectivityService,
      presolveUsing: ConnectivityService.getInstance,
    ),
  ],
)
class AppSetup {
  /* This class serves no other purpose other than having the
   StackedApp annotation attached to it*/
}
