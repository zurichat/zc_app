import 'package:hng/ui/view/create_channel_view/create_channel_view.dart';
import 'package:hng/ui/view/nav_bar/nav_bar_view.dart';
import 'package:hng/ui/view/preference/preference_view.dart';
import 'package:hng/ui/view/workspace/workspace_view.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:stacked_themes/stacked_themes.dart';

import '../ui/view/login/login_view.dart';

@StackedApp(
  routes: [
    MaterialRoute(page: NavBarView, initial: true),
    MaterialRoute(page: LoginView),
    MaterialRoute(page: PreferenceView),
    MaterialRoute(page: CreateChannelView),
    MaterialRoute(page: WorkspaceView),
  ],
  dependencies: [
    LazySingleton(classType: NavigationService),
    LazySingleton(classType: ThemeService),
  ],
)
class AppSetup {
  /* This class serves no other purpose other than having the
   StackedApp annotation attached to it*/
}
