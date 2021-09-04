// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedRouterGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../ui/home/home_view.dart';
import '../ui/login/login_view.dart';
import '../ui/profile_page/profile_page_view.dart';

class Routes {
  static const String loginView = '/login-view';
  static const String homeView = '/home-view';
  static const String profilePageView = '/profile-page-view';
  static const all = <String>{
    loginView,
    homeView,
    profilePageView,
  };
}

class StackedRouter extends RouterBase {
  @override
  List<RouteDef> get routes => _routes;
  final _routes = <RouteDef>[
    RouteDef(Routes.loginView, page: LoginView),
    RouteDef(Routes.homeView, page: HomeView),
    RouteDef(Routes.profilePageView, page: ProfilePageView),
  ];
  @override
  Map<Type, StackedRouteFactory> get pagesMap => _pagesMap;
  final _pagesMap = <Type, StackedRouteFactory>{
    LoginView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => LoginView(),
        settings: data,
      );
    },
    HomeView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => HomeView(),
        settings: data,
      );
    },
    ProfilePageView: (data) {
      var args = data.getArgs<ProfilePageViewArguments>(
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

/// ProfilePageView arguments holder class
class ProfilePageViewArguments {
  final Key? key;
  ProfilePageViewArguments({this.key});
}
