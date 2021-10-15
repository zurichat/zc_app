import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import '../helpers/test_constants.dart';
import '../helpers/test_helpers.dart';

void main() {
  group('MediaServiceTest -', () {
    setUp(() => registerServices());
    tearDown(() => unregisterServices());

    group('Media upload -', () {
      final mediaService = getAndRegisterMediaServiceMock();
      test('When called it should upload an image and return image address',
          () async {
        mediaService.uploadImage(fileMock, pluginId_string);
        verify(mediaService.uploadImage(fileMock, pluginId_string));
      });
    });
  });
}
