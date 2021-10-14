import 'package:hng/app/app.locator.dart';
import 'package:hng/services/media_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class ImagePickerBottomSheetViewModel extends FutureViewModel {
  final _navigator = locator<NavigationService>();

  void dismissBottomSheet() => _navigator.back();

  @override
  Future futureToRun() async{
    Future.delayed(const Duration(seconds: 2));
  }

}