import 'package:flutter_test/flutter_test.dart';
import 'package:hng/ui/view/preference/preference_viewmodel.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:stacked_themes/stacked_themes.dart';

import '../helpers/test_helpers.dart';

class MockThemeServices extends Mock implements ThemeService {}

//modified
@GenerateMocks([MockThemeServices])
void main() {
  group('ThemeServiceTest -', () {
    setUp(() => registerServices());
    tearDown(() => unregisterServices());

    group('Theme services test', () {
      test('Test if theme switching is working correctly', () async {
        var themeService = getAndRegisterThemeServiceMock();
        await themeService.selectThemeAtIndex(0).whenComplete(() => true);
        verify(themeService.selectThemeAtIndex(0).whenComplete(() => true));
      });
    });
  });
}
