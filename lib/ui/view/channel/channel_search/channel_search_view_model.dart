import 'package:flutter/material.dart';
import 'package:hng/app/app.locator.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class ChannelSearchViewModel extends BaseViewModel {
  final TextEditingController searchController = TextEditingController();
  final _navigationService = locator<NavigationService>();

  void navigateBack() => _navigationService.back();
}
