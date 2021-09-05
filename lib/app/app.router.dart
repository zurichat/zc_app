// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedRouterGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../ui/nav_pages/home_page/home_page.dart';
import '../ui/view/add_people/add_people_view.dart';
import '../ui/view/channel/new_channel/new_channel.dart';
import '../ui/view/channel_info/channel_info_view.dart';
import '../ui/view/login/login_view.dart';
import '../ui/view/nav_bar/nav_bar_view.dart';
import '../ui/view/onboarding/onboading_view.dart';
import '../ui/view/otp/otp_view.dart';
import '../ui/view/preference/preference_view.dart';
import '../ui/view/sign_up/sign_up_view.dart';
import '../ui/view/workspace/workspace_view.dart';

class Routes {
  static const String loginView = '/login-view';
  static const String navBarView = '/nav-bar-view';
  static const String onboardingView = '/onboarding-view';
  static const String preferenceView = '/preference-view';
  static const String loginView = '/login-view';
  static const String otpView = '/otp-view';
  static const String signUpView = '/sign-up-view';
  static const String workspaceView = '/workspace-view';
  static const String newChannel = '/new-channel';
  static const String channelInfoView = '/channel-info-view';
  static const String homePage = '/home-page';
  static const String addPeopleView = '/';
  static const all = <String>{
    loginView,
    navBarView,
    onboardingView,
    preferenceView,
    otpView,
    signUpView,
    workspaceView,
    newChannel,
    channelInfoView,
    homePage,
    addPeopleView,
  };
}

class StackedRouter extends RouterBase {
  @override
  List<RouteDef> get routes => _routes;
  final _routes = <RouteDef>[
    RouteDef(Routes.loginView, page: LoginView),
    RouteDef(Routes.navBarView, page: NavBarView),
    RouteDef(Routes.onboardingView, page: OnboardingView),
    RouteDef(Routes.preferenceView, page: PreferenceView),
    RouteDef(Routes.loginView, page: LoginView),
    RouteDef(Routes.otpView, page: OtpView),
    RouteDef(Routes.signUpView, page: SignUpView),
    RouteDef(Routes.workspaceView, page: WorkspaceView),
    RouteDef(Routes.newChannel, page: NewChannel),
    RouteDef(Routes.channelInfoView, page: ChannelInfoView),
    RouteDef(Routes.homePage, page: HomePage),
    RouteDef(Routes.addPeopleView, page: AddPeopleView),
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
    PreferenceView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const PreferenceView(),
        settings: data,
      );
    },
    OtpView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const OtpView(),
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
      return MaterialPageRoute<dynamic>(
        builder: (context) => HomePage(),
        settings: data,
      );
    },
    AddPeopleView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => AddPeopleView(),
        settings: data,
      );
    },
  };
}
