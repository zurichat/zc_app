import 'package:flutter/material.dart';
import 'package:hng/app/app.locator.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class SavedItemsViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();

  void exitPage() {
    _navigationService.back();
  }
}
