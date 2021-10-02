import 'package:flutter_test/flutter_test.dart';
import 'package:hng/app/app.router.dart';
import 'package:hng/ui/nav_pages/home_page/home_page_viewmodel.dart';
import 'package:hng/ui/nav_pages/home_page/widgets/home_list_items.dart';
import 'package:mockito/mockito.dart';
import '../helpers/test_helpers.dart';

void main() {
  group('Home page view model test -', () {
    setUp(() => registerServices());
    tearDown(() => unregisterServices());

    group("View model methods test", () {
      test("Navigate to file search page", () {
        final model = HomePageViewModel();
        model.nToPref();
        verify(navigationService.navigateTo(Routes.fileSearchView));
      });
         test('Navigate to Dm user page', () {
        final model = HomePageViewModel();
        model.navigateToDmUser();
        verify(navigationService.navigateTo(Routes.dmUserView));
      });

     test('Get Dms and channels list', () async {
        var service = getAndRegisterChannelsApiServiceMock();
        var model = HomePageViewModel();
        await model.getDmAndChannelsList();
        verify(service.getActiveDms());
      });

   

      // test("Navigate to channel page", ()async{
      //   var service= getAndRegisterNavigationServiceMock();
      //   var model=HomePageViewModel();
      //   await model.navigateToChannelPage("channelname", "channelId", 5, true);
      //   verify(service.navigateTo(Routes.channelPageView,
      //   arguments: ChannelPageViewArguments(
      //       channelname: "channelname",
      //       channelId: "channelId",
      //       membersCount:5,
      //       public: true,
      //     ),
      //     ));
      // });

    });
  });
}
