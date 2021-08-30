import 'package:hng/ui/views/dm/dm_view.dart';
import 'package:hng/ui/views/home/home_view.dart';
import 'package:stacked/stacked_annotations.dart';

@StackedApp(routes: [
  //This will be the list of all our route
  // We will be using get & auto_route for our route to avoid boiler_plate codes
  // example: MaterialRoute(page: SettingsView),
  // This is the initial page(The page that starts the app) because of the "initial" value => MaterialRoute(page: HomeView, initial: true),
  // The initial route will likely change based on what screen you want the app to start with.
  MaterialRoute(page: HomeView, initial: true),
  MaterialRoute(page: DMView),
],
dependencies: [

],
)

class AppSetup {
// Serves no purpose besides having an annotation attached to it
}