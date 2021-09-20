class ApiResponse {
  final int? statusCode;
  final String? statusMessage;
  final dynamic data;

  ApiResponse({this.statusCode, this.statusMessage, this.data});

  @override
  String toString() {
    return '$data';
  }
}
