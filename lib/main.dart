import 'package:flutter/material.dart';

import 'app_routing/app_navigator.dart';
import 'app_routing/app_router.dart';
import 'app_routing/route_names.dart';

void main() => runApp(MyApp());

// ignore: use_key_in_widget_constructors
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: AppNavigator.key,
      onGenerateRoute: AppRouter.generateRoute,
      title: 'ZuriChat App',
      home: Home(),
    );
  }
}

// ignore: use_key_in_widget_constructors
class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          AppNavigator.pushNamed(splashViewRoute);
        },
      ),
      body: const Center(child: Text('Home')),
    );
  }
}

// ignore: use_key_in_widget_constructors
class SplashView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text('Feed:')),
    );
  }
}
