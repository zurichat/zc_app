import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../main.dart';
import 'route_names.dart';

class AppRouter {
  ///Build a MaterialPageRoute with the provided [page] widget and return it.
  static Route _materialPageRoute(Widget page) =>
      MaterialPageRoute(builder: (_) => page);

  ///Build a CupetinoPageRoute with the provided [page] widget and return it.
  static Route _cupertinoPageRoute(Widget page) =>
      CupertinoPageRoute(builder: (_) => page);

  ///Check route name and return corresponding Route.
  ///Used for `OnGenerateRoute` in *main.dart*
  static Route generateRoute(RouteSettings settings) {
    switch (settings.name) {

      //*! Launch and Onboarding Routing _______________________________________
      case splashViewRoute:
        return _materialPageRoute(SplashView());
      //*! Authentication Routing ______________________________________________

      //*! Dashboard Routing ______________________________________________

      //*! Settings Routing _________________________________________________

      //*! News and Videos Routing _____________________________________________

      //* Bad route - Route not found page
      default:
        return _cupertinoPageRoute(
          Scaffold(
            body: Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Error 404.'
                  'The route - ${settings.name} - you requested does not exist',
                  style: const TextStyle(
                    fontSize: 24,
                    color: Colors.black,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ),
            ),
          ),
        );
    }
  }
}
