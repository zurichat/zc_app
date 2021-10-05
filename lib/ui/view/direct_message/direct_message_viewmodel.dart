import 'package:hng/app/app.locator.dart';
import 'package:hng/services/local_storage_services.dart';
import 'package:hng/utilities/storage_keys.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'direct_message.form.dart';



class DirectMessageViewModel extends FormViewModel {
  final _storageService = locator<SharedPreferenceLocalStorage>();
  final _navigationService = locator<NavigationService>();

  String dmDraft ='';

  String? get drafts =>
      _storageService.getString(StorageKeys.currentUserDmDrafts);


  void getDraft() async{
    if(drafts != null){
      dmDraft = drafts.toString();
      _storageService.clearData(StorageKeys.currentUserDmDrafts);
    }
  }



  void storeDraft(){
    if(directMessagesValue != null){
      dmDraft = directMessagesValue!;
      _storageService.setString(StorageKeys.currentUserDmDrafts, dmDraft);
    }
  }

  void goBack() {
    _navigationService.back();
  }





  @override
  void setFormStatus() {
    // TODO: implement setFormStatus
  }

}
