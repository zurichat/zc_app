import 'package:flutter/material.dart';
import 'package:hng/services/notification_service.dart';
import 'package:hng/ui/shared/setup_bottom_sheet_ui.dart';
import 'package:hng/ui/shared/setup_dialog_ui.dart';
import 'package:hng/utilities/internalization/localization/main_localization.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:stacked_themes/stacked_themes.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'app/app.locator.dart';
import 'app/app.router.dart';
import 'constants/app_strings.dart';
import 'general_widgets/app_snackbar.dart';
import 'services/theme_setup.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ThemeManager.initialise();
  await setupLocator();
  setupBottomSheetUi();
  setupDialogUi();

  initNotificationService();
  AppSnackBar.setupSnackbarUi();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ThemeBuilder(
      themes: getThemes(),
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
          supportedLocales: const [
            Locale('nl', 'NL'),
            Locale('en', 'GB'),
            Locale('es', 'ES'),
            Locale('fr', 'FR'),
            Locale('it', 'IT'),
            Locale('pt', 'BR'),
            Locale('zh', 'HK'),
          ],
          localizationsDelegates: const [
            MainLocalization.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          localeResolutionCallback: (locale, supportedLocales) {
            for (var supportedLocale in supportedLocales) {
              if (supportedLocale.languageCode == locale?.languageCode &&
                  supportedLocale.countryCode == locale?.countryCode) {
                return supportedLocale;
              }
            }
            return supportedLocales.first;
          },
        ),
      ),
    );
  }
}
