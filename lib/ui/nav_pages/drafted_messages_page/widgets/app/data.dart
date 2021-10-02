import 'package:hng/constants/app_strings.dart';

class DraftedItem {
  final username, message, time;

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
    time: Date,
  ),
  DraftedItem(
    username: AbdSalam,
    message: Okay,
    time: Date,
  ),
  DraftedItem(
    username: Random,
    message: NoWahala,
    time: Date,
  ),
];
