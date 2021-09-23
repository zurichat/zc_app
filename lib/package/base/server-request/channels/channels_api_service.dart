import 'dart:convert';

import 'package:hng/models/channel_members.dart';
import 'package:hng/models/channel_model.dart';
import 'package:hng/ui/nav_pages/home_page/home_item_model.dart';
import 'package:hng/app/app.logger.dart';
import 'package:hng/services/user_service.dart';
import 'package:hng/utilities/constants.dart';

import '../../../../app/app.locator.dart';
import '../../../../services/local_storage_services.dart';
import '../../../../utilities/storage_keys.dart';
import '../api/http_api.dart';

class ChannelsApiService {
  final log = getLogger('ChannelsApiService');
  final _api = HttpApiService(channelsBaseUrl);
  final storageService = locator<SharedPreferenceLocalStorage>();
  final _userService = locator<UserService>();

// Your functions for api calls can go in here
// https://channels.zuri.chat/api/v1/61459d8e62688da5302acdb1/channels/

  Future<List> getActiveDms() async {
    String userId = _userService.userId;
    String orgId = _userService.currentOrgId;

    List joinedChannels = [];

    try {
      final res = await _api.get(
        'v1/$orgId/channels/',
        headers: {'Authorization': 'Bearer $token'},
      );
      joinedChannels = res?.data ?? [];
      log.i(joinedChannels);
    } on Exception catch (e) {
      log.e(e.toString());
      return [];
    }

    return joinedChannels;
  }

Future<List<ChannelModel>> fetchChannel() async{

   String orgId = _userService.currentOrgId;
   List<ChannelModel> channels=[];
   try{
final res= await _api.get('/v1/61459d8e62688da5302acdb1/channels/',
  //headers: {'Authorization': 'Bearer $token'},
  );
  channels= (res?.data as List).map((e)=>ChannelModel.fromJson(e)).toList();
   
   }on  Exception catch(e){
     print("Channels EXception $e");
   }
   catch(e){
     print(e);
   }
   
  return channels;
}

getChannelPage(id) async{
  String orgId = _userService.currentOrgId;

  try{
  final res= await _api.get('/v1/61459d8e62688da5302acdb1/channels/$id/',
  //headers: {'Authorization': 'Bearer $token'},
  );
  return ChannelModel.fromJson(res?.data);
  }on  Exception catch(e){
     print("Channels page EXception $e");
   }
  catch(e){
    print(e);
  }

}
getChannelMembers(id) async{
  String orgId = _userService.currentOrgId;
  try{
 final res= await _api.get('/v1/61459d8e62688da5302acdb1/channels/$id/members/',
  //headers: {'Authorization': 'Bearer $token'},
  );
  return (res?.data as List).map((e)=>ChannelMembermodel.fromJson(e)).toList();
  }on  Exception catch(e){
     print("Channels member EXception $e");
   }
  catch(e){
    print(e);
  }
 
}

  String? get token =>
      storageService.getString(StorageKeys.currentSessionToken);
}
