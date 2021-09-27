import 'dart:async';

import 'package:hng/models/channel_members.dart';
import 'package:hng/models/channel_model.dart';

import '../../../../app/app.locator.dart';
import '../../../../app/app.logger.dart';
import '../../../../services/local_storage_services.dart';
import '../../../../services/user_service.dart';
import '../../../../utilities/constants.dart';
import '../../../../utilities/storage_keys.dart';
import '../api/http_api.dart';

class ChannelsApiService {
  final log = getLogger('ChannelsApiService');
  final _api = HttpApiService(channelsBaseUrl);
  final storageService = locator<SharedPreferenceLocalStorage>();
  final _userService = locator<UserService>();

  StreamController<String> controller = StreamController.broadcast();

// Your functions for api calls can go in here
// https://channels.zuri.chat/api/v1/61459d8e62688da5302acdb1/channels/
  //TODo - fix
  // ignore: always_declare_return_types
  onChange() {}
  Future<List> getActiveDms() async {
    final userId = _userService.userId;
    final orgId = _userService.currentOrgId;

    var joinedChannels = [];

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


  Future<bool> createChannels({
    required String name,
    required String description,
    required bool private,
  }) async {
    final owner = _userService.userEmail;
    final orgId = _userService.currentOrgId;

    try {
      final res = await _api.post(
        'v1/$orgId/channels/',
        data: {
          'name': name,
          'owner': owner,
          'description': description,
          'private': private,
        },
        headers: {'Authorization': 'Bearer $token'},
      );

      log.i(res?.data.toString());

      if (res?.statusCode == 201 || res?.statusCode == 200) {
        controller.sink.add('created channel');
        return true;
      }
    } on Exception catch (e) {
      log.e(e.toString());
    }

    return false;
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
 final res= await _api.get('/v1/orgId/channels/$id/members/',
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

  dispose() {
    // onChange.close();
  }

  String? get token =>
      storageService.getString(StorageKeys.currentSessionToken);
}