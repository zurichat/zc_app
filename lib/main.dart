import 'package:flutter/material.dart';
import 'package:hng/views/home/home_view.dart';

import 'app_routing/app_navigator.dart';
import 'app_routing/app_router.dart';

void main() => runApp(MyApp());

// ignore: use_key_in_widget_constructors
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      navigatorKey: AppNavigator.key,
      onGenerateRoute: AppRouter.generateRoute,
      title: 'ZuriChat App',
      home: HomeView(),
    );
  }
}
