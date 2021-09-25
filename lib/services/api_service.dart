import 'dart:convert';

import 'package:dio/dio.dart';

import '../utilities/constants.dart';
import '../utilities/failures.dart';

class ApiService {
  final Dio _dio = Dio();
  void sendGetRequest(endpoint) async {
    final response = await _dio.get(apiBaseUrl + endpoint);
    final result = jsonDecode(response.data);
    return result;
  }

  Future sendPostRequest(body, endpoint) async {
    try {
      final response = await _dio.post(
        apiBaseUrl + endpoint,
        data: json.encode(body),
      );

      final result = response.data;
      return result;
    } on DioError catch (e) {
      convertException(e);
    }
  }

//!Adjust the patch function as needed
  Future sendPatchRequest(body, endpoint, userId) async {
    try {
      final response =
          await _dio.patch(apiBaseUrl + endpoint, data: json.encode(body));
      final result = response.data;
      return result;
    } on DioError catch (e) {
      convertException(e);
    }
  }

  Future getAddPeople(body, endpoint, userId, channel_id, org_id) async {
    try {
      final response =
      await _dio.get(apiBaseUrl + endpoint);
      final result = response.data;
      return result;
    } on DioError catch (e) {
      convertException(e);
    }
  }


  Failure convertException(DioError e) {
    if (e.type == DioErrorType.cancel)
      return InputFailure(errorMessage: e.message);
    else if (e.type == DioErrorType.connectTimeout)
      return NetworkFailure();
    else if (e.type == DioErrorType.receiveTimeout)
      return NetworkFailure();
    else if (e.type == DioErrorType.sendTimeout)
      return NetworkFailure();
    else if (e.type == DioErrorType.response)
      return ServerFailure(error: e.message);
    else if (e.type == DioErrorType.other)
      return UnknownFailure();
    else
      return UnknownFailure();
  }





}
