
import 'package:hng/ui/view/dm_user/dummy_data/models/User.dart';
import 'package:intl/intl.dart';

class Message {

  int id;
  User sender;
  DateTime time;
  String message;

  Message({required this.id, required this.sender,
    required this.message, required this.time});

  String getRelativeTime() {
    DateTime now = DateTime.now();
    DateTime today = DateTime(now.year, now.month, now.day);
    DateTime yesterday = DateTime(now.year, now.month, now.day - 1);

    DateTime timeToCheck = DateTime(this.time.year, this.time.month, this.time.day);

    if(timeToCheck == today) {
      return "Today";
    }
    else if(timeToCheck == yesterday) {
      return "Yesterday";
    }
     else {
       return DateFormat.MMMd().format(this.time);
    }
  }

  static List<String> responses() {
    return ["Hello...", "Cool...", "Nice...", "Okay", "Yeah", "Nope"];
  }
}