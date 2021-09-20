import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hng/app/app.locator.dart';
import 'package:hng/app/app.router.dart';
import 'package:hng/general_widgets/app_toast.dart';

import 'package:hng/package/base/server-request/api/http_api.dart';
import 'package:hng/services/connectivity_service.dart';
import 'package:hng/services/local_storage_services.dart';
import 'package:hng/utilities/enums.dart';
import 'package:hng/utilities/storage_keys.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

ProfileModel stuff = new ProfileModel();

String? cool;
bool empty = true;

class EditProfileViewModel extends BaseViewModel {
  final snackbar = locator<SnackbarService>();
  final navigationService = locator<NavigationService>();
  final connectivityService = locator<ConnectivityService>();
  final _api = HttpApiService('https://api.zuri.chat/');
  TextEditingController fullNameEd =
      TextEditingController(text: stuff.firstName);
  TextEditingController displayNameEd =
      TextEditingController(text: "Backend for this doesn't exist");
  TextEditingController statusEd = TextEditingController(text: stuff.status);
  TextEditingController phoneNumEd =
      TextEditingController(text: "Backend for this doesn't exist");
  void test() async {
    notifyListeners();
  }

  String? photoUrl = stuff.bio;
  String? get url => photoUrl;

  String? name = stuff.firstName;
  String? get userName => name;

  String? displayName = stuff.displayName;
  String? get dispName => dispName;

  String? phoneNum = stuff.phoneNumber;
  String? get phoneNo => phoneNum;

  String? profileText =
      stuff.status ?? "I'm involved in an illegeal ammount of cruise";
  String? get status => profileText;
  final _navigationService = locator<NavigationService>();

  void getUserData(String userId) {}

  void exitPage() {
    _navigationService.back();
  }

  Future fetchUser() async {
    try {
      if (!await connectivityService.checkConnection()) {
        AppToast.instance.message(null, 'Check your internet connection');
        return;
      }
      setBusy(true);
      stuff = await UserProfileApi().currentUser();
      setBusy(false);
    } catch (e) {
      AppToast.instance.error(null, 'Error Occured');
    }
  }

  final storageService = locator<SharedPreferenceLocalStorage>();
  Future updateProfile() async {
    String? orgId = storageService.getString(StorageKeys.currentOrgId);
    String? userId = storageService.getString(StorageKeys.currentUserId);
    //TODO CHange these links to there rightful values once they can be updated
    //I interchanged most calls because at the point of writing they did not have their patch call
    String link =
        'organizations/61459d8e62688da5302acdb1/members/614729a2f41cb684cc531ac7/photo';

    final editData = {
      'image_url': fullNameEd.text,
    };
    final res = await _api.patch(link, data: editData, headers: {
      'Authorization':
          'Bearer ${storageService.getString(StorageKeys.currentSessionToken)}'
    });
    final snackbar = locator<SnackbarService>();
    if (res!.statusCode == 200) {
      snackbar.showCustomSnackBar(
        duration: const Duration(seconds: 5),
        variant: SnackbarType.success,
        message: ''' Profile Update Was Successful'''
            ''' Please Close and Open The Edit Profile Page twice to see changes ''',
      );
    } else {
      snackbar.showCustomSnackBar(
        duration: const Duration(seconds: 3),
        variant: SnackbarType.failure,
        message: ''' Profile Update failed''',
      );
    }

    String link1 =
        'organizations/61459d8e62688da5302acdb1/members/614729a2f41cb684cc531ac7/profile';

    final editData1 = {
      'data': displayNameEd.text,
    };
    final res1 = await _api.patch(link1, data: editData1, headers: {
      'Authorization':
          'Bearer ${storageService.getString(StorageKeys.currentSessionToken)}'
    });

    String link2 =
        'organizations/61459d8e62688da5302acdb1/members/614729a2f41cb684cc531ac7/phone';

    final editData2 = {
      'phone': phoneNumEd.text,
    };
    final res2 = await _api.patch(link2, data: editData2, headers: {
      'Authorization':
          'Bearer ${storageService.getString(StorageKeys.currentSessionToken)}'
    });

    String link3 =
        'organizations/61459d8e62688da5302acdb1/members/614729a2f41cb684cc531ac7/status';

    final editData3 = {
      'status': statusEd.text,
    };
    final res3 = await _api.patch(link3, data: editData3, headers: {
      'Authorization':
          'Bearer ${storageService.getString(StorageKeys.currentSessionToken)}'
    });
  }
}

class ProfileModel {
  String? userId;
  String? firstName;
  String? lastName;
  String? displayName;
  String? email;
  String? phoneNumber;
  String? status;
  String? bio;
  ProfileModel({
    this.userId,
    this.firstName,
    this.lastName,
    this.displayName,
    this.email,
    this.phoneNumber,
    this.status,
    this.bio,
  });

  factory ProfileModel.fromJson(Map<String, dynamic> json) {
    String object = json['userId'].toString();

    return ProfileModel(
        displayName: json['display_name'].toString(),
        userId: json['_id'].toString(),
        status: json['status'].toString(),
        phoneNumber: json['phone'].toString(),
        email: json['email'].toString(),
        bio: json['bio'],
        firstName: json['name'].toString());
  }
}

// User _currentUserFromSnapshot(DocumentSnapshot snapshot) {
//     return User(
//         name: snapshot.data()['name'] ?? 'No Name',
//         uid: snapshot.data()['uid'] ?? null,
//         imageUrl: snapshot.data()['imageUrl'] ?? null);
class UserProfileApi {
  final _api = HttpApiService('https://api.zuri.chat/');

  final storageService = locator<SharedPreferenceLocalStorage>();

  /// Fetches info the
  Future<ProfileModel> currentUser() async {
    String? orgId = storageService.getString(StorageKeys.currentOrgId);
    String? userId = storageService.getString(StorageKeys.currentUserId);
    String link =
        'organizations/61459d8e62688da5302acdb1/members/614729a2f41cb684cc531ac7';

    final res = await _api.get(link, headers: {
      'Authorization':
          'Bearer ${storageService.getString(StorageKeys.currentSessionToken)}'
    });
    final snackbar = locator<SnackbarService>();
    if (res!.statusCode == 200) {
      snackbar.showCustomSnackBar(
        duration: const Duration(seconds: 5),
        variant: SnackbarType.success,
        message: ''' Profile Loaded  Successfully'''
            '''  Please Exit The Edit Profile Page Then Open It Once More ''',
      );
      return ProfileModel(
          firstName: res.data?['data']['image_url'],
          displayName: res.data?['data']['profile'],
          status: res.data?['data']['status']);
    } else {
      snackbar.showCustomSnackBar(
        duration: const Duration(seconds: 3),
        variant: SnackbarType.failure,
        message: ''' Profile Load failed''',
      );
      return ProfileModel(
          firstName: res.data?['data']['image_url'],
          displayName: res.data?['data']['profile'],
          status: res.data?['data']['status']);
    }
  }
}
