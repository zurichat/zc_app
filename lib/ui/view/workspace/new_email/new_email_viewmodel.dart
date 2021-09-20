import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class NewEmailViewModel extends BaseViewModel {
  bool isEmpty = true;
  bool get title => isEmpty;

  Color buttonColor = Color(0xffBEBEBE);
  Color get buttonColors => buttonColor;

  void updateString(String value) {
    if (value.trim().isEmpty) {
      isEmpty = true;
      buttonColor = Color(0xffBEBEBE);
    } else {
      isEmpty = false;
      buttonColor = Colors.green;
    }
    notifyListeners();
  }
}
