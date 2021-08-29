import 'package:flutter/material.dart';

export 'package:hng/app_routing/route_names.dart';

class AppNavigator {
  AppNavigator._();
  static final key = GlobalKey<NavigatorState>();

  static Future push(Widget page, context) {
    return Navigator.push(
      context,
      MaterialPageRoute(builder: (context) {
        return page;
      }),
    );
  }

  static Future pushNamed(String route, {arguments}) {
    return key.currentState!.pushNamed(route, arguments: arguments);
  }

  static Future pushReplacement(Widget page) {
    return key.currentState!.pushReplacement(
      MaterialPageRoute(builder: (_) => page),
    );
  }

  static Future pushNamedReplacement(String route, {arguments}) {
    return key.currentState!.pushReplacementNamed(route, arguments: arguments);
  }

  static Future pushAndClear(Widget page) {
    return key.currentState!.pushAndRemoveUntil(
      MaterialPageRoute(builder: (_) => page),
      (route) => false,
    );
  }

  static Future pushNamedAndClear(String route, {arguments}) {
    return key.currentState!.pushNamedAndRemoveUntil(
      route,
      (route) => false,
      arguments: arguments,
    );
  }

  static void pop([result]) {
    return key.currentState!.pop(result);
  }

  // static Future showLoadingIndicator() {
  //   return showDialog(
  //     context: key.currentContext!,
  //     barrierDismissible: false,
  //     builder: (_) => const AppLoadingIndicator(),
  //   );
  // }
}
