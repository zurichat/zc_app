
import 'package:hng/app/app.locator.dart';
import 'package:hng/ui/view/all_threads_view/thread_detail/model/thread_detail_model.dart';
import 'package:hng/ui/view/all_threads_view/thread_detail/model/thread_replies.dart';
import 'package:hng/ui/view/dm_user/dummy_data/models/message.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class ThreadDetailViewmodel extends BaseViewModel{

  final ThreadDetailModel data = ThreadDetailModel(
    userName:"richieoscar", 
    threadTitle: "Messages", 
    userImageUrl: "assets/images/1.png", 
    date: "Sept 19 at 9:56am",
     message: "Please who is the team lead for mobile track? I have some questions please");
    
    final List<ThreadReplies> replies = ThreadReplies.replies();
    final _navigationService = locator<NavigationService>();
     bool _isVisible = false;
     bool get isVisible => _isVisible;
     
     void onMessageFieldTap(){
       _isVisible = true;
        notifyListeners();
       
     }
     void pop() {
    _navigationService.back();
  }

     void onMessageFocusChanged(){
       _isVisible = false;
        notifyListeners();
     }

     void addReply(ThreadReplies reply){
       ThreadReplies.addReply(reply);
       notifyListeners();

     }
     String time (){
       return "${DateTime.now().hour.toString()}:${DateTime.now().minute.toString()}";
     }
     
}