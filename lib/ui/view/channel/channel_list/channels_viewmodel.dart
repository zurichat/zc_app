import 'package:hng/app/app.locator.dart';
import 'package:hng/package/base/server-request/api/http_api.dart';
import 'package:stacked/stacked.dart';

class ChannelListViewModel extends BaseViewModel {
  final _channelsList = [
    'announcement',
    'General',
    'Random',
    'Rules',
    'Team-scorates',
    'Team-Kant',
  ];
  List get channelsList => _channelsList;

  final apiService = locator<HttpApiService>();
  getChannelList()async{
    //final response= await apiService.get('/');
  }
}
// import 'package:flutter/material.dart';
