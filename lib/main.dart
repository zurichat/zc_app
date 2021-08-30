import 'package:flutter/material.dart';
import 'package:stacked_services/stacked_services.dart';
import 'ui/views/home/home_view.dart';

void main() => runApp(MyApp());

// ignore: use_key_in_widget_constructors
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: StackedService.navigatorKey,
      // onGenerateRoute: StackedRouter().onGenerateRoute,
      title: 'ZuriChat App',
      home: const HomeView(),
    );
  }
}
