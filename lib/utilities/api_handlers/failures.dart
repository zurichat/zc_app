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
