// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedRouterGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../ui/view/dm_chat_view/dm_jump_to_view.dart';
import '../ui/view/login/login_view.dart';
import '../ui/view/nav_bar/nav_bar_view.dart';
import '../ui/view/preference/preference_view.dart';
import '../ui/view/workspace/workspace_view.dart';

class Routes {
  static const String navBarView = '/';
  static const String loginView = '/login-view';
  static const String preferenceView = '/preference-view';
  static const String workspaceView = '/workspace-view';
  static const String dmJumpToView = '/dm-jump-to-view';
  static const all = <String>{
    navBarView,
    loginView,
    preferenceView,
    workspaceView,
    dmJumpToView,
  };
}

class StackedRouter extends RouterBase {
  @override
  List<RouteDef> get routes => _routes;
  final _routes = <RouteDef>[
    RouteDef(Routes.navBarView, page: NavBarView),
    RouteDef(Routes.loginView, page: LoginView),
    RouteDef(Routes.preferenceView, page: PreferenceView),
    RouteDef(Routes.workspaceView, page: WorkspaceView),
    RouteDef(Routes.dmJumpToView, page: DmJumpToView),
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
    PreferenceView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const PreferenceView(),
        settings: data,
      );
    },
    WorkspaceView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const WorkspaceView(),
        settings: data,
      );
    },
    DmJumpToView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const DmJumpToView(),
        settings: data,
      );
    },
  };
}
