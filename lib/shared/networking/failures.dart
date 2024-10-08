abstract class NetworkException {
  final String message;

  const NetworkException(this.message);
}

class UnAuthorizedFailure extends NetworkException {
  UnAuthorizedFailure(super.message);
}

class BadRequest extends NetworkException {
  BadRequest(super.message);
}

class SuccessfulRequest extends NetworkException {
  SuccessfulRequest(super.message);
}

class UnknownErrorException extends NetworkException {
  UnknownErrorException(super.message);
}

class NotFoundException extends NetworkException {
  NotFoundException(super.message);
}

class AccessDeniedException extends NetworkException {
  AccessDeniedException(super.message);
}

class AlreadyExistException extends NetworkException {
  AlreadyExistException(super.message);
}

class InternalServerError extends NetworkException {
  InternalServerError(super.message);
}

class RedirectException extends NetworkException {
  RedirectException(super.message);
}

class NoInternetError extends NetworkException {
  NoInternetError(super.message);
}
