class BadCredentialsException implements Exception {}

class ServerException implements Exception {}

class Failure {
  final String message;

  Failure(this.message);

  @override
  String toString() => message;
}
