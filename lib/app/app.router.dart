// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedRouterGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../ui/view/create_channel_view/create_channel_view.dart';
import '../ui/view/home/home_view.dart';
import '../ui/view/login/login_view.dart';

class Routes {
  static const String homeView = '/';
  static const String loginView = '/login-view';
  static const String createChannelView = '/create-channel-view';
  static const all = <String>{
    homeView,
    loginView,
    createChannelView,
  };
}

class StackedRouter extends RouterBase {
  @override
  List<RouteDef> get routes => _routes;
  final _routes = <RouteDef>[
    RouteDef(Routes.homeView, page: HomeView),
    RouteDef(Routes.loginView, page: LoginView),
    RouteDef(Routes.createChannelView, page: CreateChannelView),
  ];
  @override
  Map<Type, StackedRouteFactory> get pagesMap => _pagesMap;
  final _pagesMap = <Type, StackedRouteFactory>{
    HomeView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const HomeView(),
        settings: data,
      );
    },
    LoginView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const LoginView(),
        settings: data,
      );
    },
    CreateChannelView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => CreateChannelView(),
        settings: data,
      );
    },
  };
}
