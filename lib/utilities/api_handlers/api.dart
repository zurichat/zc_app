import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:zurichat/models/api_response.dart';
import 'package:zurichat/models/organization_model.dart';
import 'package:zurichat/models/user_search_model.dart';
import 'package:zurichat/utilities/api_handlers/failures.dart';

abstract class Api {
  /// THIS IS THE API ABSTRACT CLASS FOR ZURI CHAT MOBILE
  /// THE PURPOSE OF WRITING THIS FILE IS TO AID THE USE OF SERVICES
  /// ALSO TO HIDE THE SERVICES USED, FROM THE USER.
  /// THESE SERVICES ARE TO BE USED CAREFULLY AND SMOOTHLY
  /// AS IT IS DEFINED HEREIN.
  ///
  ///
  /// KINDLY NOTE THAT BEFORE ANY EDIT CAN BE MADE, IT MUST BE
  /// AUTORIZED BY THE LEAD DEVELOPER WHO IS MONITORING THIS PROJECT
  ///
  ///
  /// BELOW ARE SERVICES USED...
  /// -----------------------------------------------------------------------
  ///
  /// OTHER SERVICES CAN BE ADDED AS NEED BE - FOR CONSUMPTION.
  /// AS YOU REGISTER A SERVICE, KINDLY WRITE A BRIEF ABOUT THE
  /// SERVICE AND WHAT IT OFFERS.
  ///
  /// -----------------------------------------------------------------------

  // LOGIN SERVICE
  Future<dynamic> login(
      {required String email, required String password, token});

  // SIGNUP SERVICE
  Future<dynamic> signUp(
      {required String email,
      required String password,
      required String firstName,
      required String lastName,
      required String displayName,
      required String phoneNumber,
      required String token});

  // THE SERVICE TO GET LIST OF ORGANIZATIONS
  Future<List<OrganizationModel>> fetchListOfOrganizations(token);

  // THE SERVICE TO GET LIST OF JOINED ORGANIZATIONS OF A USER
  Future<List<OrganizationModel>> getJoinedOrganizations(token, String email);

  // THE SERVICE TO GET THE INFORMATION OF AN ORGANIZATION
  Future fetchOrganizationInfo(String id, token);

  // THE SERVICE TO GET AN ORGANIZATION BY URL
  Future fetchOrganizationByUrl(String url, token);

  // THE SERVICE TO JOIN AN ORGANIZATION
  Future<bool> joinOrganization(String orgId, String email, token);

  // THE SERVICE TO CREATE AN ORGANIZATION
  Future<String> createOrganization(String email, token);

  /// THE SERVICE TO UPDATE AN ORGANIZATION URL
  /// THIS GIVES THE ORGANIZATION A PRIVILEDGE TO
  /// GET A CUSTOM LINK
  ///
  /// AS FAR AS IT IS AVAILABLE FOR USE
  Future updateOrgUrl(String orgId, String url, token);

  // THE SERVICE TO UPDATE AN ORGANIZATION NAME
  Future updateOrgName(String orgId, String name, token);

  // THE SERVICE TO UPDATE IMAGE OF A USER
  Future uploadImage(
    File image, {
    required String token,
    required String pluginId,
  });

  // THE SERVICE TO UPDATE AN ORGANIZATION LOGO
  Future updateOrgLogo(String orgId, File image, token);

  // THE SERVICE TO ADD A MEMBERS TO AN ORGANIZATION
  Future addMemberToOrganization(String orgId, String email, token);

  // THE SERVICE TO FETCH MEMBERS IN AN ORGANIZATION
  Future<List<UserSearch>> fetchMembersInOrganization(String orgId, token);

  /// THE SERVICE TO GET THE SOCKET ID FOR A CHANNEL
  /// THIS AIDS THE RTC AS WELL AS GETTING THE MESSAGES
  Future getChannelSocketId(String channelId, String orgId, token);

  /// THE SERVICE TO GET THE LIST OF ACTIVE DMs
  Future<List> getActiveDms(String orgId, token);

  /// THE SERVICE TO JOIN A CHANNEL
  /// THIS CAN BE DONE EITHER BY CALLING THE USER
  /// OR BY MANUALLY ADDING THEM BY USERNAME
  Future<Map> joinChannel(String channelId, String userId, String orgId, token);

  /// THE SERVICE TO GET ALL CHANNEL MESSAGES FROM THE BACKEND
  /// THIS SERVICE IS SUPPORTED WITH THE RTC METHODS
  Future getChannelMessages(String channelId, String orgId, token);

  /// THE SERVICE TO SEND MESSAGES INTO THE CHANNEL
  /// THIS CAN EITHER BE A THREAD MESSAGE OR A NORMAL MESSAGE
  /// THIS SERVICE IS SUPPORTED WITH THE RTC METHODS
  Future sendChannelMessages(
      String channelId, String userId, String orgId, String message, token);

  /// THE SERVICE TO FETCH CHANNELS IN AN ORGANIZATION
  /// ALL CHANNELS - BOTH PUBLIC AND PRIVATE ONES
  ///
  /// YOU CAN DO YOUR FILTERING IF YOU WANT TO GET
  /// A SPECIFIC SECTION.
  Future fetchChannel(String orgId, token);

  /// THE SERVICE TO CREATE CHANNELS.
  /// THIS CAN ONLY BE DONE IF THERE ARE PRIVILEDGES
  Future<bool> createChannels(
      {required String name,
      required String owner,
      required String email,
      required String orgId,
      required String description,
      required bool private,
      token});

  /// THE SERVICE TO GET A CHANNEL PAGE
  /// EITHER CHANNEL DETAILS
  getChannelPage(String id, String orgId, token);

  /// THE SERVICE TO GET CHANNEL MEMBERS IN REAL TIME
  getChannelMembers(String id, String orgId, token);

  /// THE SERVICE TO GET THEMES ALL THROUGH THE MOBILE APP
  List<ThemeData> getThemes();

  /// THE SERVICE TO SEND GET REQUEST
  sendGetRequest(endpoint);

  /// POSTS REQUEST SERVICE
  sendPostRequest(body, endpoint);

  /// PATCH REQUEST SERVICE
  sendPatchRequest(body, endpoint, userId);

  /// ERROR HANDLING SERVICE
  Failure handleApiError(DioError e);

  /// THE SERVICE TO FETCH ALL CHANNELS IN AN ORGANIZATION
  /// THIS UNLOCKS BOTH THE PUBLIC AND PRIVATE ONES
  /// YOU CAN FILTER TO GET YOUR DESIRED RESULT
  Future allChannelsList(String currentOrgId, token);

  Future<void> addMemberToChannel(
      String channelId, String orgId, String userId, token);

  /// THE SERVICE TO SEARCH FOR CHANNELS JOINED BY A USER
  /// THIS IS A SERVICE HAVE HAS HELPED WITH FILTERING
  Future joinedChannelsList(String currentOrgId, String currentUserId, token);

  /// THE SERVICE TO FETCH ALL MEMBERS IN AN ORGANIZATIONS
  /// THIS INCLUDES THE ADMINS AND MEMBERS
  Future fetchListOfMembers(String currentOrgId, String channelId, token);

  // Future uploadImage{
  //   File image,(
  //     {required String token,
  //     required String pluginId}
  //   );
  // }

  /// A SERVICE TO SEND PATCH REQUEST TO THE ENDPOINT
  Future<ApiResponse?> patch(String path,
      {Map<String, dynamic>? body, String? token});

  Future<ApiResponse?> delete(String path,
      {Map<String, dynamic>? body, String? token});
}
