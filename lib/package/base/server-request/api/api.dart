import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:hng/models/channels_search_model.dart';
import 'package:hng/utilities/failures.dart';

import '../../../../models/api_response.dart';

abstract class Api {

  Future fetchListOfOrganizations(token);
  Future getJoinedOrganizations(token, String email);
  Future fetchOrganizationInfo(String id, token);
  Future fetchOrganizationByUrl(String url, token);
  Future<bool> joinOrganization(String orgId, String email, token);
  Future createOrganization(String email, token);
  Future updateOrgUrl(String orgId, String url, token);
  Future updateOrgName(String orgId, String name, token);
  Future updateOrgLogo(String orgId, String url, token);
  Future addMemberToOrganization(String orgId, String email, token);
  Future getChannelSocketId(String channelId, String orgId, token);
  Future joinChannel(String channelId, String userId, String orgId, token);
  Future getChannelMessages(String channelId, String orgId, token);
  Future sendChannelMessages(
      String channelId, String userId, String orgId, String message, token);
  Future fetchChannel(String orgId, token);
  Future<bool> createChannels(
      {required String name,
      required String owner,
      required String email,
      required String orgId,
      required String description,
      required bool private,
      token});
  getChannelPage(String id, String orgId, token);
  getChannelMembers(String id, String orgId, token);
  List<ThemeData> getThemes();
  sendGetRequest(endpoint);
  sendPostRequest(body, endpoint);
  sendPatchRequest(body, endpoint, userId);
  Failure handleApiError(DioError e);
  Future allChannelsList(String currentOrgId, token);
  Future joinedChannelsList(String currentOrgId, String currentUserId, token);
  Future fetchListOfMembers(String currentOrgId, token);
  Future fetchList(String currentOrgId, token);
}
