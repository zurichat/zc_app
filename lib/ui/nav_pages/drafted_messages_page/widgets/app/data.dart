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
    username: 'OyinkanUA',
    message: 'Okay',
    time: 'August 31 at 9:09 PM',
  ),
  DraftedItem(
    username: 'Abd_salam',
    message: 'No wahala',
    time: 'August 31 at 9:09 PM',
  ),
  DraftedItem(
    username: '#random chat',
    message: 'My Oga',
    time: 'August 31 at 9:09 PM',
  ),
];
