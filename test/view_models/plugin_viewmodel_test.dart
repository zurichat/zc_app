import 'package:flutter_test/flutter_test.dart';
import 'package:zurichat/app/app.router.dart';
import 'package:zurichat/ui/nav_pages/plugin_page/plugin_viewmodel.dart';
import 'package:mockito/mockito.dart';
import '../helpers/test_helpers.dart';

void main() {
  group('pluginViewModelTest -', () {
    final navigationService = getAndRegisterNavigationServiceMock();
    final model = PluginViewModel();
    setUp(() => registerServices());
    tearDown(() => unregisterServices());
    group('initialise -', () {
      test(
          'When constructed, checks if all the fields have a default state of false',
          () {
        expect(model.editMode, false);
        expect(model.checked, false);
      });
    });

    group('test toggle functions -', () {
      test('When called, checks that the edit field changes state', () {
        model.setChecked(true);
        expect(model.checked, true);
      });

      test('When called, checks that the edit field changes state', () {
        model.setMode(true);
        expect(model.editMode, true);
      });
    });

    group('navigation tests -', () {
      test('When called, verify that the pluginView is displayed', () {
        model.navigateToPlugins();
        verify(navigationService.navigateTo(Routes.pluginPage));
      });

      test('When called, verify that the user is taken to the home screen', () {
        model.navigateToHome();
        verify(navigationService.navigateTo(Routes.navBarView));
      });
    });
  });
}
