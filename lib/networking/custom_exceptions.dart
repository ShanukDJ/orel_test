
class CustomException implements Exception {
  final _message;
  final _prefix;

  CustomException([this._message, this._prefix]);

  @override
  String toString() {
    return "$_prefix$_message";
  }
}

class FetchDataException extends CustomException {
  FetchDataException([String? message]): super(message, "Error During Communication");
}

class BadRequestException extends CustomException {
  BadRequestException([message]) : super(message, "Invalid request");
}

class UnauthorisedException extends CustomException {
  UnauthorisedException([message]) : super(message, "Unauthorized");
}

class InvalidInputException extends CustomException {
  InvalidInputException([String? message]) : super(message, "Invalid Input");
}

class ServerError extends CustomException {
  ServerError([String? message]) : super(message, "");
}

class IPAddress extends CustomException {
  IPAddress([String? message]) : super(message, "Set Server IP");
}