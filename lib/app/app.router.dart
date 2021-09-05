// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedRouterGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../ui/add_people/add_people_view.dart';
import '../ui/view/channel_info/channel_info_view.dart';
import '../ui/view/login/login_view.dart';
import '../ui/view/nav_bar/nav_bar_view.dart';
import '../ui/view/onboarding/onboading_view.dart';
import '../ui/view/preference/preference_view.dart';

class Routes {
  static const String loginView = '/login-view';
  static const String navBarView = '/nav-bar-view';
  static const String onboardingView = '/onboarding-view';
  static const String preferenceView = '/preference-view';
  static const String channelInfoView = '/channel-info-view';
  static const String addPeopleView = '/';
  static const all = <String>{
    loginView,
    navBarView,
    onboardingView,
    preferenceView,
    channelInfoView,
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
    RouteDef(Routes.channelInfoView, page: ChannelInfoView),
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
    ChannelInfoView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const ChannelInfoView(),
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
