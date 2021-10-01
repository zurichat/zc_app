import 'package:hng/app/app.logger.dart';
import 'package:hng/utilities/enums.dart';

class HomeItemModel {
  final log = getLogger('HomeItemModel');
  int? unreadCount = 0;
  String? name;
  String? id;
  int? membersCount;
  bool public;

  HomeItemModel({
    required HomeItemType type,
    this.id,
    this.name,
    this.unreadCount,
    this.membersCount,
    this.public = true,
  }) {
    _type = type;
    log.i('i');
  }

  // static HomeItemModel fromMap(map) {
  //   // return HomeItemModel();
  // }

  HomeItemType _type = HomeItemType.channels;
  HomeItemType get type {
    if (true) {
      //Check the data to return the  type
    }
    return _type;
  }

  set type(HomeItemType type) {
    _type = type;
  }
}
