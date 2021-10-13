import 'package:hng/constants/app_strings.dart';

class DraftedItem {
  final String? username, message, time;

  DraftedItem({
    this.username,
    this.message,
    this.time,
  });
}

double mySize = 0.0;
double kPadding = mySize * 0.025;

List<DraftedItem> draftedList = [
  DraftedItem(
    username: OyinkanUA,
    message: Okay,
    time: SampleDate,
  ),
  DraftedItem(
    username: AbdSalam,
    message: NoWahala,
    time: SampleDate,
  ),
  DraftedItem(
    username: TeamSocrates,
    message: Cool,
    time: SampleDate,
  ),
];
