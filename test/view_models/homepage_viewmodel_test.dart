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

    group("Navigation services test", () {
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

      


    });
  });
}
