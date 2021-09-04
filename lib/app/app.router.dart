// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedRouterGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

<<<<<<< HEAD
import '../ui/view/channel/channels_view.dart';
import '../ui/view/home/home_view.dart';
=======
>>>>>>> df4d1955f3466c2d4ec7ff4f61ac9cdb746454a0
import '../ui/view/login/login_view.dart';
import '../ui/view/nav_bar/nav_bar_view.dart';
import '../ui/view/preference/preference_view.dart';
import '../ui/view/workspace/workspace_view.dart';

class Routes {
  static const String navBarView = '/';
  static const String loginView = '/login-view';
<<<<<<< HEAD
  static const String channelList = '/channel-list';
=======
  static const String preferenceView = '/preference-view';
  static const String workspaceView = '/workspace-view';
>>>>>>> df4d1955f3466c2d4ec7ff4f61ac9cdb746454a0
  static const all = <String>{
    navBarView,
    loginView,
<<<<<<< HEAD
    channelList,
=======
    preferenceView,
    workspaceView,
>>>>>>> df4d1955f3466c2d4ec7ff4f61ac9cdb746454a0
  };
}

class StackedRouter extends RouterBase {
  @override
  List<RouteDef> get routes => _routes;
  final _routes = <RouteDef>[
    RouteDef(Routes.navBarView, page: NavBarView),
    RouteDef(Routes.loginView, page: LoginView),
<<<<<<< HEAD
    RouteDef(Routes.channelList, page: ChannelList),
=======
    RouteDef(Routes.preferenceView, page: PreferenceView),
    RouteDef(Routes.workspaceView, page: WorkspaceView),
>>>>>>> df4d1955f3466c2d4ec7ff4f61ac9cdb746454a0
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
    ChannelList: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const ChannelList(),
=======
    PreferenceView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const PreferenceView(),
        settings: data,
      );
    },
    WorkspaceView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const WorkspaceView(),
>>>>>>> df4d1955f3466c2d4ec7ff4f61ac9cdb746454a0
        settings: data,
      );
    },
  };
}
