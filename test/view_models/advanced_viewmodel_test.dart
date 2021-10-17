import 'package:flutter_test/flutter_test.dart';
import 'package:zurichat/ui/view/advanced/advanced_viewmodel.dart';
import 'package:zurichat/utilities/enums.dart';
import 'package:mockito/mockito.dart';
import '../helpers/test_helpers.dart';

AdvancedViewModel _getModel() => AdvancedViewModel();

void main() {
  group('AdvancedViewmodelTest -', () {
    setUp(() => registerServices());
    tearDown(() => unregisterServices());

    group('changeSkinTone -', () {
      test('when called, call dialog service to show custom dialog', () async {
        final dialogService = getAndRegisterDialogServiceMock();
        var model = _getModel();
        await model.changeSkinTone();
        verify(dialogService.showCustomDialog(variant: DialogType.skinTone));
      });
    });

    group('toggleShowImagePreviews -', () {
      test(
          'When toggleShowImagePreviews is called should notifyListeners to rebuild UI',
          () {
        var model = _getModel();
        bool called = false;
        model.addListener(() {
          called = true;
        });
        model.toggleShowImagePreviews(true);

        expect(called, true);
      });
      test(
          'When toggleShowImagePreviews is called and value is true, showImagePreviews should be true',
          () {
        var model = _getModel();
        model.toggleShowImagePreviews(true);
        expect(model.showImagePreviews, true);
      });

      test(
          'When toggleShowImagePreviews is called and value is false, showImagePreviews should be false',
          () {
        var model = _getModel();
        model.toggleShowImagePreviews(false);
        expect(model.showImagePreviews, false);
      });
    });

    group('toggleDisplayTypingIndicators -', () {
      test(
          'When toggleDisplayTypingIndicators is called should notifyListeners to rebuild UI',
          () {
        var model = _getModel();
        bool called = false;
        model.addListener(() {
          called = true;
        });
        model.toggleDisplayTypingIndicators(true);

        expect(called, true);
      });
      test(
          'When toggleDisplayTypingIndicators is called and value is true, displayTypingIndicators should be true',
          () {
        var model = _getModel();
        model.toggleDisplayTypingIndicators(true);
        expect(model.displayTypingIndicators, true);
      });

      test(
          'When toggleDisplayTypingIndicators is called and value is false, displayTypingIndicators should be false',
          () {
        var model = _getModel();
        model.toggleDisplayTypingIndicators(false);
        expect(model.displayTypingIndicators, false);
      });
    });

    group('toggleAllowAnimatedImageAndEmoji -', () {
      test(
          'When toggleAllowAnimatedImageAndEmoji is called should notifyListeners to rebuild UI',
          () {
        var model = _getModel();
        bool called = false;
        model.addListener(() {
          called = true;
        });
        model.toggleAllowAnimatedImageAndEmoji(true);

        expect(called, true);
      });
      test(
          'When toggleAllowAnimatedImageAndEmoji is called and value is true, allowAnimatedImageAndEmoji should be true',
          () {
        var model = _getModel();
        model.toggleAllowAnimatedImageAndEmoji(true);
        expect(model.allowAnimatedImageAndEmoji, true);
      });

      test(
          'When toggleAllowAnimatedImageAndEmoji is called and value is false, allowAnimatedImageAndEmoji should be false',
          () {
        var model = _getModel();
        model.toggleAllowAnimatedImageAndEmoji(false);
        expect(model.allowAnimatedImageAndEmoji, false);
      });
    });

    group('toggleOptimizeImageUploads -', () {
      test(
          'When toggleOptimizeImageUploads is called should notifyListeners to rebuild UI',
          () {
        var model = _getModel();
        bool called = false;
        model.addListener(() {
          called = true;
        });
        model.toggleOptimizeImageUploads(true);

        expect(called, true);
      });
      test(
          'When toggleOptimizeImageUploads is called and value is true, optimizeImageUploads should be true',
          () {
        var model = _getModel();
        model.toggleOptimizeImageUploads(true);
        expect(model.optimizeImageUploads, true);
      });

      test(
          'When toggleOptimizeImageUploads is called and value is false, optimizeImageUploads should be false',
          () {
        var model = _getModel();
        model.toggleOptimizeImageUploads(false);
        expect(model.optimizeImageUploads, false);
      });
    });
  });
}
