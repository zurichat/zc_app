import 'package:shared_preferences/shared_preferences.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:stacked_themes/stacked_themes.dart';

import '../package/base/jump_to_request/jump_to_api.dart';
import '../package/base/server-request/channels/channels_api_service.dart';
import '../package/base/server-request/dms/dms_api_service.dart';
import '../services/connectivity_service.dart';
import '../services/local_storage_services.dart';
import '../services/user_service.dart';
import '../ui/nav_pages/home_page/home_page.dart';
import '../ui/view/add_people/add_people_view.dart';
import '../ui/view/advanced/advanced_view.dart';
import '../ui/view/channel/add_people/channel_add_people_view.dart';
import '../ui/view/channel/channel_info/channel_info_view.dart';
import '../ui/view/channel/channel_list/channels_view.dart';
import '../ui/view/channel/channel_notification/channel_notification_view.dart';
import '../ui/view/channel/channel_view/channel_page_view.dart';
import '../ui/view/channel/edit_channel/edit_channel_view.dart';
import '../ui/view/channel/new_channel/new_channel.dart';
import '../ui/view/clear_after/clear_after_view.dart';
import '../ui/view/dm_chat_view/dm_jump_to_view.dart';
import '../ui/view/dm_search/dm_search_view.dart';
import '../ui/view/dm_user/dm_user_view.dart';
import '../ui/view/do_not_disturb/do_not_disturb_view.dart';
import '../ui/view/draft/draft_view.dart';
import '../ui/view/edit_profile/edit_profile_view.dart';
import '../ui/view/file_search/file_search_view.dart';
import '../ui/view/forgot_password/forgot_password_email/forgot_password_email_view.dart';
import '../ui/view/forgot_password/forgot_password_new_password/forgot_password_newview.dart';
import '../ui/view/forgot_password/forgot_password_otp/forgot_password_otpview.dart';
import '../ui/view/language_and_region/language_and_region_view.dart';
import '../ui/view/login/login_view.dart';
import '../ui/view/nav_bar/nav_bar_view.dart';
import '../ui/view/notifications/notifications_view.dart';
import '../ui/view/onboarding/onboading_view.dart';
import '../ui/view/organization/add_organization/add_organization_view.dart';
import '../ui/view/organization/create_organization/create_organization.dart';
import '../ui/view/organization/organization_different_email/different_email_organization_view.dart';
import '../ui/view/organization/organization_url/organization_url_view.dart';
import '../ui/view/organization/organization_view/organization_view.dart';
import '../ui/view/organization/select_email/select_email_view.dart';
import '../ui/view/otp/otp_view.dart';
import '../ui/view/pinned_messages/pinned_message.dart';
import '../ui/view/plugins/add_plugin_view.dart';
import '../ui/view/plugins/edit_plugin_view.dart';
import '../ui/view/plugins/plugins_view.dart';
import '../ui/view/popup_notification/popup_notification.dart';
import '../ui/view/preference/preference_view.dart';
import '../ui/view/profile_page/profile_page_view.dart';
import '../ui/view/saved_items/saved_items_view.dart';
import '../ui/view/set_status/set_status_view.dart';
import '../ui/view/sign_up/sign_up_view.dart';
import '../ui/view/splashscreen/splashscreen.dart';
import '../ui/view/start_dm/start_dm_view.dart';
import '../ui/view/threads/all_threads/threads_view.dart';
import '../ui/view/threads/thread_detail/thread_detail_view.dart';
import '../ui/view/user_search/user_search_view.dart';
import '../ui/view/view_profile_page/view_profile.dart';

@StackedApp(
  routes: [
    MaterialRoute(page: ChannelAddPeopleView),
    MaterialRoute(page: NavBarView),
    MaterialRoute(page: OnboardingView),
    MaterialRoute(page: LoginView),
    MaterialRoute(page: OTPView),
    MaterialRoute(page: SignUpView),
    MaterialRoute(page: OrganizationView),
    MaterialRoute(page: ChannelList),
    MaterialRoute(page: ForgotPasswordEmailView),
    MaterialRoute(page: ForgotPasswordOtpView),
    MaterialRoute(page: ForgotPasswordNewView),
    MaterialRoute(page: ChannelNotificationView),
    MaterialRoute(page: NewChannel),
    MaterialRoute(page: HomePage),
    MaterialRoute(page: AddPeopleView),
    MaterialRoute(page: DmSearch),
    MaterialRoute(page: DmJumpToView),
    MaterialRoute(page: DmUserView),
    MaterialRoute(page: Splashview, initial: true),
    MaterialRoute(page: PluginView),
    MaterialRoute(page: AddPluginView),
    MaterialRoute(page: UseDifferentEmailView),
    MaterialRoute(page: EditPluginView),
    MaterialRoute(page: ViewProfile),
    MaterialRoute(page: SetStatusView),
    MaterialRoute(page: ProfilePageView),
    MaterialRoute(page: PreferenceView),
    MaterialRoute(page: LanguageAndRegionModelView),
    MaterialRoute(page: SavedItemsView),
    MaterialRoute(page: NotificationsView),
    MaterialRoute(page: AdvancedView),
    MaterialRoute(page: ClearAfterView),
    MaterialRoute(page: DoNotDisturbView),
    MaterialRoute(page: EditProfileView),
    MaterialRoute(page: PopUpNotificationsView),
    MaterialRoute(page: PinnedMessages),
    MaterialRoute(page: SelectEmail),
    MaterialRoute(page: AddOrganizationView),
    MaterialRoute(page: CreateOrganization),
    MaterialRoute(page: FileSearchView),
    MaterialRoute(page: DraftView),
    MaterialRoute(page: ThreadsView),
    MaterialRoute(page: ThreadDetailView),
    MaterialRoute(page: UserSearchView),
    MaterialRoute(page: EditChannelPageView),
    MaterialRoute(page: StartDmView),
    MaterialRoute(page: OrganizationUrlView),
    MaterialRoute(page: ChannelPageView),
    MaterialRoute(page: ChannelInfoView),
  ],
  dependencies: [
    LazySingleton(classType: NavigationService),
    LazySingleton(classType: SnackbarService),
    LazySingleton(classType: ThemeService),
    Presolve(
      classType: SharedPreferenceLocalStorage,
      presolveUsing: SharedPreferences.getInstance,
    ),
    LazySingleton(classType: DialogService),
    LazySingleton(classType: BottomSheetService),
    Presolve(
      classType: ConnectivityService,
      presolveUsing: ConnectivityService.getInstance,
    ),
    LazySingleton(classType: UserService),
    LazySingleton(classType: DMApiService),
    LazySingleton(classType: ChannelsApiService),
    LazySingleton(classType: JumpToApi),
  ],
  logger: StackedLogger(),
)
class AppSetup {
  /* This class serves no other purpose other than having the
   StackedApp annotation attached to it*/
}