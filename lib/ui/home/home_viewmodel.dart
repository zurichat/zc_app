import 'package:flutter/material.dart';
import 'package:hng/ui/dm/dm_view.dart';
import 'package:hng/ui/integrate/integrate_view.dart';
import 'package:hng/ui/startup/startup_view.dart';
import 'package:hng/ui/you/you_view.dart';
import 'package:stacked/stacked.dart';

class HomeViewModel extends IndexTrackingViewModel {
 
   Widget getViewForIndex(int index) {
    switch (index) {
      case 0:
        return StartupView();
      case 1:
        return DMView();
      case 2:
        return IntegrateView();
      case 3:
        return YouView();
      default:
        return StartupView();
    }
  }
}
