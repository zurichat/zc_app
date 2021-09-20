import '../../../../models/api_response.dart';

abstract class Api {
  Future<ApiResponse?> get(String path,
      {Map<String, dynamic>? data, Map<String, dynamic>? headers});
  Future<ApiResponse?> post(String path,
      {Map<String, dynamic>? data, Map<String, dynamic>? headers});
  Future<ApiResponse?> put(String path,
      {Map<String, dynamic>? data, Map<String, dynamic>? headers});
  Future<ApiResponse?> patch(String path,
      {Map<String, dynamic>? data, Map<String, dynamic>? headers});
  Future<ApiResponse?> delete(String path,
      {Map<String, dynamic>? data, Map<String, dynamic>? headers});
}
