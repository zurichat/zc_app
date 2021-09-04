import 'package:flutter/material.dart';
import 'package:hng/utilities/constants/styles.dart';
import 'package:stacked_themes/stacked_themes.dart';
import 'app_routing/app_navigator.dart';
import 'app_routing/app_router.dart';
import 'views/home/home_view.dart';

//=>
void main() async {
  await ThemeManager.initialise();
  runApp(MyApp());
}

// ignore: use_key_in_widget_constructors
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ThemeBuilder(
      defaultThemeMode: ThemeMode.light,
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        backgroundColor: Colors.black12,
        accentColor: greenColor,
      ),
      lightTheme: ThemeData(
        brightness: Brightness.light,
        backgroundColor: Colors.white,
        accentColor: greenColor,
        scaffoldBackgroundColor: whiteColor,
      ),
      statusBarColorBuilder: (theme) => theme?.accentColor,
      builder: (context, regularTheme, lightTheme, themeMode) => MaterialApp(
        navigatorKey: AppNavigator.key,
        onGenerateRoute: AppRouter.generateRoute,
        title: 'ZuriChat App',
        theme: regularTheme,
        darkTheme: lightTheme,
        themeMode: themeMode,
        home: const HomeView(),
      ),
    );
  }
}
