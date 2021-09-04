import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class MembersPageViewModel extends BaseViewModel {
  List<Map<String, dynamic>> _members = [
    {
      'id': 1,
      "avatarUrl":
          "https://cdn.pixabay.com/photo/2015/08/11/21/39/smile-885243_640.jpg",
      "fullName": 'Trevor Belmont',
      "displayName": 'SyphaLover',
      "isOnline": true,
    },
    {
      "id": 2,
      "avatarUrl":
          "https://cdn.pixabay.com/photo/2015/08/11/21/39/smile-885243_640.jpg",
      "fullName": "31",
      "displayName": 30,
      "isOnline": false,
    },
    {
      "id": 3,
      "avatarUrl":
          'https://cdn.pixabay.com/photo/2015/08/11/21/39/smile-885243_640.jpg',
      "fullName": 'Light Yagami',
      "displayName": 'Kira',
      "isOnline": true
    },
   
    {
      " id": 4,
      "avatarUrl":
          'https://cdn.pixabay.com/photo/2015/08/11/21/39/smile-885243_640.jpg',
      "fullName": 'Ichigo Kurosaki',
      "displayName": "Shingami",
      "isOnline": false
    },

    {
      "id": 5,
      "avatarUrl":
          'https://cdn.pixabay.com/photo/2015/08/11/21/39/smile-885243_640.jpg',
      "fullName": 'Aomine Daiki',
      "displayName": 'Ace',
      "isOnline": false
    },
    {
      "id": 6,
      "avatarUrl":
          'https://cdn.pixabay.com/photo/2015/08/11/21/39/smile-885243_640.jpg',
      "fullName": 'Eren Yeager',
      "displayName": 'AttackTitan',
      "isOnline": false
    },
    {
      "id": 006,
      "avatarUrl":
          'https://cdn.pixabay.com/photo/2015/08/11/21/39/smile-885243_640.jpg',
      "fullName": 'Thorfinn',
      "displayName": 'Thorfinn',
      "isOnline": true
    },
    {
      "id": 007,
      "avatarUrl":
          'https://cdn.pixabay.com/photo/2015/08/11/21/39/smile-885243_640.jpg',
      "fullName": 'Isaac',
      "displayName": 'Forgemaster',
      "isOnline": true
    },
    {
      "id": 008,
      "avatarUrl":
          'https://cdn.pixabay.com/photo/2015/08/11/21/39/smile-885243_640.jpg',
      "fullName": 'Isaac',
      "displayName": 'Forgemaster',
      "isOnline": true
    },
    {
      "id": 009,
      "avatarUrl":
          'https://cdn.pixabay.com/photo/2015/08/11/21/39/smile-885243_640.jpg',
      "fullName": 'Meliodas',
      "displayName": 'SinOfWrath',
      "isOnline": false
    },
    {
      "id": 010,
      "avatarUrl":
          'https://cdn.pixabay.com/photo/2015/08/11/21/39/smile-885243_640.jpg',
      "fullName": 'Naruto Uzumaki',
      "displayName": 'YellowHairedShinobi',
      "isOnline": false
    },
    {
      "id": 011,
      "avatarUrl":
          'https://cdn.pixabay.com/photo/2015/08/11/21/39/smile-885243_640.jpg',
      "fullName": 'Kageyama Shigo',
      "displayName": 'Mob',
      "isOnline": false
    },
    {
      "id": 011,
      "avatarUrl":
          'https://cdn.pixabay.com/photo/2015/08/11/21/39/smile-885243_640.jpg',
      "fullName": 'Saitama',
      "displayName": 'OnePunch',
      "isOnline": false
    },
    {
      "id": 012,
      "avatarUrl":
          'https://cdn.pixabay.com/photo/2015/08/11/21/39/smile-885243_640.jpg',
      "fullName": 'Asta',
      "displayName": 'Asta',
      "isOnline": false
    },
  ];

  List<Map<String, dynamic>> get members {
    return [..._members];
  }

 static List<Map<String, dynamic>> foundmembers = [];


  static List<Map<String, dynamic>> results = [];
  void runFilter(String enteredKeyword) {
    if (enteredKeyword.isEmpty) {
      results = _members;
    } else {
      results = _members
          .where((member) => member["fullName"]
              .toLowerCase()
              .contains(enteredKeyword.toLowerCase()))
          .toList();
      // we use the toLowerCase() method to make it case-insensitive
    }

    foundmembers = results;
    notifyListeners();
  }

// AppBar Title
  String _appBarTitle = 'People';
  String get appBarTitle => _appBarTitle;

// AppBar SubTitle
  String _appBarSubTitle = 'members';
  String get appBarSubTitle => _appBarSubTitle;

  var _searchMembers = TextEditingController();
  get searchMembers => _searchMembers;
}
