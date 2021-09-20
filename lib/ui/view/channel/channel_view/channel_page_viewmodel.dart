import 'package:flutter/material.dart';
import 'package:hng/app/app.locator.dart';
import 'package:hng/app/app.router.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class ChannelPageViewModel extends BaseViewModel {

  String get message => editor.text.trim();

  final _navigationService = locator<NavigationService>();
  final editor = TextEditingController();

  navigateToChannelInfo() {
    _navigationService.navigateTo(Routes.channelInfoView);
  }

  navigateToAddPeople() {
    _navigationService.navigateTo(Routes.addPeopleView);
  }
}
