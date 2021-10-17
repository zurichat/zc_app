import 'package:zurichat/constants/app_strings.dart';
import 'package:intl/intl.dart';

import 'user.dart';

class Message {
  int id;
  User sender;
  DateTime time;
  String message;

  Message({
    required this.id,
    required this.sender,
    required this.message,
    required this.time,
  });

  String getRelativeTime() {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final yesterday = DateTime(now.year, now.month, now.day - 1);

    final timeToCheck = DateTime(
      time.year,
      time.month,
      time.day,
    );

    if (timeToCheck == today) {
      return Today;
    } else if (timeToCheck == yesterday) {
      return Yesterday;
    } else {
      return DateFormat.MMMd().format(time);
    }
  }

  static List<String> responses() {
    return [Hello, Cool, Nice, Okay, Yeah, Nope];
  }
}
