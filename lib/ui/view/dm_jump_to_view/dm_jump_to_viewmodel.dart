import 'package:flutter/material.dart';
import 'package:hng/app/app.locator.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class DmJumpToViewModel extends BaseViewModel {
  TextEditingController _controller = TextEditingController();
  TextEditingController get controller => _controller;
  final _navigationService = locator<NavigationService>();

  navigateBack() {
    _navigationService.back();
  }
}
