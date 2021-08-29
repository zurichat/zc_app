import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AppToast {
  AppToast._instance();
  static AppToast instance = AppToast._instance();
// ignore: lines_longer_than_80_chars
// ignore: todo
//TODO change colors in this page to assigned theme colors to be defined in style.dart file
  void success(title, body) {
    Fluttertoast.showToast(
      msg: title == null ? '$body' : '$title\n\n$body',
      backgroundColor: Colors.green,
      textColor: Colors.white,
      gravity: ToastGravity.BOTTOM,
    );
  }

  void message(title, body) {
    Fluttertoast.showToast(
      msg: title == null ? '$body' : '$title\n\n$body',
      backgroundColor: Colors.grey[700],
      textColor: Colors.white,
      gravity: ToastGravity.BOTTOM,
    );
  }

  void error(title, body) {
    Fluttertoast.showToast(
      msg: title == null ? '$body' : '$title\n\n$body',
      backgroundColor: Colors.red,
      textColor: Colors.white,
      gravity: ToastGravity.BOTTOM,
    );
  }
}
