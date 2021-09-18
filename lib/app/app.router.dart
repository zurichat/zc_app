// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedRouterGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../ui/nav_pages/home_page/home_page.dart';
import '../ui/view/add_people/add_people_view.dart';
import '../ui/view/advanced/advanced_view.dart';
import '../ui/view/channel/add_people/channel_add_people_view.dart';
import '../ui/view/channel/channel_info/channel_info_view.dart';
import '../ui/view/channel/channel_list/channels_view.dart';
import '../ui/view/channel/channel_notification/channel_notification_view.dart';
import '../ui/view/channel/channel_view/channel_page_view.dart';
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
import '../ui/view/view_profile_page/view_profile.dart';
import '../ui/view/workspace/add_workspace/add_workspace_view.dart';
import '../ui/view/workspace/create_workspace/create_workspace.dart';
import '../ui/view/workspace/workspace_different_email/difference_email_workspace_view.dart';
import '../ui/view/workspace/workspace_url/workspace_url_view.dart';
import '../ui/view/workspace/workspace_view/workspace_view.dart';
import '../utilities/enums.dart';

class Routes {
  static const String channelAddPeopleView = '/channel-add-people-view';
  static const String navBarView = '/nav-bar-view';
  static const String onboardingView = '/onboarding-view';
  static const String loginView = '/login-view';
  static const String oTPView = '/o-tp-view';
  static const String signUpView = '/sign-up-view';
  static const String workspaceView = '/workspace-view';
  static const String channelList = '/channel-list';
  static const String forgotPasswordEmailView = '/forgot-password-email-view';
  static const String forgotPasswordOtpView = '/forgot-password-otp-view';
  static const String forgotPasswordNewView = '/forgot-password-new-view';
  static const String channelNotificationView = '/channel-notification-view';
  static const String newChannel = '/new-channel';
  static const String channelInfoView = '/channel-info-view';
  static const String homePage = '/home-page';
  static const String addPeopleView = '/add-people-view';
  static const String channelPageView = '/channel-page-view';
  static const String dmSearch = '/dm-search';
  static const String dmJumpToView = '/dm-jump-to-view';
  static const String dmUserView = '/dm-user-view';
  static const String splashview = '/';
  static const String pluginView = '/plugin-view';
  static const String addPluginView = '/add-plugin-view';
  static const String useDifferentEmailView = '/use-different-email-view';
  static const String editPluginView = '/edit-plugin-view';
  static const String viewProfile = '/view-profile';
  static const String setStatusView = '/set-status-view';
  static const String profilePageView = '/profile-page-view';
  static const String preferenceView = '/preference-view';
  static const String languageAndRegionModelView =
      '/language-and-region-model-view';
  static const String savedItemsView = '/saved-items-view';
  static const String notificationsView = '/notifications-view';
  static const String advancedView = '/advanced-view';
  static const String clearAfterView = '/clear-after-view';
  static const String doNotDisturbView = '/do-not-disturb-view';
  static const String editProfileView = '/edit-profile-view';
  static const String popUpNotificationsView = '/pop-up-notifications-view';
  static const String pinnedMessages = '/pinned-messages';
  static const String addWorkspaceView = '/add-workspace-view';
  static const String createWorkSpace = '/create-work-space';
  static const String fileSearchView = '/file-search-view';
  static const String draftView = '/draft-view';
  static const String workspaceUrlView = '/workspace-url-view';
  static const all = <String>{
    channelAddPeopleView,
    navBarView,
    onboardingView,
    loginView,
    oTPView,
    signUpView,
    workspaceView,
    channelList,
    forgotPasswordEmailView,
    forgotPasswordOtpView,
    forgotPasswordNewView,
    channelNotificationView,
    newChannel,
    channelInfoView,
    homePage,
    addPeopleView,
    channelPageView,
    dmSearch,
    dmJumpToView,
    dmUserView,
    splashview,
    pluginView,
    addPluginView,
    useDifferentEmailView,
    editPluginView,
    viewProfile,
    setStatusView,
    profilePageView,
    preferenceView,
    languageAndRegionModelView,
    savedItemsView,
    notificationsView,
    advancedView,
    clearAfterView,
    doNotDisturbView,
    editProfileView,
    popUpNotificationsView,
    pinnedMessages,
    addWorkspaceView,
    createWorkSpace,
    fileSearchView,
    draftView,
    workspaceUrlView,
  };
}

class StackedRouter extends RouterBase {
  @override
  List<RouteDef> get routes => _routes;
  final _routes = <RouteDef>[
    RouteDef(Routes.channelAddPeopleView, page: ChannelAddPeopleView),
    RouteDef(Routes.navBarView, page: NavBarView),
    RouteDef(Routes.onboardingView, page: OnboardingView),
    RouteDef(Routes.loginView, page: LoginView),
    RouteDef(Routes.oTPView, page: OTPView),
    RouteDef(Routes.signUpView, page: SignUpView),
    RouteDef(Routes.workspaceView, page: WorkspaceView),
    RouteDef(Routes.channelList, page: ChannelList),
    RouteDef(Routes.forgotPasswordEmailView, page: ForgotPasswordEmailView),
    RouteDef(Routes.forgotPasswordOtpView, page: ForgotPasswordOtpView),
    RouteDef(Routes.forgotPasswordNewView, page: ForgotPasswordNewView),
    RouteDef(Routes.channelNotificationView, page: ChannelNotificationView),
    RouteDef(Routes.newChannel, page: NewChannel),
    RouteDef(Routes.channelInfoView, page: ChannelInfoView),
    RouteDef(Routes.homePage, page: HomePage),
    RouteDef(Routes.addPeopleView, page: AddPeopleView),
    RouteDef(Routes.channelPageView, page: ChannelPageView),
    RouteDef(Routes.dmSearch, page: DmSearch),
    RouteDef(Routes.dmJumpToView, page: DmJumpToView),
    RouteDef(Routes.dmUserView, page: DmUserView),
    RouteDef(Routes.splashview, page: Splashview),
    RouteDef(Routes.pluginView, page: PluginView),
    RouteDef(Routes.addPluginView, page: AddPluginView),
    RouteDef(Routes.useDifferentEmailView, page: UseDifferentEmailView),
    RouteDef(Routes.editPluginView, page: EditPluginView),
    RouteDef(Routes.viewProfile, page: ViewProfile),
    RouteDef(Routes.setStatusView, page: SetStatusView),
    RouteDef(Routes.profilePageView, page: ProfilePageView),
    RouteDef(Routes.preferenceView, page: PreferenceView),
    RouteDef(Routes.languageAndRegionModelView,
        page: LanguageAndRegionModelView),
    RouteDef(Routes.savedItemsView, page: SavedItemsView),
    RouteDef(Routes.notificationsView, page: NotificationsView),
    RouteDef(Routes.advancedView, page: AdvancedView),
    RouteDef(Routes.clearAfterView, page: ClearAfterView),
    RouteDef(Routes.doNotDisturbView, page: DoNotDisturbView),
    RouteDef(Routes.editProfileView, page: EditProfileView),
    RouteDef(Routes.popUpNotificationsView, page: PopUpNotificationsView),
    RouteDef(Routes.pinnedMessages, page: PinnedMessages),
    RouteDef(Routes.addWorkspaceView, page: AddWorkspaceView),
    RouteDef(Routes.createWorkSpace, page: CreateWorkSpace),
    RouteDef(Routes.fileSearchView, page: FileSearchView),
    RouteDef(Routes.draftView, page: DraftView),
    RouteDef(Routes.workspaceUrlView, page: WorkspaceUrlView),
  ];
  @override
  Map<Type, StackedRouteFactory> get pagesMap => _pagesMap;
  final _pagesMap = <Type, StackedRouteFactory>{
    ChannelAddPeopleView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const ChannelAddPeopleView(),
        settings: data,
      );
    },
    NavBarView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const NavBarView(),
        settings: data,
      );
    },
    OnboardingView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const OnboardingView(),
        settings: data,
      );
    },
    LoginView: (data) {
      var args = data.getArgs<LoginViewArguments>(
        orElse: () => LoginViewArguments(),
      );
      return MaterialPageRoute<dynamic>(
        builder: (context) => LoginView(key: args.key),
        settings: data,
      );
    },
    OTPView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const OTPView(),
        settings: data,
      );
    },
    SignUpView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const SignUpView(),
        settings: data,
      );
    },
    WorkspaceView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const WorkspaceView(),
        settings: data,
      );
    },
    ChannelList: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const ChannelList(),
        settings: data,
      );
    },
    ForgotPasswordEmailView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const ForgotPasswordEmailView(),
        settings: data,
      );
    },
    ForgotPasswordOtpView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const ForgotPasswordOtpView(),
        settings: data,
      );
    },
    ForgotPasswordNewView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const ForgotPasswordNewView(),
        settings: data,
      );
    },
    ChannelNotificationView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => ChannelNotificationView(),
        settings: data,
      );
    },
    NewChannel: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const NewChannel(),
        settings: data,
      );
    },
    ChannelInfoView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const ChannelInfoView(),
        settings: data,
      );
    },
    HomePage: (data) {
      var args = data.getArgs<HomePageArguments>(
        orElse: () => HomePageArguments(),
      );
      return MaterialPageRoute<dynamic>(
        builder: (context) => HomePage(key: args.key),
        settings: data,
      );
    },
    AddPeopleView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => AddPeopleView(),
        settings: data,
      );
    },
    ChannelPageView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const ChannelPageView(),
        settings: data,
      );
    },
    DmSearch: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const DmSearch(),
        settings: data,
      );
    },
    DmJumpToView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const DmJumpToView(),
        settings: data,
      );
    },
    DmUserView: (data) {
      var args = data.getArgs<DmUserViewArguments>(
        orElse: () => DmUserViewArguments(),
      );
      return MaterialPageRoute<dynamic>(
        builder: (context) => DmUserView(key: args.key),
        settings: data,
      );
    },
    Splashview: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const Splashview(),
        settings: data,
      );
    },
    PluginView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const PluginView(),
        settings: data,
      );
    },
    AddPluginView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const AddPluginView(),
        settings: data,
      );
    },
    UseDifferentEmailView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const UseDifferentEmailView(),
        settings: data,
      );
    },
    EditPluginView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const EditPluginView(),
        settings: data,
      );
    },
    ViewProfile: (data) {
      var args = data.getArgs<ViewProfileArguments>(
        orElse: () => ViewProfileArguments(),
      );
      return MaterialPageRoute<dynamic>(
        builder: (context) => ViewProfile(
          key: args.key,
          isActive: args.isActive,
        ),
        settings: data,
      );
    },
    SetStatusView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => SetStatusView(),
        settings: data,
      );
    },
    ProfilePageView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const ProfilePageView(),
        settings: data,
      );
    },
    PreferenceView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const PreferenceView(),
        settings: data,
      );
    },
    LanguageAndRegionModelView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const LanguageAndRegionModelView(),
        settings: data,
      );
    },
    SavedItemsView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const SavedItemsView(),
        settings: data,
      );
    },
    NotificationsView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const NotificationsView(),
        settings: data,
      );
    },
    AdvancedView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const AdvancedView(),
        settings: data,
      );
    },
    ClearAfterView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const ClearAfterView(),
        settings: data,
      );
    },
    DoNotDisturbView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const DoNotDisturbView(),
        settings: data,
      );
    },
    EditProfileView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const EditProfileView(),
        settings: data,
      );
    },
    PopUpNotificationsView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const PopUpNotificationsView(),
        settings: data,
      );
    },
    PinnedMessages: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const PinnedMessages(),
        settings: data,
      );
    },
    AddWorkspaceView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const AddWorkspaceView(),
        settings: data,
      );
    },
    CreateWorkSpace: (data) {
      var args = data.getArgs<CreateWorkSpaceArguments>(nullOk: false);
      return MaterialPageRoute<dynamic>(
        builder: (context) => CreateWorkSpace(
          key: args.key,
          method: args.method,
        ),
        settings: data,
      );
    },
    FileSearchView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const FileSearchView(),
        settings: data,
      );
    },
    DraftView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const DraftView(),
        settings: data,
      );
    },
    WorkspaceUrlView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const WorkspaceUrlView(),
        settings: data,
      );
    },
  };
}

/// ************************************************************************
/// Arguments holder classes
/// *************************************************************************

/// LoginView arguments holder class
class LoginViewArguments {
  final Key? key;
  LoginViewArguments({this.key});
}

/// HomePage arguments holder class
class HomePageArguments {
  final Key? key;
  HomePageArguments({this.key});
}

/// DmUserView arguments holder class
class DmUserViewArguments {
  final Key? key;
  DmUserViewArguments({this.key});
}

/// ViewProfile arguments holder class
class ViewProfileArguments {
  final Key? key;
  final bool isActive;
  ViewProfileArguments({this.key, this.isActive = true});
}

/// CreateWorkSpace arguments holder class
class CreateWorkSpaceArguments {
  final Key? key;
  final WorkspaceSwitchMethod method;
  CreateWorkSpaceArguments({this.key, required this.method});
}
