// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedRouterGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';
import '../ui/view/password_recovery/recovery_view.dart';
import '../ui/view/plugins/add_plugin_view.dart';
import '../ui/view/plugins/edit_plugin_view.dart';
import '../ui/view/plugins/plugins_view.dart';
import '../ui/view/splashscreen/splashscreen.dart';
import 'package:stacked/stacked.dart';

import '../ui/profile_page/profile_page_view.dart';
import '../ui/view/channel/channel_page_view.dart';
import '../ui/view/channel/channels_view.dart';
import '../ui/view/channel/new_channel/new_channel.dart';
import '../ui/view/channel_info/channel_info_view.dart';
import '../ui/view/channel_notification/channel_notification_view.dart';
import '../ui/view/dm_chat_view/dm_jump_to_view.dart';
import '../ui/view/dm_search/dm_search_view.dart';
import '../ui/view/dm_user/dm_user_view.dart';
import '../ui/view/login/login_view.dart';
import '../ui/view/nav_bar/nav_bar_view.dart';
import '../ui/view/onboarding/onboading_view.dart';
import '../ui/view/otp/otp_view.dart';
import '../ui/view/popup_notification/popup_notification.dart';
import '../ui/view/preference/preference_view.dart';
import '../ui/view/sign_up/sign_up_view.dart';
import '../ui/view/workspace/create_workspace/create_workspace.dart';
import '../ui/view/workspace/workspace_different_email/difference_email_workspace_view.dart';
import '../ui/view/workspace/workspace_view.dart';

class Routes {
  static const String loginView = '/login-view';
  static const String otpView = '/otp-view';
  static const String channelView = '/channel-view';
  static const String navBarView = '/nav-bar-view';
  static const String onboardingView = '/';
  static const String preferenceView = '/preference-view';
  static const String channelInfoView = '/channel-info-view';
  static const String channelPageView = '/channel-page-view';
  static const String dmSearch = '/dm-search';
  static const String workspaceView = '/workspace-view';
  static const String dmJumpToView = '/dm-jump-to-view';
  static const String useDifferentEmailView = '/use-different-email-view';
  static const String newChannel = '/newChannel-view';
  static const String signUpView = '/sign-up-view';
  static const String splashView = '/splash-view';
  static const String popupView = '/popup-view';

  static const String createWorkSpace = '/create-work-space';

  static const String channelList = '/channel-list';
  static const String forgotPasswordView = '/forgot-password-view';
  static const String channelNotificationView = '/channel-notification-view';

  static const String dmUserView = '/dm-user-view';
  static const String pluginView = '/plugin-view';
  static const String addPluginView = '/add-plugin-view';
  static const String editPluginView = '/edit-plugin-view';

  static const all = <String>{
    loginView,
    createWorkSpace,
    otpView,
    navBarView,
    onboardingView,
    preferenceView,
    signUpView,
    workspaceView,
    dmJumpToView,
    newChannel,
    channelView,
    channelInfoView,
    channelPageView,
    dmSearch,
    channelList,
    forgotPasswordView,
    channelNotificationView,
    dmUserView,
    splashView,
    pluginView,
    addPluginView,
    editPluginView,
  };
}

class StackedRouter extends RouterBase {
  @override
  List<RouteDef> get routes => _routes;
  final _routes = <RouteDef>[
    RouteDef(Routes.loginView, page: LoginView),
    RouteDef(Routes.otpView, page: OtpView),
    RouteDef(Routes.forgotPasswordView, page: ForgotPassView),
    RouteDef(Routes.channelView, page: ChannelPageView),
    RouteDef(Routes.navBarView, page: NavBarView),
    RouteDef(Routes.onboardingView, page: OnboardingView),
    RouteDef(Routes.preferenceView, page: PreferenceView),
    RouteDef(Routes.channelInfoView, page: ChannelInfoView),
    RouteDef(Routes.channelPageView, page: ChannelPageView),
    RouteDef(Routes.dmSearch, page: DmSearch),
    RouteDef(Routes.workspaceView, page: WorkspaceView),
    RouteDef(Routes.dmJumpToView, page: DmJumpToView),
    RouteDef(Routes.useDifferentEmailView, page: UseDifferentEmailView),
    RouteDef(Routes.workspaceView, page: WorkspaceView),
    RouteDef(Routes.signUpView, page: SignUpView),
    RouteDef(Routes.splashView, page: Splashview),
    RouteDef(Routes.newChannel, page: NewChannel),
    RouteDef(Routes.channelInfoView, page: ChannelInfoView),
    RouteDef(Routes.dmUserView, page: DmUserView),
    RouteDef(Routes.popupView, page: PopUpNotificationsView),
    RouteDef(Routes.channelList, page: ChannelList),
    RouteDef(Routes.createWorkSpace, page: CreateWorkSpace),
    RouteDef(Routes.otpView, page: OtpView),
    RouteDef(Routes.channelView, page: ChannelPageView),
    RouteDef(Routes.navBarView, page: NavBarView),
    RouteDef(Routes.onboardingView, page: OnboardingView),
    RouteDef(Routes.preferenceView, page: PreferenceView),
    RouteDef(Routes.signUpView, page: SignUpView),
    RouteDef(Routes.preferenceView, page: PreferenceView),
    RouteDef(Routes.signUpView, page: SignUpView),
    RouteDef(Routes.useDifferentEmailView, page: UseDifferentEmailView),
    RouteDef(Routes.workspaceView, page: WorkspaceView),
    RouteDef(Routes.pluginView, page: PluginView),
    RouteDef(Routes.addPluginView, page: AddPluginView),
    RouteDef(Routes.editPluginView, page: EditPluginView),
    RouteDef(Routes.channelNotificationView, page: ChannelNotificationView),
    RouteDef(Routes.newChannel, page: NewChannel),
    RouteDef(Routes.channelInfoView, page: ChannelInfoView),
    RouteDef(Routes.dmUserView, page: DmUserView),
  ];
  @override
  Map<Type, StackedRouteFactory> get pagesMap => _pagesMap;
  final _pagesMap = <Type, StackedRouteFactory>{
    LoginView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const LoginView(),
        settings: data,
      );
    },
    NavBarView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const NavBarView(),
        settings: data,
      );
    },
    Splashview: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const Splashview(),
        settings: data,
      );
    },
    OnboardingView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const OnboardingView(),
        settings: data,
      );
    },
    PreferenceView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const PreferenceView(),
        settings: data,
      );
    },
    ChannelInfoView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const ChannelInfoView(),
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
    EditPluginView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const EditPluginView(),
        settings: data,
      );
    },
    DmJumpToView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const DmJumpToView(),
        settings: data,
      );
    },
    ChannelList: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const ChannelList(),
        settings: data,
      );
    },
    CreateWorkSpace: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => CreateWorkSpace(),
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
    DmUserView: (data) {
      final args = data.getArgs<DmUserViewArguments>(
        orElse: () => DmUserViewArguments(),
      );
      return MaterialPageRoute<dynamic>(
        builder: (context) => DmUserView(key: args.key),
        settings: data,
      );
    },
    PopUpNotificationsView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const PopUpNotificationsView(),
        settings: data,
      );
    },
    ForgotPassView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const ForgotPassView(),
        settings: data,
      );
    },
    ProfilePageView: (data) {
      final args = data.getArgs<ProfilePageViewArguments>(
        orElse: () => ProfilePageViewArguments(),
      );
      return MaterialPageRoute<dynamic>(
        builder: (context) => ProfilePageView(key: args.key),
        settings: data,
      );
    },
  };
}

/// ************************************************************************
/// Arguments holder classes
/// *************************************************************************

/// DmUserView arguments holder class
class DmUserViewArguments {
  final Key? key;
  DmUserViewArguments({this.key});
}

class ProfilePageViewArguments {
  final Key? key;
  ProfilePageViewArguments({this.key});
}
