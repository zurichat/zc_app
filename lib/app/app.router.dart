// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedRouterGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';

import 'package:hng/ui/view/popup_notification/popup_notification.dart';

import 'package:stacked/stacked.dart';

import '../ui/view/channel_notification/channel_notification_view.dart';
import '../ui/view/channel_info/channel_info_view.dart';
import '../ui/view/login/login_view.dart';

import '../ui/view/workspace/create_workspace/create_workspace.dart';
import '../ui/view/otp/otp_view.dart';
import '../ui/view/nav_bar/nav_bar_view.dart';
import '../ui/view/onboarding/onboading_view.dart';
import '../ui/view/preference/preference_view.dart';

import '../ui/view/workspace/workspace_different_email/difference_email_workspace_view.dart';

import '../ui/view/workspace/workspace_view.dart';
import '../ui/view/sign_up/sign_up_view.dart';


class Routes {
  static const String loginView = '/login-view';



  static const String popupView = '/popup-view';
  static const String createWorkSpace = '/create-work-space';
  static const String otpView = '/otp-view';
  static const String channelView = '/channel-view';
  static const String navBarView = '/nav-bar-view';
  static const String onboardingView = '/';
  static const String preferenceView = '/preference-view';
  static const String useDifferentEmailView = '/use-different-email-view';
  static const String workspaceView = '/workspace-view';
  static const String forgotPasswordView = '/forgot-password-view';
  static const String channelNotificationView = '/channel-notification-view';
  static const String signUpView = '/sign-up-view';
  static const String newChannel = '/newChannel-view';
  static const String channelInfoView = '/channel-info-view';
  static const all = <String>{
    loginView,
    createWorkSpace,
    otpView,
    navBarView,
    onboardingView,
    preferenceView,
    useDifferentEmailView,
    workspaceView,
    forgotPasswordView,
    channelNotificationView,

    signUpView,

    newChannel,
    channelView,
    channelInfoView,

  };
}

class StackedRouter extends RouterBase {
  @override
  List<RouteDef> get routes => _routes;
  final _routes = <RouteDef>[
    RouteDef(Routes.loginView, page: LoginView),


    RouteDef(Routes.popupView, page: PopUpNotificationsView),


    RouteDef(Routes.createWorkSpace, page: CreateWorkSpace),
    RouteDef(Routes.otpView, page: OtpView),
    RouteDef(Routes.channelView, page: ChannelPageView)
    RouteDef(Routes.navBarView, page: NavBarView),
    RouteDef(Routes.onboardingView, page: OnboardingView),


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
    OnboardingView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const OnboardingView(),
        settings: data,
      );
    },
    ChannelPageView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const ChannelPageView(),

    PreferenceView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const PreferenceView(),
        settings: data,
      );
    },

     UseDifferentEmailView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const UseDifferentEmailView(),
settings: data,
        );
     },
    
    WorkspaceView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const WorkspaceView(),
        settings: data,
      );
    },
        
    CreateWorkSpace: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => CreateWorkSpace(),
        
    ChannelNotificationView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => ChannelNotificationView(),


     SignUpView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) =>  SignUpView(),

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
    OtpView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const OtpView(),
        settings: data,
      );
    },
    PopUpNotificationsView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const PopUpNotificationsView(),
        settings: data,
      );
    },
  };
}
