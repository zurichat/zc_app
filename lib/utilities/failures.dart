import 'exceptions.dart';

abstract class Failure {}

class ServerFailure implements Failure {
  final String? error;
  ServerFailure({this.error});
}

class InputFailure implements Failure {
  final String? errorMessage;
  InputFailure({required this.errorMessage});
}

class BadAuthFailure implements Failure {
  final String? errorMessage;
  BadAuthFailure({this.errorMessage});
}

class NetworkFailure implements Failure {}

class UnknownFailure implements Failure {}

Failure convertException(e) {
  if (e is InputException)
    return InputFailure(errorMessage: e.errorMessage);
  else if (e is ServerException)
    return ServerFailure(error: e.errorMessage);
  else if (e is UnauthorisedException)
    return BadAuthFailure(errorMessage: e.errorMessage);
  else if (e is NetworkException)
    return NetworkFailure();
  else
    return UnknownFailure();
}
