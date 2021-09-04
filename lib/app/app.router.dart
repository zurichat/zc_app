// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedRouterGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';
import 'package:hng/ui/view/channel/channel_page_view.dart';
import 'package:stacked/stacked.dart';

import '../ui/view/login/login_view.dart';
import '../ui/view/nav_bar/nav_bar_view.dart';
import '../ui/view/preference/preference_view.dart';

class Routes {
  static const String navBarView = '/';
  static const String loginView = '/login-view';
<<<<<<< HEAD
  static const String channelView = '/channel-view';
=======
  static const String preferenceView = '/preference-view';
>>>>>>> 654696ecab2c4a65ae6a9053d65d2c8bf559e63b
  static const all = <String>{
    navBarView,
    loginView,
    preferenceView,
  };
}

class StackedRouter extends RouterBase {
  @override
  List<RouteDef> get routes => _routes;
  final _routes = <RouteDef>[
    RouteDef(Routes.navBarView, page: NavBarView),
    RouteDef(Routes.loginView, page: LoginView),
<<<<<<< HEAD
    RouteDef(Routes.channelView, page: ChannelPageView)
=======
    RouteDef(Routes.preferenceView, page: PreferenceView),
>>>>>>> 654696ecab2c4a65ae6a9053d65d2c8bf559e63b
  ];
  @override
  Map<Type, StackedRouteFactory> get pagesMap => _pagesMap;
  final _pagesMap = <Type, StackedRouteFactory>{
    NavBarView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const NavBarView(),
        settings: data,
      );
    },
    LoginView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const LoginView(),
        settings: data,
      );
    },
<<<<<<< HEAD
    ChannelPageView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const ChannelPageView(),
=======
    PreferenceView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const PreferenceView(),
>>>>>>> 654696ecab2c4a65ae6a9053d65d2c8bf559e63b
        settings: data,
      );
    },
  };
}
