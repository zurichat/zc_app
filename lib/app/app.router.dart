// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedRouterGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';
import 'package:hng/ui/nav_pages/members_page/members_page_view.dart';
import 'package:stacked/stacked.dart';

import '../ui/members_page/members_page_view.dart';
import '../ui/view/login/login_view.dart';
import '../ui/view/nav_bar/nav_bar_view.dart';
import '../ui/view/preference/preference_view.dart';
import '../ui/view/workspace/workspace_view.dart';

class Routes {
  static const String navBarView = '/';
  static const String loginView = '/login-view';
  static const String preferenceView = '/preference-view';
  static const String membersPageView = '/members-page-view';
  static const String workspaceView = '/workspace-view';
  static const all = <String>{
    navBarView,
    loginView,
    preferenceView,
    membersPageView,
    workspaceView,
  };
}

class StackedRouter extends RouterBase {
  @override
  List<RouteDef> get routes => _routes;
  final _routes = <RouteDef>[
    RouteDef(Routes.navBarView, page: NavBarView),
    RouteDef(Routes.loginView, page: LoginView),
    RouteDef(Routes.preferenceView, page: PreferenceView),
    RouteDef(Routes.membersPageView, page: MembersPageView),
    RouteDef(Routes.workspaceView, page: WorkspaceView),
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
    MembersPageView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const MembersPageView(),
        settings: data,
      );
    },
    WorkspaceView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const WorkspaceView(),
        settings: data,
      );
    },
  };
}
