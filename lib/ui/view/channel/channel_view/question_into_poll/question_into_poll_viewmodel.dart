import 'package:hng/app/app.locator.dart';
import 'package:hng/models/app_model.dart';
import 'package:hng/models/channel_members.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class QuestionIntoPollViewModel extends FormViewModel {
  final _navigationService = locator<NavigationService>();
  @override
  void setFormStatus() {
    // TODO: implement setFormStatus
  }
  List<UserPost>? channelUserMessages = [];
  List<ChannelMembermodel> channelMembers = [];

  void exitPage() {
    _navigationService.back();
  }

  double _option1 = 1.0;
  double _option2 = 1.0;

  double get option1 {
    return _option1;
  }

  double get option2 {
    return _option2;
  }

  int number = 1;

  onVote(choice) {
    if (choice == 1) {
      _option1 += 1.0;
    }
    if (choice == 2) {
      _option2 += 1.0;
    }

    notifyListeners();
  }

  void reBuild() {
    notifyListeners();
  }
}
