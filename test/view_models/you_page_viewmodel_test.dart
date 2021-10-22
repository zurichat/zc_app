import 'package:flutter_test/flutter_test.dart';
import 'package:zurichat/app/app.router.dart';
import 'package:mockito/mockito.dart';
import '../helpers/test_helpers.dart';
import 'package:zurichat/ui/nav_pages/you_page/you_page_viewmodel.dart';

void main() {
  group('YouPageViewModelTest -', () {
    setUp(() => registerServices());
    tearDown(() => unregisterServices());
    group('navigateToEditProfile -', () {
      test('when called, it takes user to the edit profile page', () async {
        final navigationService = getAndRegisterNavigationServiceMock();
        final model = YouPageViewModel();
        model.editProfile();
        verify(navigationService.navigateTo(Routes.editProfileView));
      });
    });
    group('navigateToPauseNotification -', () {
      test('when called, it takes user to the do not disturb page', () async {
        final navigationService = getAndRegisterNavigationServiceMock();
        final model = YouPageViewModel();
        model.pauseNotifications();
        verify(navigationService.navigateTo(Routes.doNotDisturbView));
      });
    });
    group('navigateToSavedItem -', () {
      test('when called, it takes user to the edit profile page', () async {
        final navigationService = getAndRegisterNavigationServiceMock();
        final model = YouPageViewModel();
        model.viewSavedItem();
        verify(navigationService.navigateTo(Routes.savedItemsView));
      });
    });
    group('navigateToViewProfile -', () {
      test('when called, it takes user to the edit profile page', () async {
<<<<<<< HEAD
      //TODO write proper test
=======
        //TODO write proper test
>>>>>>> e0ec9a58844dcdf0ed41ee76378015bdd3d4baf0
      });
    });
    group('navigateToViewNotification -', () {
      test('when called, it takes user to the edit profile page', () async {
        final navigationService = getAndRegisterNavigationServiceMock();
        final model = YouPageViewModel();
        model.viewNotifications();
        verify(navigationService.navigateTo(Routes.notificationsView));
      });
    });
    group('navigateToViewPreference -', () {
      test('when called, it takes user to the edit profile page', () async {
        final navigationService = getAndRegisterNavigationServiceMock();
        final model = YouPageViewModel();
        model.viewPreferences();
        verify(navigationService.navigateTo(Routes.preferenceView));
      });
    });
    group('navigateToSetStatus -', () {
      test('when called, it takes user to the edit profile page', () async {
        final navigationService = getAndRegisterNavigationServiceMock();
        final model = YouPageViewModel();
        model.setStatus();
        verify(navigationService.navigateTo(Routes.setStatusView));
      });
    });
  });
}
