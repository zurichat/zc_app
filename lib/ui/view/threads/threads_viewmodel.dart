import 'package:flutter/material.dart';
import 'package:hng/app/app.locator.dart';
import 'package:hng/models/user_post.dart';

import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import 'widgets/emojis.dart';
import 'test_data.dart';

import 'dart:math';

class ThreadsViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();

  List<UserPost> userPosts = userPost1;

  List<Widget> emojis = [
    Emojis(emoji: Icons.emoji_emotions),
  ];

  void exitPage() {
    _navigationService.back();
  }

  void addEmojis(int? postId) {
    var me = userPosts.where((e) {
      if (e.id == postId) {
        e.postEmojis!.add(Emojis(
            emoji: Icons.emoji_emotions, number: Random().nextInt(225) + 1));
        return true;
      }
      return false;
    });
    print(me);

    notifyListeners();
  }
}
