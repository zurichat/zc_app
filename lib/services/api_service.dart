import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';

import '../ui/shared/constants.dart';
import '../utilities/exceptions.dart';
import '../utilities/failures.dart';

class ApiService {
  final String baseUrl = apiBaseUrl;

  final String _token = '';

  Map<String, String> get jsonHeadersWithoutToken => {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
      };

  Map<String, String> get jsonHeaders => {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'x-access-token': '${_token}',
      };

  // ignore: always_declare_return_types
  _processRequest(Future<http.Response> request) async {
    final response = await request.catchError((_) => throw NetworkException());

    return _checkForError(response);
  }

  ///Send a http *GET* request to "`$baseUrl$`[endpoint]"
  ///
  ///[useToken] determines whether to add Authorisation token
  ///to request headers.
  Future<Map<String, dynamic>> sendGet({
    required String endpoint,
    bool useToken = true,
  }) {
    final url = Uri.parse('$baseUrl$endpoint');
    final request = http.get(
      url,
      headers: useToken ? jsonHeaders : jsonHeadersWithoutToken,
    );
    return _processRequest(request);
  }

  ///Send a http *POST* request to "`$baseUrl$`[endpoint]".
  ///[payload] is encoded and sent as request body.
  ///
  ///[useToken] determines whether to add Authorisation token
  ///to request headers.
  Future<Map<String, dynamic>> sendPost({
    required String endpoint,
    required Map<String, dynamic> payload,
    bool useToken = true,
  }) async {
    final url = Uri.parse('$baseUrl$endpoint');
    final body = jsonEncode(payload);
    final request = http.post(
      url,
      body: body,
      headers: useToken ? jsonHeaders : jsonHeadersWithoutToken,
    );
    return _processRequest(request);
  }

  ///Send a http *PATCH* request to "`$baseUrl$`[endpoint]".
  ///[payload] is encoded and sent as request body.
  ///
  ///[useToken] determines whether to add Authorisation token
  ///to request headers.
  Future<Map<String, dynamic>> sendPatch({
    required String endpoint,
    required Map<String, dynamic> payload,
    bool useToken = true,
  }) async {
    final url = Uri.parse('$baseUrl$endpoint');
    final body = jsonEncode(payload);
    final request = http.patch(
      url,
      body: body,
      headers: useToken ? jsonHeaders : jsonHeadersWithoutToken,
    );
    return _processRequest(request);
  }

  ///Send a http *PUT* request to "`$baseUrl$`[endpoint]".
  ///[payload] is encoded and sent as request body.
  ///
  ///[useToken] determines whether to add Authorisation token
  ///to request headers.
  Future sendPut({
    required String endpoint,
    required Map<String, dynamic> payload,
    bool useToken = true,
  }) async {
    final url = Uri.parse('$baseUrl$endpoint');
    final body = jsonEncode(payload);
    final request = http.put(
      url,
      body: body,
      headers: useToken ? jsonHeaders : jsonHeadersWithoutToken,
    );
    return _processRequest(request);
  }

  ///Send a http *MULTIPART* request to "`$baseUrl$`[endpoint]"
  ///with [imageKey] as [image].
  ///
  ///Map key and value in [fields] are added to the request if !null or empty
  ///Authorisation token is added to request headers.
  Future<Map<String, dynamic>> sendImageFile({
    required File image,
    required String imageKey,
    required String endpoint,
    Map<String, dynamic> fields = const {},
  }) async {
    // Make request variable with url
    final request = http.MultipartRequest(
      'POST',
      Uri.parse('$baseUrl$endpoint'),
    );
// Add authorisation header to request variable
    request.headers
        .putIfAbsent('Authorization', () => jsonHeaders['Authorization']!);
// Add the image file to request variable as imageKey
    request.files.add(await http.MultipartFile.fromPath(
      '$imageKey',
      image.path,
      contentType: MediaType('image', 'jpeg'),
    ));
// If other fields exist, add them to the request
    if (fields.isNotEmpty) {
      fields.forEach((key, value) {
        request.fields[key] = value;
      });
    }
// Send the request and receive a stream as response
//     final responseStream = await (request.send());
// Convert the stream returned to regular response
    final multipartRequest = http.Response.fromStream(await request.send());
    return _processRequest(multipartRequest);
  }

  dynamic _checkForError(response) {
    switch (response.statusCode) {
      case 200:
        return jsonDecode(response.body);

      case 403:
        return BadAuthFailure(errorMessage: response.statusText);
      case 500:
        return ServerFailure(error: response.statusText);
      default:
        return InputFailure(errorMessage: response.statusText);
    }
  }
}
