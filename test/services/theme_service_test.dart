import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import '../helpers/test_helpers.dart';

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
