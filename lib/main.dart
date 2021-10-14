import 'package:flutter/material.dart';
import 'package:hng/services/notification_service.dart';
import 'package:hng/ui/shared/setup_bottom_sheet_ui.dart';
import 'package:hng/ui/shared/setup_dialog_ui.dart';
import 'package:hng/ui/shared/shared.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:stacked_themes/stacked_themes.dart';

import 'app/app.locator.dart';
import 'app/app.router.dart';
import 'constants/app_strings.dart';
import 'general_widgets/app_snackbar.dart';
import 'main_app_view_model.dart';
import 'services/zuri_theme_service.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ThemeManager.initialise();
  await setupLocator();
  setupBottomSheetUi();
  setupDialogUi();
  initNotificationService();
  AppSnackBar.setupSnackbarUi();
  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AppModel>.reactive(
      onModelReady: (model) => model.initialise,
      builder: (context, model, child) => MyApp(model),
      viewModelBuilder: () => AppModel(),
    );
  }
}

class MyApp extends StatefulWidget {
  const MyApp(this.model, {Key? key}) : super(key: key);
  final AppModel model;

  @override
  State<MyApp> createState() => _MyAppState();

  static void setLocale(BuildContext context, Locale locale) {
    _MyAppState? state = context.findAncestorStateOfType<_MyAppState>();
    state!.setLocale(locale);
  }
}

class _MyAppState extends State<MyApp> {
  Locale? _locale;
  @override
  Widget build(BuildContext context) {
    _locale = widget.model.appLocale;
    return ThemeBuilder(
      themes: ZuriThemeService().getThemes(),
      builder: (context, regularTheme, darkTheme, themeMode) => OverlaySupport(
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          navigatorKey: StackedService.navigatorKey,
          onGenerateRoute: StackedRouter().onGenerateRoute,
          title: appName,
          theme: regularTheme,
          darkTheme: darkTheme,
          themeMode: themeMode,
          initialRoute: Routes.splashview,
          localizationsDelegates: widget.model.localizationsDelegates,
          locale: _locale,
          supportedLocales: supportedLocalesList,
          localeResolutionCallback: widget.model.loadSupportedLocals,
        ),
      ),
    );
  }

  void setLocale(Locale locale) {
    setState(() {
      _locale = locale;
    });
  }
}
