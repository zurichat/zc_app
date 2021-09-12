import 'package:dio/dio.dart';
import 'package:hng/utilities/api_utils.dart';

import 'api.dart';
import '../../../../models/api_response.dart';
import 'dio_interceptors.dart';

class HttpApi implements Api {

  // TODO: Uncomment the header and input your token
  HttpApi() {
    _dio.interceptors.add(DioInterceptor());
    _dio.options.sendTimeout = 60000;
    _dio.options.receiveTimeout = 60000;
    _dio.options.baseUrl = 'https://api.zuri.chat/';
    // _dio.options.headers = {'Authorization': 'Bearer $token'};
  }

  final Dio _dio = Dio();

  @override
  Future<ApiResponse?> get(String path,
      {Map<String, dynamic>? data, Map<String, dynamic>? headers}) async {
    try {
      Response res = await _dio.get(path,
          queryParameters: data, options: Options(headers: headers));
      return ApiUtils.toApiResponse(res);
    } on DioError catch (e) {
      print(e);
    }
  }

  @override
  Future<ApiResponse?> post(String path,
      {Map<String, dynamic>? data, Map<String, dynamic>? headers}) async {
    try {
      Response res =
          await _dio.post(path, data: data, options: Options(headers: headers));
      return ApiUtils.toApiResponse(res);
    } on DioError catch (e) {
      print(e);
    }
  }

  @override
  Future<ApiResponse?> put(String path,
      {Map<String, dynamic>? data, Map<String, dynamic>? headers}) async {
    try {
      Response res =
          await _dio.put(path, data: data, options: Options(headers: headers));
      return ApiUtils.toApiResponse(res);
    } on DioError catch (e) {
      print(e);
    }
  }

  @override
  Future<ApiResponse?> delete(String path,
      {Map<String, dynamic>? data, Map<String, dynamic>? headers}) async {
    try {
      Response res = await _dio.delete(path,
          data: data, options: Options(headers: headers));
      return ApiUtils.toApiResponse(res);
    } on DioError catch (e) {
      print(e);
    }
  }
}
