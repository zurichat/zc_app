import 'package:hng/ui/view/nav_bar/nav_bar_view.dart';
import 'package:hng/ui/view/preference/preference_view.dart';
import 'package:hng/ui/view/workspace/workspace_view.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:stacked_themes/stacked_themes.dart';
import 'package:hng/ui/view/channel/channels_view.dart';

import '../ui/view/login/login_view.dart';

@StackedApp(
  routes: [
    MaterialRoute(page: NavBarView, initial: true),
    MaterialRoute(page: LoginView),
    MaterialRoute(page: PreferenceView),
    MaterialRoute(page: WorkspaceView),
    MaterialRoute(page: ChannelList)
  ],
  dependencies: [
    LazySingleton(classType: NavigationService),
    LazySingleton(classType: ThemeService),
  ],
>>>>>>> df4d1955f3466c2d4ec7ff4f61ac9cdb746454a0
class AppSetup {
  /* This class serves no other purpose other than having the
   StackedApp annotation attached to it*/
}
