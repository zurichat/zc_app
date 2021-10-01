import 'package:flutter_test/flutter_test.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mockito/mockito.dart';
import '../helpers/test_helpers.dart';

void main() {
  group('MediaServiceTest -', () {
    setUp(() => registerServices());
    tearDown(() => unregisterServices());

    group('Media upload -', () {
      
      test('When called it should upload an image and return image address', () async {
          final mediaService = getAndRegisterMediaServiceMock();
          final XFile? image;
        
      });
  //     test(
  //         'When called it should pick an image from gallery and upload the image',
  //         () async {
  //       final mediaService = getAndRegisterMediaServiceMock();
  //       mediaService.getImage(fromGallery: true);
  //       verify(mediaService.getImage(fromGallery: true));
  //     });
    });
 });
}
