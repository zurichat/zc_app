class ServerException implements Exception {
  final String errorMessage;
  ServerException({required this.errorMessage});
}

class InputException implements Exception {
  final String errorMessage;
  InputException({required this.errorMessage});
}

class UnauthorisedException implements Exception {
  final String errorMessage;
  UnauthorisedException({required this.errorMessage});
}

class NetworkException implements Exception {
  final String errorMessage;
  NetworkException({required this.errorMessage});
}

class UnknownException implements Exception {
  final String errorMessage;
  UnknownException({required this.errorMessage});
}
