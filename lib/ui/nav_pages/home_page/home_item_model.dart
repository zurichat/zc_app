import 'package:flutter/material.dart';
import 'package:hng/utilities/enums.dart';

class HomeItemModel {
  int? unreadCount = 0;
  String? name;
  bool public;

  HomeItemModel({type, this.unreadCount, this.name, this.public = true}) {
    _type = type;
    print('i');
  }

  static HomeItemModel fromMap(map) {
    return HomeItemModel();
  }

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
