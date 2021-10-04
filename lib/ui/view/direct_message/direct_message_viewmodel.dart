import 'package:hng/app/app.locator.dart';
import 'package:hng/services/local_storage_services.dart';
import 'package:hng/utilities/storage_keys.dart';
import 'package:stacked/stacked.dart';
import 'direct_message.form.dart';



class DirectMessageViewModel extends FormViewModel {
  final _storageService = locator<SharedPreferenceLocalStorage>();
  String dmDraft ='';

  String? get drafts =>
      _storageService.getString(StorageKeys.currentUserDmDrafts);


  void getDraft() async{
    if(drafts != null){
      dmDraft = drafts.toString();
      _storageService.clearData(StorageKeys.currentUserDmDrafts);
      // print('$draft hhhhh');
    }
  }



  void storeDraft(){
    if(directMessagesValue != null){
      dmDraft = directMessagesValue!;
      _storageService.setString(StorageKeys.currentUserDmDrafts, dmDraft);
    }
  }



  // _storageService.setString(
  // StorageKeys.currentUserDrafts,
  // );


  @override
  void setFormStatus() {
    // TODO: implement setFormStatus
  }

}
