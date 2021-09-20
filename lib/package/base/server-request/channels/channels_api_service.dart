import 'dart:convert';

import 'package:hng/models/channel_members.dart';
import 'package:hng/models/channel_model.dart';
import 'package:hng/ui/nav_pages/home_page/home_item_model.dart';
import 'package:hng/utilities/constants.dart';

import '../../../../app/app.locator.dart';
import '../../../../services/local_storage_services.dart';
import '../../../../utilities/storage_keys.dart';
import '../api/http_api.dart';

class ChannelsApiService {
  final _api = HttpApiService(channelsBaseUrl);
  final storageService = locator<SharedPreferenceLocalStorage>();

// Your functions for api calls can go in here

Future<List<ChannelModel>> fetchChannel() async{
  final res= await _api.get('/api/v1/1/channels/');
  return (res?.data as List).map((e)=>ChannelModel.fromJson(e)).toList();
}

getChannelPage(id) async{
  final res= await _api.get('/api/v1/1/channels/$id/');
  return ChannelModel.fromJson(res?.data);
}
getChannelMembers(id) async{
  final res= await _api.get('/api/v1/1/channels/$id/members/');
  return (res?.data as List).map((e)=>ChannelMembermodel.fromJson(e)).toList();
}

  String? get token =>
      storageService.getString(StorageKeys.currentSessionToken);
}
