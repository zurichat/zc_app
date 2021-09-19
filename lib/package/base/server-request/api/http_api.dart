import 'package:dio/dio.dart';

import '../../../../models/api_response.dart';
import '../../../../utilities/api_utils.dart';
import 'api.dart';
import 'dio_interceptors.dart';

class HttpApiService implements Api {
  HttpApiService(baseUrl) {
    _dio.interceptors.add(DioInterceptor());
    _dio.options.sendTimeout = 60000;
    _dio.options.receiveTimeout = 60000;
    _dio.options.baseUrl = baseUrl;
  }

  final Dio _dio = Dio();

  @override
  Future<ApiResponse?> get(
    String path, {
    Map<String, dynamic>? data,
    Map<String, dynamic>? headers,
  }) async {
    try {
      // print(headers);
      final res = await _dio.get(path,
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
      final res =
          await _dio.post(path, data: data, options: Options(headers: headers));

      return ApiUtils.toApiResponse(res);
    } on DioError catch (e) {
      print(e);
      return ApiUtils.toApiResponse(e.response!);
    }
  }

  @override
  Future<ApiResponse?> put(String path,
      {Map<String, dynamic>? data, Map<String, dynamic>? headers}) async {
    try {
      final res =
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
      final res = await _dio.delete(path,
          data: data, options: Options(headers: headers));
      return ApiUtils.toApiResponse(res);
    } on DioError catch (e) {
      print(e);
    }
  }

  @override
  Future<ApiResponse?> patch(String path,
      {Map<String, dynamic>? data, Map<String, dynamic>? headers}) async {
    try {
      final res = await _dio.patch(path,
          data: data, options: Options(headers: headers));
      return ApiUtils.toApiResponse(res);
    } on DioError catch (e) {
      print(e);
    }
  }
}
