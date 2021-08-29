import 'package:flutter/material.dart';

import 'app_routing/app_navigator.dart';
import 'app_routing/app_router.dart';
import 'views/home/home_view.dart';

void main() => runApp(MyApp());

// ignore: use_key_in_widget_constructors
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: AppNavigator.key,
      onGenerateRoute: AppRouter.generateRoute,
      title: 'ZuriChat App',
      home: const HomeView(),
    );
  }
}
