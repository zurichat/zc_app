
import 'package:dio/dio.dart';
import 'package:hng/app/app.logger.dart';

class DioInterceptor implements Interceptor {
  final log = getLogger("DioInterceptor");

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    log.i('ENDPOINT: ' + err.requestOptions.uri.toString());
    log.i('STATUSCODE: ' + err.error.toString());
    log.i('MESSAGE: ' + (err.response?.data ?? err.message).toString());
    handler.next(err);
  }

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    log.i('METHOD: ' + options.method);
    log.i('ENDPOINT: ' + options.uri.toString());
    // log('HEADERS: ' + options.headers.toString());
    log.i('DATA: ' + (options.data ?? options.queryParameters).toString());
    handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    log.i('ENDPOINT: ' + response.requestOptions.uri.toString());
    log.i('STATUSCODE: ' + response.statusCode.toString());
    log.i('DATA: ' + response.data.toString());
    handler.next(response);
  }
}
