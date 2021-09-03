import 'package:flutter/material.dart';
import 'package:hng/app/app.locator.dart';
import 'package:stacked_services/stacked_services.dart';

import 'app/app.router.dart';
import '../../app_routing/app_navigator.dart';
import '../../ui/home/home_view.dart';


void main() {
  setupLocator();
  runApp(MyApp());
}

// ignore: use_key_in_widget_constructors
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      navigatorKey: StackedService.navigatorKey,
      onGenerateRoute: StackedRouter().onGenerateRoute,
      title: 'ZuriChat App',
      initialRoute: Routes.homeView,
    );
  }
}
