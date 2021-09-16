import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class NavBarViewModel extends IndexTrackingViewModel {
  static final NavBarViewModel instance = NavBarViewModel._internal();
  List<BottomNavigationBarItem> bottomNavList = [];

  factory NavBarViewModel() {
    return instance;
  }

  NavBarViewModel._internal();

  init() {}
}
