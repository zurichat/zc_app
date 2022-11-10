// import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class NewEmailViewModel extends BaseViewModel {
  bool isEmpty = true;
  bool get title => isEmpty;
  String _text = '';
  String get text => _text;

  // Color buttonColor = ;
  // Color get buttonColors => buttonColor;

  void updateString(String value) {
    if (value.trim().isEmpty) {
      isEmpty = true;
    } else {
      isEmpty = false;
    }
    _text = value.trim();
    notifyListeners();
  }
}
