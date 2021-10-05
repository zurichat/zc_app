import 'package:flutter/material.dart';
import 'package:hng/app/app.locator.dart';
import 'package:hng/constants/app_strings.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class ClearAfterViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  DateTime selectedDate = DateTime.now();
  TimeOfDay selectedTime = TimeOfDay.now();
  bool lastIndex = false;

  List clearAfterTimes = [
    DontClear,
    ThirtyMins,
    OneHour,
    FourHours,
    Today,
    ThisWeek,
    ChooseDate,
    ClearAfter,
  ];
  int? currentValue = 0;

  void exitPage() {
    _navigationService.back();
  }

  void changeTime(int? value) {
    currentValue = value;
    currentValue == clearAfterTimes.length - 1
        ? lastIndex = true
        : lastIndex = false;
    notifyListeners();
  }
}
