// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedRouterGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';
import 'package:hng/ui/clear_notification/widgets/clear_notification_view.dart';
import 'package:hng/ui/home/home_view.dart';
import 'package:hng/ui/login/login_view.dart';
import 'package:stacked/stacked.dart';

class Routes {
  static const String loginView = '/login-view';
  static const String homeView = '/home-view';
  static const String clearNotificationView = '/clear-notification';
  static const all = <String>{loginView, homeView, clearNotificationView};
}

class StackedRouter extends RouterBase {
  @override
  List<RouteDef> get routes => _routes;
  final _routes = <RouteDef>[
    RouteDef(Routes.loginView, page: LoginView),
    RouteDef(Routes.homeView, page: HomeView),
    RouteDef(Routes.homeView, page: ClearNotificationView),
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
    ClearNotificationView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => ClearNotificationView(),
        settings: data,
      );
    }
  };
}
