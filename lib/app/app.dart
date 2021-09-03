import 'package:hng/ui/view/create_channel_view/create_channel_view.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';

import '../ui/view/home/home_view.dart';
import '../ui/view/login/login_view.dart';

@StackedApp(routes: [
  MaterialRoute(page: HomeView, initial: true),
  MaterialRoute(page: LoginView),
  MaterialRoute(page: CreateChannelView),
], dependencies: [
  LazySingleton(classType: NavigationService)
])
class AppSetup {
  /* This class serves no other purpose other than having the
   StackedApp annotation attached to it*/
}
