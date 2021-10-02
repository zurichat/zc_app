import 'package:flutter_test/flutter_test.dart';
import 'package:hng/app/app.router.dart';
import 'package:hng/ui/view/plugins/plugin_viewmodel.dart';
import 'package:mockito/mockito.dart';
import '../helpers/test_helpers.dart';

void main() {
  group('pluginViewModelTest -', () {
    setUp(() => registerServices());
    tearDown(() => unregisterServices());
    group('initialise -', () {
      test(
          'When constructed, checks if all the fields have a default state of false',
          () {
        final model = PluginViewModel();
        expect(model.editMode, false);
        expect(model.checked, false);
      });
    });

    group('test toggle functions -', () {
      test('When called, checks that the edit field changes state', () {
        final model = PluginViewModel();
        model.setChecked(true);
        expect(model.checked, true);
      });

      test('When called, checks that the edit field changes state', () {
        final model = PluginViewModel();
        model.setMode(true);
        expect(model.editMode, true);
      });
    });

    group('navigation tests -', () {
      test('When called, verify that the addPluginView is displayed', () {
        final navigation = getAndRegisterNavigationServiceMock();
        final model = PluginViewModel();
        model.navigateToAdd();
        verify(navigation.navigateTo(Routes.addPluginView));
      });

      test('When called, verify that the editPluginView is displayed', () {
        final navigation = getAndRegisterNavigationServiceMock();
        final model = PluginViewModel();
        model.navigateToEdit();
        verify(navigation.navigateTo(Routes.editPluginView));
      });

      test('When called, verify that the pluginView is displayed', () {
        final navigation = getAndRegisterNavigationServiceMock();
        final model = PluginViewModel();
        model.navigateToPlugins();
        verify(navigation.navigateTo(Routes.pluginView));
      });

      test('When called, verify that the user is taken to the home screen', () {
        final navigation = getAndRegisterNavigationServiceMock();
        final model = PluginViewModel();
        model.navigateToHome();
        verify(navigation.navigateTo(Routes.navBarView));
      });
    });
  });
}
