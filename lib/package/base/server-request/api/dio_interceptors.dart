import 'dart:developer';

import 'package:dio/dio.dart';

class DioInterceptor implements Interceptor {
  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    log('ENDPOINT: ' + err.requestOptions.uri.toString());
    log('STATUSCODE: ' + err.error.toString());
    log('STATUSCODE: ' +
        (err.response?.data ?? err.message).toString());
  }

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    log('METHOD: ' + options.method);
    log('ENDPOINT: ' + options.uri.toString());
    log('DATA: ' + (options.data ?? options.queryParameters).toString());
    handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    log('ENDPOINT: ' + response.requestOptions.uri.toString());
    log('STATUSCODE: ' + response.statusCode.toString());
    print('DATA: ' + response.data.toString());
    handler.next(response);
  }
}
